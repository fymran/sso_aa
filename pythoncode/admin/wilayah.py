from flask import session, Blueprint, render_template, request, redirect, url_for, flash
from db_config import get_db_connection

wilayah_bp = Blueprint('wilayah', __name__)

@wilayah_bp.before_request
def restrict_to_admin():
    if 'admin' not in session:
        flash('Please log in to access the admin panel.')
        return redirect(url_for('login'))

# View all Wilayah entries
@wilayah_bp.route('/wilayah')
def wilayah_list():
    conn = get_db_connection()
    cursor = conn.cursor()

    # Fetch all Wilayah records
    cursor.execute('SELECT wilayahID, wilayahCode, wilayahName, stateCode FROM WILAYAH')
    wilayah_records = cursor.fetchall()

    cursor.execute('SELECT stateCode FROM STATE')
    state_records = cursor.fetchall()

    cursor.close()
    conn.close()
    return render_template('admin/wilayah.html', wilayahs=wilayah_records, states=state_records)

# Add a new Wilayah
@wilayah_bp.route('/add_wilayah', methods=['POST'])
def add_wilayah():
    conn = get_db_connection()
    cursor = conn.cursor()

    wilayahCode = request.form['wilayahCode']
    wilayahName = request.form['wilayahName']
    stateCode = request.form['stateCode']
    if wilayahCode and wilayahName and stateCode:
        # Insert the new Wilayah into the database
        cursor.execute('INSERT INTO WILAYAH (wilayahCode, wilayahName, stateCode) VALUES (%s, %s, %s)', (wilayahCode, wilayahName, stateCode))
        conn.commit()
        cursor.close()
        conn.close()

        flash('New Wilayah added successfully!')
    return redirect(url_for('wilayah.wilayah_list'))

# Edit an existing Wilayah
@wilayah_bp.route('/edit_wilayah/<int:wilayahID>', methods=['POST'])
def edit_wilayah(wilayahID):
    conn = get_db_connection()
    cursor = conn.cursor()
    wilayahCode = request.form['wilayahCode']
    wilayahName = request.form['wilayahName']
    stateCode = request.form['stateCode']
    if wilayahCode and wilayahName and stateCode:
        # Update the Wilayah record
        cursor.execute('UPDATE WILAYAH SET wilayahCode = %s, wilayahName = %s, stateCode = %s WHERE wilayahID = %s', (wilayahCode, wilayahName, stateCode, wilayahID))
        conn.commit()
        cursor.close()
        conn.close()

        flash('Wilayah updated successfully!')
    return redirect(url_for('wilayah.wilayah_list'))

# Delete a Wilayah
@wilayah_bp.route('/delete_wilayah/<int:wilayahID>', methods=['POST'])
def delete_wilayah(wilayahID):
    conn = get_db_connection()
    cursor = conn.cursor()

    # Delete the Wilayah from the database
    cursor.execute('DELETE FROM WILAYAH WHERE wilayahID = %s', (wilayahID,))
    conn.commit()

    cursor.close()
    conn.close()

    flash('Wilayah deleted successfully!')
    return redirect(url_for('wilayah.wilayah_list'))
