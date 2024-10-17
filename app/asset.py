from flask import Blueprint, render_template, request, redirect, url_for, flash
from db_config import get_db_connection

asset_bp = Blueprint('asset', __name__)

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
    query = f"SELECT assetID, pbtID, address, coordiNorth, coordiEast, postcode, nodeID FROM {asset_table}"
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
        assetID = request.form['assetID']
        pbtID = request.form['pbtID']
        address = request.form['address']
        coordiNorth = request.form['coordiNorth']
        coordiEast = request.form['coordiEast']
        postcode = request.form['postcode']
        nodeID = request.form['nodeID']
        
        asset_table = f"asset_{projectID}"
        cursor.execute(f'INSERT INTO {asset_table} (assetID, pbtID, address, coordiNorth, coordiEast, postcode, nodeID) VALUES (%s, %s, %s, %s, %s, %s, %s)', 
                       (assetID, pbtID, address, coordiNorth, coordiEast, postcode, nodeID))
        conn.commit()
        cursor.close()
        conn.close()
        flash('New Asset added successfully!')
        return redirect(url_for('asset.asset_list', projectID=projectID))
    
    # Fetch all nodes for dropdown selection
    cursor.execute('SELECT nodeID, nodeName FROM NODE')
    nodes = cursor.fetchall()
    
    cursor.close()
    conn.close()
    
    return render_template('add_asset.html', projectID=projectID, nodes=nodes)

# Step 4: Edit Asset
@asset_bp.route('/edit_asset/<int:projectID>/<string:assetID>/<string:pbtID>', methods=['GET', 'POST'])
def edit_asset(projectID, assetID, pbtID):
    conn = get_db_connection()
    cursor = conn.cursor()
    
    asset_table = f"asset_{projectID}"
    
    if request.method == 'POST':
        address = request.form['address']
        coordiNorth = request.form['coordiNorth']
        coordiEast = request.form['coordiEast']
        postcode = request.form['postcode']
        nodeID = request.form['nodeID']
        
        cursor.execute(f'UPDATE {asset_table} SET address=%s, coordiNorth=%s, coordiEast=%s, postcode=%s, nodeID=%s WHERE assetID=%s AND pbtID=%s', 
                       (address, coordiNorth, coordiEast, postcode, nodeID, assetID, pbtID))
        conn.commit()
        flash('Asset updated successfully!')
        return redirect(url_for('asset.asset_list', projectID=projectID))
    
    # Fetch the asset details
    cursor.execute(f'SELECT * FROM {asset_table} WHERE assetID = %s AND pbtID = %s', (assetID, pbtID))
    asset = cursor.fetchone()
    
    # Fetch all nodes for the dropdown
    cursor.execute('SELECT nodeID, nodeName FROM NODE')
    nodes = cursor.fetchall()
    
    cursor.close()
    conn.close()
    
    return render_template('edit_asset.html', asset=asset, projectID=projectID, nodes=nodes)

# Step 5: Delete Asset
@asset_bp.route('/delete_asset/<int:projectID>/<string:assetID>/<string:pbtID>', methods=['POST'])
def delete_asset(projectID, assetID, pbtID):
    conn = get_db_connection()
    cursor = conn.cursor()
    
    asset_table = f"asset_{projectID}"
    cursor.execute(f'DELETE FROM {asset_table} WHERE assetID = %s AND pbtID = %s', (assetID, pbtID))
    conn.commit()
    
    cursor.close()
    conn.close()
    flash('Asset deleted successfully!')
    
    return redirect(url_for('asset.asset_list', projectID=projectID))
