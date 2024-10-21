from flask import session, Blueprint, render_template, request, redirect, url_for, flash
from db_config import get_db_connection

asset_bp = Blueprint('asset', __name__)

@asset_bp.before_request
def restrict_to_admin():
    if 'admin' not in session:
        flash('Please log in to access the admin panel.')
        return redirect(url_for('login'))
    
# Step 1: Select Project
@asset_bp.route('/manage_asset', methods=['GET', 'POST'])
def manage_asset():
    conn = get_db_connection()
    cursor = conn.cursor()
    
    # Fetch all projects to populate the dropdown
    cursor.execute('SELECT projectID, projectCode FROM PROJECT')
    projects = cursor.fetchall()
    
    if request.method == 'POST':
        projectID = request.form['projectID']
        return redirect(url_for('asset.asset_list', projectID=projectID))
    
    cursor.close()
    conn.close()
    
    return render_template('select_project.html', projects=projects)

# Step 2: View assets for the selected project
@asset_bp.route('/assets/<int:projectID>', methods=['GET'])
def asset_list(projectID):
    conn = get_db_connection()
    cursor = conn.cursor()
    
    # Dynamically select the table based on projectID
    asset_table = f"asset_{projectID}"
    query = f"""
        SELECT A.assetID, A.assetNo, P.pbtCode, A.address, A.coordiNorth, A.coordiEast, A.postcode, N.nodeCode 
        FROM {asset_table} A 
        LEFT JOIN PBT P ON A.pbtID = P.pbtID 
        LEFT JOIN NODE N ON A.nodeID = N.nodeID
        """
    cursor.execute(query)
    assets = cursor.fetchall()
    
    cursor.close()
    conn.close()
    
    return render_template('assets.html', assets=assets, projectID=projectID)

# Step 3: Add Asset
@asset_bp.route('/add_asset/<int:projectID>', methods=['GET', 'POST'])
def add_asset(projectID):
    conn = get_db_connection()
    cursor = conn.cursor()

    if request.method == 'POST':
        assetNo = request.form['assetNo']
        pbtID = request.form['pbtID']
        address = request.form['address']
        coordiNorth = request.form['coordiNorth']
        coordiEast = request.form['coordiEast']
        postcode = request.form['postcode']
        nodeID = request.form['nodeID']
        
        if nodeID == '':
            nodeID = None

        cursor.execute(f"""
            INSERT INTO asset_{projectID} (assetNo, pbtID, address, coordiNorth, coordiEast, postcode, nodeID)
            VALUES (%s, %s, %s, %s, %s, %s, %s)
        """, (assetNo, pbtID, address, coordiNorth, coordiEast, postcode, nodeID))
        
        conn.commit()
        cursor.close()
        conn.close()
        flash('Asset added successfully!')
        return redirect(url_for('asset.asset_list', projectID=projectID))

    # Fetch all PBTs to display in the dropdown
    cursor.execute('SELECT pbtID, pbtCode FROM PBT')
    pbts = cursor.fetchall()
    cursor.execute('SELECT nodeID, nodeCode FROM NODE')
    nodes = cursor.fetchall()
    
    cursor.close()
    conn.close()

    return render_template('add_asset.html', projectID=projectID, pbts=pbts, nodes=nodes)

@asset_bp.route('/edit_asset/<int:projectID>/<int:assetID>', methods=['GET', 'POST'])
def edit_asset(projectID, assetID):
    conn = get_db_connection()
    cursor = conn.cursor()

    asset_table = f"asset_{projectID}"

    if request.method == 'POST':
        assetNo = request.form['assetNo']
        pbtID = request.form['pbtID']
        address = request.form['address']
        coordiNorth = request.form['coordiNorth']
        coordiEast = request.form['coordiEast']
        postcode = request.form['postcode']
        nodeID = request.form['nodeID']

        if nodeID == '':
            nodeID = None
        
        try:
            cursor.execute(f'''
                UPDATE {asset_table} 
                SET assetNo=%s, pbtID=%s, address=%s, coordiNorth=%s, coordiEast=%s, postcode=%s, nodeID=%s 
                WHERE assetID=%s
            ''', (assetNo, pbtID, address, coordiNorth, coordiEast, postcode, nodeID, assetID))
            conn.commit()
            flash('Asset updated successfully!')
        except Exception as e:
            flash(f'Error updating asset: {str(e)}')
        
        return redirect(url_for('asset.asset_list', projectID=projectID))

    # Fetch the asset details
    cursor.execute(f'SELECT * FROM {asset_table} WHERE assetID = %s', (assetID,))
    asset = cursor.fetchone()

    # Fetch PBTs and Nodes for dropdown
    cursor.execute('SELECT pbtID, pbtCode FROM PBT')
    pbts = cursor.fetchall()
    cursor.execute('SELECT nodeID, nodeCode FROM NODE')
    nodes = cursor.fetchall()

    cursor.close()
    conn.close()

    return render_template('edit_asset.html', asset=asset, projectID=projectID, nodes=nodes, pbts=pbts)

# Step 5: Delete Asset
@asset_bp.route('/delete_asset/<int:projectID>/<int:assetID>', methods=['POST'])
def delete_asset(projectID, assetID):
    conn = get_db_connection()
    cursor = conn.cursor()
    
    asset_table = f"asset_{projectID}"
    cursor.execute(f'DELETE FROM {asset_table} WHERE assetID = %s', (assetID,))
    conn.commit()
    
    cursor.close()
    conn.close()
    flash('Asset deleted successfully!')
    
    return redirect(url_for('asset.asset_list', projectID=projectID))
