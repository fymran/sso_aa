# app/team.py
from flask import Blueprint, render_template, request, redirect, url_for, flash
from db_config import get_db_connection

team_bp = Blueprint('team', __name__)

# Route to display assign team page
@team_bp.route('/assign_team/<int:member_id>', methods=['GET', 'POST'])
def assign_team(member_id):
    conn = get_db_connection()
    cursor = conn.cursor()

    if request.method == 'POST':
        wilayahID = request.form['wilayahID']

        # Get all ifesIDs associated with the selected wilayahID
        cursor.execute('SELECT ifesID FROM IFES WHERE wilayahID = %s', (wilayahID,))
        ifes_ids = cursor.fetchall()

        # Assign the memberID to all ifesID in the selected wilayah
        for ifesID in ifes_ids:
            cursor.execute('INSERT INTO TEAM (ifesID, memberID) VALUES (%s, %s)', (ifesID[0], member_id))

        conn.commit()

        flash(f'Member successfully assigned to all IFES leaders in Wilayah {wilayahID}!')
        cursor.close()
        conn.close()

        return redirect(url_for('members.members'))

    # Fetch all wilayahs for the dropdown
    cursor.execute('SELECT wilayahID, wilayahName FROM WILAYAH')
    wilayahs = cursor.fetchall()

    cursor.close()
    conn.close()

    return render_template('assign_team.html', member_id=member_id, wilayahs=wilayahs)

# Get IFES leaders based on selected wilayah (AJAX)
@team_bp.route('/get_ifes_leaders/<string:wilayah_id>')
def get_ifes_leaders(wilayah_id):
    conn = get_db_connection()
    cursor = conn.cursor()

    # Fetch all IFES leaders under the selected wilayah
    cursor.execute('SELECT ifesID, ifesName FROM IFES WHERE wilayahID = %s', (wilayah_id,))
    ifes_leaders = cursor.fetchall()

    cursor.close()
    conn.close()

    # Build the list of IFES leaders dynamically
    if ifes_leaders:
        list_html = '<ul>'
        for ifes in ifes_leaders:
            list_html += f'<li>{ifes[1]}</li>'
        list_html += '</ul>'
    else:
        list_html = '<p>No IFES leaders found for this wilayah.</p>'

    return list_html

# View assignments for a member
@team_bp.route('/view_assignments/<int:member_id>')
def view_assignments(member_id):
    conn = get_db_connection()
    cursor = conn.cursor()

    # Fetch the member details
    cursor.execute('SELECT memberEmail FROM MEMBER WHERE memberID = %s', (member_id,))
    member = cursor.fetchone()

    # Fetch all IFES leaders assigned to the member
    cursor.execute('''
        SELECT I.ifesID, I.ifesName 
        FROM TEAM T 
        JOIN IFES I ON T.ifesID = I.ifesID 
        WHERE T.memberID = %s
    ''', (member_id,))
    assignments = cursor.fetchall()

    cursor.close()
    conn.close()

    return render_template('view_assignments.html', member=member, assignments=assignments)
