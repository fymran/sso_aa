from flask import session, Blueprint, render_template, request, redirect, url_for, flash
from db_config import get_db_connection

zone_bp = Blueprint('zone', __name__)

@zone_bp.before_request
def restrict_to_admin():
    if 'admin' not in session:
        flash('Please log in to access the admin panel.')
        return redirect(url_for('login'))

# View all Zone entries
@zone_bp.route('/zone')
def zone_list():
    conn = get_db_connection()
    cursor = conn.cursor()

    # Fetch all Zone records along with their associated Wilayah names
    cursor.execute('''
        SELECT Z.zoneID, Z.zoneName, W.wilayahName 
        FROM ZONE Z
        LEFT JOIN WILAYAH W ON Z.wilayahID = W.wilayahID
    ''')
    zone_records = cursor.fetchall()

    cursor.close()
    conn.close()
    return render_template('admin/zone.html', zones=zone_records)

# Add a new Zone
@zone_bp.route('/add_zone', methods=['GET', 'POST'])
def add_zone():
    conn = get_db_connection()
    cursor = conn.cursor()

    if request.method == 'POST':
        zoneName = request.form['zoneName']
        wilayahID = request.form['wilayahID']

        # Insert the new Zone into the database
        cursor.execute('INSERT INTO ZONE (zoneName, wilayahID) VALUES (%s, %s)', (zoneName, wilayahID))
        conn.commit()

        cursor.close()
        conn.close()

        flash('New Zone added successfully!')
        return redirect(url_for('zone.zone_list'))

    # Fetch all Wilayahs to populate the dropdown
    cursor.execute('SELECT wilayahID, wilayahName FROM WILAYAH')
    wilayahs = cursor.fetchall()

    cursor.close()
    conn.close()
    return render_template('admin/add_zone.html', wilayahs=wilayahs)

# Edit an existing Zone
@zone_bp.route('/edit_zone/<int:zoneID>', methods=['GET', 'POST'])
def edit_zone(zoneID):
    conn = get_db_connection()
    cursor = conn.cursor()

    if request.method == 'POST':
        zoneName = request.form['zoneName']
        wilayahID = request.form['wilayahID']

        # Update the Zone record
        cursor.execute('UPDATE ZONE SET zoneName = %s, wilayahID = %s WHERE zoneID = %s', (zoneName, wilayahID, zoneID))
        conn.commit()

        cursor.close()
        conn.close()

        flash('Zone updated successfully!')
        return redirect(url_for('zone.zone_list'))

    # Fetch the current Zone data
    cursor.execute('SELECT zoneID, zoneName, wilayahID FROM ZONE WHERE zoneID = %s', (zoneID,))
    zone = cursor.fetchone()

    # Fetch all Wilayahs to populate the dropdown
    cursor.execute('SELECT wilayahID, wilayahName FROM WILAYAH')
    wilayahs = cursor.fetchall()

    cursor.close()
    conn.close()
    return render_template('admin/edit_zone.html', zone=zone, wilayahs=wilayahs)

# Delete a Zone
@zone_bp.route('/delete_zone/<int:zoneID>', methods=['POST'])
def delete_zone(zoneID):
    conn = get_db_connection()
    cursor = conn.cursor()

    # Delete the Zone from the database
    cursor.execute('DELETE FROM ZONE WHERE zoneID = %s', (zoneID,))
    conn.commit()

    cursor.close()
    conn.close()

    flash('Zone deleted successfully!')
    return redirect(url_for('zone.zone_list'))
