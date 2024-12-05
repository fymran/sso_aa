from flask import jsonify,session, Blueprint, render_template, request, redirect, url_for, flash, logging
from db_config import get_db_connection

asset_bp = Blueprint('asset', __name__)

@asset_bp.before_request
def restrict_to_admin():
    if 'admin' not in session:
        flash('Please log in to access the admin panel.')
        return redirect(url_for('login'))

#fetch only pbt involved in the project
def fetch_pbts(project_id):

    with get_db_connection() as conn:
        cursor = conn.cursor()
        query = f"SELECT DISTINCT A.pbtID, PBT.pbtName, PBT.pbtCode FROM asset_{project_id} A LEFT JOIN PBT ON A.pbtID = PBT.pbtID"
        cursor.execute(query)
        pbts = cursor.fetchall()

    return pbts

# Utility function for fetching PBTs and Nodes for dropdowns
def fetch_nodes():
    with get_db_connection() as conn:
        cursor = conn.cursor()
        cursor.execute('SELECT nodeID, nodeCode FROM NODE')
        nodes = cursor.fetchall()
    return nodes

# Step 1: Select Project
@asset_bp.route('/manage_asset', methods=['GET', 'POST'])
def manage_asset():
    with get_db_connection() as conn:
        cursor = conn.cursor()
        cursor.execute('SELECT projectID, projectCode FROM PROJECT')
        projects = cursor.fetchall()
        
    if request.method == 'POST':
        projectID = request.form['projectID']
        return redirect(url_for('asset.asset_list', projectID=projectID))

    return render_template('admin/select_project.html', projects=projects)

# Step 2: View assets for the selected project
@asset_bp.route('/assets/<int:projectID>', methods=['GET'])
def asset_list(projectID):
    asset_table = f"asset_{projectID}"
    query = f"""
        SELECT A.assetID, A.assetNo, P.pbtCode, A.address, A.coordiNorth, A.coordiEast, A.postcode, N.nodeCode 
        FROM {asset_table} A 
        LEFT JOIN PBT P ON A.pbtID = P.pbtID 
        LEFT JOIN NODE N ON A.nodeID = N.nodeID
    """
    with get_db_connection() as conn:
        with conn.cursor() as cursor:
            cursor.execute(query)
            assets = cursor.fetchall()
            cursor.execute('SELECT projectCode FROM PROJECT WHERE projectID = %s', (projectID,))
            projectCode = cursor.fetchone()

    nodes = fetch_nodes()
    pbts = fetch_pbts(projectID)
    return render_template('admin/assets.html', assets=assets, projectID=projectID, projectCode=projectCode, pbts=pbts, nodes=nodes)

# Step 3: Add Asset
@asset_bp.route('/add_asset/<int:projectID>', methods=['POST'])
def add_asset(projectID):
    asset_data = (
        request.form['assetNo'],
        request.form['pbtID'],
        request.form['address'],
        request.form['coordiNorth'],
        request.form['coordiEast'],
        request.form['postcode'],
        request.form.get('nodeID') or None
    )
    if asset_data:
        with get_db_connection() as conn:
            cursor = conn.cursor()
            cursor.execute(f"""
                INSERT INTO asset_{projectID} (assetNo, pbtID, address, coordiNorth, coordiEast, postcode, nodeID)
                VALUES (%s, %s, %s, %s, %s, %s, %s)
            """, asset_data)
            conn.commit()

        flash('Asset added successfully!')
    return redirect(url_for('asset.asset_list', projectID=projectID))

# Step 4: Edit Asset
@asset_bp.route('/edit_asset/<int:projectID>/<int:assetID>', methods=['GET', 'POST'])
def edit_asset(projectID, assetID):
    asset_table = f"asset_{projectID}"

    if request.method == 'POST':
        asset_data = (
            request.form['assetNo'],
            request.form['pbtID'],
            request.form['address'],
            request.form['coordiNorth'],
            request.form['coordiEast'],
            request.form['postcode'],
            request.form.get('nodeID') or None,
            assetID
        )

        with get_db_connection() as conn:
            cursor = conn.cursor()
            cursor.execute(f"""
                UPDATE {asset_table} 
                SET assetNo=%s, pbtID=%s, address=%s, coordiNorth=%s, coordiEast=%s, postcode=%s, nodeID=%s 
                WHERE assetID=%s
            """, asset_data)
            conn.commit()

        flash('Asset updated successfully!')
        return redirect(url_for('asset.asset_list', projectID=projectID))

    with get_db_connection() as conn:
        cursor = conn.cursor()
        cursor.execute(f'SELECT A.assetID, A.assetNo, A.pbtID, A.address, A.coordiNorth, A.coordiEast, A.postcode, A.nodeID, P.pbtCode FROM {asset_table} A join PBT P on A.pbtID=P.pbtID WHERE assetID = %s', (assetID,))
        asset = cursor.fetchone()
        cursor.execute('SELECT projectCode FROM PROJECT WHERE projectID = %s', (projectID,))
        projectCode = cursor.fetchone()

    nodes = fetch_nodes()
    pbts = fetch_pbts(projectID)

    return render_template('admin/edit_asset.html', asset=asset, projectID=projectID, nodes=nodes, pbts=pbts, projectCode=projectCode)

# Step 5: Delete Asset
@asset_bp.route('/delete_asset/<int:projectID>/<int:assetID>', methods=['POST'])
def delete_asset(projectID, assetID):
    asset_table = f"asset_{projectID}"

    with get_db_connection() as conn:
        cursor = conn.cursor()
        cursor.execute(f'DELETE FROM {asset_table} WHERE assetID = %s', (assetID,))
        conn.commit()

    flash('Asset deleted successfully!')
    return redirect(url_for('asset.asset_list', projectID=projectID))
