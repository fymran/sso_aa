# Step 4: Edit Asset
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
        
        cursor.execute(f'UPDATE {asset_table} SET assetNo=%s, pbtID=%s, address=%s, coordiNorth=%s, coordiEast=%s, postcode=%s, nodeID=%s WHERE assetID=%s', 
                       (assetNo, pbtID, address, coordiNorth, coordiEast, postcode, nodeID, assetID))
        conn.commit()
        flash('Asset updated successfully!')
        return redirect(url_for('asset.asset_list', projectID=projectID))
    
    # Fetch the asset details
    cursor.execute(f'SELECT * FROM {asset_table} WHERE assetID = %s', (assetID,))
    asset = cursor.fetchone()
    #fetch pbt
    cursor.execute('SELECT pbtID, pbtCode FROM PBT')
    pbts = cursor.fetchall()
    # Fetch all nodes for the dropdown
    cursor.execute('SELECT nodeID, nodeName FROM NODE')
    nodes = cursor.fetchall()
    
    cursor.close()
    conn.close()
    
    return render_template('edit_asset.html', asset=asset, projectID=projectID, nodes=nodes, pbts=pbts)
