from flask import session, Blueprint, render_template, request, redirect, url_for, flash
from db_config import get_db_connection

members_bp = Blueprint('members', __name__)

@members_bp.before_request
def restrict_to_admin():
    if 'admin' not in session:
        flash('Please log in to access the admin panel.')
        return redirect(url_for('login'))
    
@members_bp.route('/members')
def members():
    conn = get_db_connection()
    cursor = conn.cursor()

    # Fetch all member records
    cursor.execute('SELECT * FROM MEMBER')
    members = cursor.fetchall()

    cursor.close()
    conn.close()

    return render_template('members.html', members=members)

# Add a new member
@members_bp.route('/add_member', methods=['GET', 'POST'])
def add_member():
    if request.method == 'POST':
        email = request.form['email']

        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute('INSERT INTO MEMBER (memberEmail) VALUES (%s)', (email,))
        conn.commit()

        cursor.close()
        conn.close()

        flash('New member added successfully!')
        return redirect(url_for('members.members'))

    return render_template('add_member.html')

# Edit a member
@members_bp.route('/edit_member/<int:member_id>', methods=['GET', 'POST'])
def edit_member(member_id):
    conn = get_db_connection()
    cursor = conn.cursor()

    if request.method == 'POST':
        email = request.form.get('email')

        if email:
            cursor.execute('UPDATE MEMBER SET memberEmail = %s WHERE memberID = %s', (email, member_id))
            conn.commit()

            flash('Member updated successfully!')
            return redirect(url_for('members.members'))

    cursor.execute('SELECT * FROM MEMBER WHERE memberID = %s', (member_id,))
    member = cursor.fetchone()

    cursor.close()
    conn.close()

    return render_template('edit_member.html', member=member)

# Delete a member
@members_bp.route('/delete_member/<int:member_id>', methods=['POST'])
def delete_member(member_id):
    conn = get_db_connection()
    cursor = conn.cursor()

    cursor.execute('DELETE FROM MEMBER WHERE memberID = %s', (member_id,))
    conn.commit()

    cursor.close()
    conn.close()

    flash('Member deleted successfully!')
    return redirect(url_for('members.members'))
