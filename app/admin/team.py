# app/team.py
from flask import session, Blueprint, render_template, request, redirect, url_for, flash
from db_config import get_db_connection

team_bp = Blueprint('team', __name__)

@team_bp.before_request
def restrict_to_admin():
    if 'admin' not in session:
        flash('Please log in to access the admin panel.')
        return redirect(url_for('login'))

# Helper function for query execution
def execute_query(query, args=None, fetch=False):
    """Executes a SQL query and optionally fetches results."""
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute(query, args or ())
    result = cursor.fetchall() if fetch else None
    conn.commit()
    cursor.close()
    conn.close()
    return result

# Route to display assign team page
@team_bp.route('/assign_team/<int:member_id>', methods=['GET', 'POST'])
def assign_team(member_id):
    if request.method == 'POST':
        wilayahID = request.form['wilayahID']
        
        # Get all IFES IDs associated with the selected wilayahID
        ifes_ids = execute_query('SELECT ifesID FROM IFES WHERE wilayahID = %s', (wilayahID,), fetch=True)

        # Assign the memberID to all IFES IDs in the selected wilayah
        for ifesID in ifes_ids:
            execute_query('INSERT INTO TEAM (ifesID, memberID) VALUES (%s, %s)', (ifesID[0], member_id))

        flash(f'Member successfully assigned to all IFES leaders in Wilayah {wilayahID}!')
        return redirect(url_for('members.members'))

    # Fetch all wilayahs for the dropdown
    wilayahs = execute_query('SELECT wilayahID, wilayahName FROM WILAYAH', fetch=True)
    return render_template('admin/assign_team.html', member_id=member_id, wilayahs=wilayahs)

# Get IFES leaders based on selected wilayah (AJAX)
@team_bp.route('/get_ifes_leaders/<string:wilayah_id>')
def get_ifes_leaders(wilayah_id):
    ifes_leaders = execute_query('SELECT ifesID, ifesName FROM IFES WHERE wilayahID = %s', (wilayah_id,), fetch=True)

    # Build the list of IFES leaders dynamically
    if ifes_leaders:
        list_html = '<ul>' + ''.join([f'<li>{ifes[1]}</li>' for ifes in ifes_leaders]) + '</ul>'
    else:
        list_html = '<p>No IFES leaders found for this wilayah.</p>'

    return list_html

# View assignments for a member
@team_bp.route('/view_assignments/<int:member_id>')
def view_assignments(member_id):
    # Fetch the member details
    member = execute_query('SELECT memberEmail FROM MEMBER WHERE memberID = %s', (member_id,), fetch=True)[0]

    # Fetch all IFES leaders assigned to the member
    assignments = execute_query('''
        SELECT I.ifesID, I.ifesName 
        FROM TEAM T 
        JOIN IFES I ON T.ifesID = I.ifesID 
        WHERE T.memberID = %s
    ''', (member_id,), fetch=True)

    return render_template('admin/view_assignments.html', member=member, assignments=assignments)
