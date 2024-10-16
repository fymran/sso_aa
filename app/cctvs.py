from flask import Blueprint, render_template, request, redirect, url_for, flash, jsonify
from db_config import get_db_connection

cctvs_bp = Blueprint('cctvs', __name__)

# Fetch all CCTV records and project codes for the main page
@cctvs_bp.route('/cctvs')
def cctvs():
    conn = get_db_connection()
    cursor = conn.cursor()
    
    # Fetch all CCTV records
    cursor.execute('SELECT cctvID, address, postcode FROM CCTV')
    cctvs = cursor.fetchall()

    # Fetch all project codes
    cursor.execute('SELECT projCode FROM PROJECT')
    projects = cursor.fetchall()

    cursor.close()
    conn.close()
    
    return render_template('cctvs.html', cctvs=cctvs, projects=projects)

# Route for adding a new CCTV
@cctvs_bp.route('/add_cctv', methods=['GET', 'POST'])
def add_cctv():
    conn = get_db_connection()
    cursor = conn.cursor()

    # Fetch project codes and node codes for the form
    cursor.execute('SELECT projCode FROM PROJECT')
    projects = cursor.fetchall()

    cursor.execute('SELECT nodeCode FROM NODE')
    nodes = cursor.fetchall()

    cursor.close()
    conn.close()

    if request.method == 'POST':
        # Extract form data
        data = (
            request.form['cctvID'], request.form['pbtCode'], request.form['address'],
            request.form['coordiNorth'], request.form['coordiEast'], request.form['postcode'],
            request.form['projCode'], request.form['wilayahID'], request.form['zoneID'], request.form['nodeCode']
        )

        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute('INSERT INTO CCTV (cctvID, pbtID, address, coordiNorth, coordiEast, postcode, projCode, wilayahID, zoneID, nodeID) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)', data)
        conn.commit()
        cursor.close()
        conn.close()

        flash('New CCTV added successfully!')
        return redirect(url_for('cctvs.cctvs'))

    return render_template('add_cctv.html', projects=projects, nodes=nodes)

# Fetch PBT codes dynamically based on project code
@cctvs_bp.route('/get_pbt_codes/<proj_code>')
def get_pbt_codes(proj_code):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute('SELECT pbtCode FROM PBT WHERE projCode = %s', (proj_code,))
    pbt_codes = cursor.fetchall()
    cursor.close()
    conn.close()

    return jsonify(pbt_codes)

# Fetch zone and wilayah info based on node code
@cctvs_bp.route('/get_zone_wilayah/<node_code>')
def get_zone_wilayah(node_code):
    conn = get_db_connection()
    cursor = conn.cursor()
    
    cursor.execute('SELECT zoneID, wilayahID FROM NODE WHERE nodeCode = %s', (node_code,))
    node_info = cursor.fetchone()
    cursor.close()
    conn.close()

    return jsonify(node_info)
