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
@members_bp.route('/add_member', methods=['GET', 'POST'])
def add_member():
    if request.method == 'POST':
        email = request.form['email']
        execute_query('INSERT INTO MEMBER (memberEmail) VALUES (%s)', (email,))
        flash('New member added successfully!')
        return redirect(url_for('members.members'))
    
    return render_template('admin/add_member.html')

# Edit a member
@members_bp.route('/edit_member/<int:member_id>', methods=['GET', 'POST'])
def edit_member(member_id):
    if request.method == 'POST':
        email = request.form.get('email')
        if email:
            execute_query('UPDATE MEMBER SET memberEmail = %s WHERE memberID = %s', (email, member_id))
            flash('Member updated successfully!')
            return redirect(url_for('members.members'))

    member = execute_query('SELECT * FROM MEMBER WHERE memberID = %s', (member_id,), fetch=True)[0]
    return render_template('admin/edit_member.html', member=member)

# Delete a member
@members_bp.route('/delete_member/<int:member_id>', methods=['POST'])
def delete_member(member_id):
    execute_query('DELETE FROM MEMBER WHERE memberID = %s', (member_id,))
    flash('Member deleted successfully!')
    return redirect(url_for('members.members'))
