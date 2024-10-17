from flask import Blueprint, render_template, request, redirect, url_for, flash
from db_config import get_db_connection

ifes_bp = Blueprint('ifes', __name__)

# View all IFES entries
@ifes_bp.route('/ifes')
def ifes_list():
    conn = get_db_connection()
    cursor = conn.cursor()
    
    # Join the IFES and WILAYAH table to get wilayahName and wilayahCode
    query = """
    SELECT IFES.ifesID, IFES.ifesName, IFES.ifesEmail, WILAYAH.wilayahName, WILAYAH.wilayahCode 
    FROM IFES
    left JOIN WILAYAH ON IFES.wilayahID = WILAYAH.wilayahID
    """
    cursor.execute(query)
    ifes_records = cursor.fetchall()
    
    cursor.close()
    conn.close()
    
    return render_template('ifes.html', ifes=ifes_records)

# Add a new IFES
@ifes_bp.route('/add_ifes', methods=['GET', 'POST'])
def add_ifes():
    conn = get_db_connection()
    cursor = conn.cursor()

    if request.method == 'POST':
        ifesName = request.form['ifesName']
        ifesEmail = request.form['ifesEmail']
        wilayahID = request.form['wilayahID']

        cursor.execute('INSERT INTO IFES (ifesName, ifesEmail, wilayahID) VALUES (%s, %s, %s)', (ifesName, ifesEmail, wilayahID))
        conn.commit()
        cursor.close()
        conn.close()
        flash('New IFES added successfully!')
        return redirect(url_for('ifes.ifes_list'))

    # Fetch all wilayah to show in the select dropdown
    cursor.execute('SELECT wilayahID, wilayahCode, wilayahName FROM WILAYAH')
    wilayah_records = cursor.fetchall()

    cursor.close()
    conn.close()

    # Render the form and pass the wilayah data to the template
    return render_template('add_ifes.html', wilayahs=wilayah_records)

# Edit IFES
@ifes_bp.route('/edit_ifes/<int:ifesID>', methods=['GET', 'POST'])
def edit_ifes(ifesID):
    conn = get_db_connection()
    cursor = conn.cursor()
    
    if request.method == 'POST':
        ifesName = request.form['ifesName']
        ifesEmail = request.form['ifesEmail']
        wilayahID = request.form['wilayahID']
        
        cursor.execute('UPDATE IFES SET ifesName = %s, ifesEmail = %s, wilayahID = %s WHERE ifesID = %s', (ifesName, ifesEmail, wilayahID, ifesID))
        conn.commit()
        flash('IFES updated successfully!')
        return redirect(url_for('ifes.ifes_list'))
    
    # Fetch the IFES data
    cursor.execute('SELECT * FROM IFES WHERE ifesID = %s', (ifesID,))
    ifes = cursor.fetchone()
    
    # Fetch all wilayah data for the select dropdown
    cursor.execute('SELECT wilayahID, wilayahName, wilayahCode FROM WILAYAH')
    wilayah_records = cursor.fetchall()

    cursor.close()
    conn.close()
    
    return render_template('edit_ifes.html', ifes=ifes, wilayahs=wilayah_records)

# Delete IFES
@ifes_bp.route('/delete_ifes/<int:ifesID>', methods=['POST'])
def delete_ifes(ifesID):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute('DELETE FROM IFES WHERE ifesID = %s', (ifesID,))
    conn.commit()
    cursor.close()
    conn.close()
    flash('IFES deleted successfully!')
    
    return redirect(url_for('ifes.ifes_list'))
