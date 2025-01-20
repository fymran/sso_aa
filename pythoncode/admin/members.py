from flask import session, Blueprint, render_template, request, redirect, url_for, flash
from db_config import get_db_connection

members_bp = Blueprint('members', __name__)

@members_bp.before_request
def restrict_to_admin():
    if 'admin' not in session:
        flash('Please log in to access the admin panel.')
        return redirect(url_for('login'))

# Helper function
def execute_query(query, args=None, fetch=False):
    """Executes a given SQL query and optionally fetches data."""
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute(query, args or ())
    result = cursor.fetchall() if fetch else None
    conn.commit()
    cursor.close()
    conn.close()
    return result 

# View all members
@members_bp.route('/members')
def members():
    members = execute_query('SELECT * FROM MEMBER', fetch=True)
    return render_template('admin/members.html', members=members)

# Add a new member
@members_bp.route('/add_member', methods=['POST'])
def add_member():
    email = request.form['email']
    if email:
        execute_query('INSERT INTO MEMBER (memberEmail) VALUES (%s)', (email,))
        flash('New CC added successfully!')
    return redirect(url_for('members.members'))

# Edit a member
@members_bp.route('/edit_member/<int:member_id>', methods=['POST'])
def edit_member(member_id):
    email = request.form['email']
    if email:
        execute_query('UPDATE MEMBER SET memberEmail = %s WHERE memberID = %s', (email, member_id))
        flash('CC updated successfully!')
    return redirect(url_for('members.members'))

# Delete a member
@members_bp.route('/delete_member/<int:member_id>', methods=['POST'])
def delete_member(member_id):
    execute_query('DELETE FROM MEMBER WHERE memberID = %s', (member_id,))
    flash('Member deleted successfully!')
    return redirect(url_for('members.members'))

# Route to display assign team page
@members_bp.route('/assign_team/<int:member_id>', methods=['GET', 'POST'])
def assign_team(member_id):
    if request.method == 'POST':
        wilayahID = request.form['wilayahID']

        # Get all IFES IDs associated with the selected wilayahID
        ifes_ids = execute_query('SELECT ifesID FROM IFES WHERE wilayahID = %s', (wilayahID,), fetch=True)

        # Check and assign the memberID to all IFES IDs in the selected wilayah
        for ifesID in ifes_ids:
            # Check if the combination of ifesID and memberID already exists
            existing = execute_query(
                'SELECT * FROM TEAM WHERE ifesID = %s AND memberID = %s', (ifesID[0], member_id), fetch=True
            )

            if existing:
                flash(f'Error: Member is already assigned to IFES ID {ifesID[0]} in Wilayah {wilayahID}.')
            else:
                execute_query('INSERT INTO TEAM (ifesID, memberID) VALUES (%s, %s)', (ifesID[0], member_id))
                flash(f'Member successfully assigned to IFES ID {ifesID[0]} in Wilayah {wilayahID}!')

    # Fetch all wilayahs for the dropdown
    wilayahs = execute_query('SELECT wilayahID, wilayahName FROM WILAYAH', fetch=True)
    return render_template('admin/assign_team.html', member_id=member_id, wilayahs=wilayahs)

# Get IFES leaders based on selected wilayah (AJAX)
@members_bp.route('/get_ifes_leaders/<string:wilayah_id>')
def get_ifes_leaders(wilayah_id):
    ifes_leaders = execute_query('SELECT ifesID, ifesName FROM IFES WHERE wilayahID = %s', (wilayah_id,), fetch=True)

    # Build the list of IFES leaders dynamically
    if ifes_leaders:
        list_html = '<ul>' + ''.join([f'<li>{ifes[1]}</li>' for ifes in ifes_leaders]) + '</ul>'
    else:
        list_html = '<p>No IFES found for this wilayah.</p>'

    return list_html
