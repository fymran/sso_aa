# Edit NODE
@node_bp.route('/edit_node/<int:nodeID>', methods=['GET', 'POST'])
def edit_node(nodeID):
    conn = get_db_connection()
    cursor = conn.cursor()
    
    if request.method == 'POST':
        nodeCode = request.form['nodeCode']
        nodeName = request.form['nodeName']
        zoneID = request.form['zoneID']
        
        cursor.execute('UPDATE NODE SET nodeCode = %s, nodeName = %s, zoneID = %s WHERE nodeID = %s', (nodeCode, nodeName, zoneID, nodeID))
        conn.commit()
        flash('Node updated successfully!')
        return redirect(url_for('node.node_list'))
    
    # Fetch the node data
    cursor.execute('SELECT * FROM NODE WHERE nodeID = %s', (nodeID,))
    node = cursor.fetchone()
    
    # Fetch all zone data for the select dropdown
    cursor.execute('SELECT zoneID, zoneName FROM ZONE')
    zone_records = cursor.fetchall()

    cursor.close()
    conn.close()
    
    return render_template('edit_node.html', node=node, zones=zone_records)
