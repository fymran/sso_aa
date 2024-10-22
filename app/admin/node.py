from flask import session, Blueprint, render_template, request, redirect, url_for, flash
from app.core.db_config import get_db_connection

node_bp = Blueprint('node', __name__)

@node_bp.before_request
def restrict_to_admin():
    if 'admin' not in session:
        flash('Please log in to access the admin panel.')
        return redirect(url_for('login'))
    
# View all NODE entries
@node_bp.route('/node')
def node_list():
    conn = get_db_connection()
    cursor = conn.cursor()

    # Join the NODE and ZONE table to get zoneName
    query = """
    SELECT NODE.nodeID, NODE.nodeCode, NODE.nodeName, ZONE.zoneName 
    FROM NODE
    LEFT JOIN ZONE ON NODE.zoneID = ZONE.zoneID
    """
    cursor.execute(query)
    node_records = cursor.fetchall()
    
    cursor.close()
    conn.close()
    
    return render_template('node.html', nodes=node_records)

# Add a new NODE
@node_bp.route('/add_node', methods=['GET', 'POST'])
def add_node():
    conn = get_db_connection()
    cursor = conn.cursor()

    if request.method == 'POST':
        nodeCode = request.form['nodeCode']
        nodeName = request.form['nodeName']
        zoneID = request.form['zoneID']
        
        cursor.execute('INSERT INTO NODE (nodeCode, nodeName, zoneID) VALUES (%s, %s, %s)', (nodeCode, nodeName, zoneID))
        conn.commit()
        cursor.close()
        conn.close()
        flash('New Node added successfully!')
        return redirect(url_for('node.node_list'))
    
    # Fetch all zones to show in the select dropdown
    cursor.execute('SELECT zoneID, zoneName FROM ZONE')
    zone_records = cursor.fetchall()
    
    cursor.close()
    conn.close()
    
    return render_template('add_node.html', zones=zone_records)

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
    cursor.execute('SELECT nodeID, nodeCode, nodeName, zoneID FROM NODE WHERE nodeID = %s', (nodeID,))
    node = cursor.fetchone()
    
    # Fetch all zone data for the select dropdown
    cursor.execute('SELECT zoneID, zoneName FROM ZONE')
    zone_records = cursor.fetchall()

    cursor.close()
    conn.close()
    
    return render_template('edit_node.html', node=node, zones=zone_records)

# Delete NODE
@node_bp.route('/delete_node/<int:nodeID>', methods=['POST'])
def delete_node(nodeID):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute('DELETE FROM NODE WHERE nodeID = %s', (nodeID,))
    conn.commit()
    cursor.close()
    conn.close()
    flash('Node deleted successfully!')
    
    return redirect(url_for('node.node_list'))
