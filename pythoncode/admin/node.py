from flask import session, Blueprint, render_template, request, redirect, url_for, flash
from db_config import get_db_connection

node_bp = Blueprint('node', __name__)

@node_bp.before_request
def restrict_to_admin():
    if 'admin' not in session:
        flash('Please log in to access the admin panel.')
        return redirect(url_for('login'))

# Helper function for database operations
def execute_query(query, args=None, fetch=False):
    """Executes a given SQL query and optionally fetches data."""
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute(query, args or ())
    result = cursor.fetchall() if fetch else None
    conn.commit()
    cursor.close()
    conn.close()
    return result

# View all NODE entries
@node_bp.route('/node')
def node_list():
    query = """
    SELECT NODE.nodeID, NODE.nodeCode, NODE.nodeName, ZONE.zoneName 
    FROM NODE
    LEFT JOIN ZONE ON NODE.zoneID = ZONE.zoneID
    """
    node_records = execute_query(query, fetch=True)
    zone_records = execute_query('SELECT zoneID, zoneName FROM ZONE', fetch=True)

    return render_template('admin/node.html', nodes=node_records, zones=zone_records)

# Add a new NODE
@node_bp.route('/add_node', methods=['POST'])
def add_node():
    nodeCode = request.form['nodeCode']
    nodeName = request.form['nodeName']
    zoneID = request.form['zoneID']
    if nodeCode and nodeName and zoneID:
        
        execute_query(
            'INSERT INTO NODE (nodeCode, nodeName, zoneID) VALUES (%s, %s, %s)', 
            (nodeCode, nodeName, zoneID)
        )
        flash('New Node added successfully!')
    return redirect(url_for('node.node_list'))

# Edit NODE
@node_bp.route('/edit_node/<int:nodeID>', methods=['GET', 'POST'])
def edit_node(nodeID):
    nodeCode = request.form['nodeCode']
    nodeName = request.form['nodeName']
    zoneID = request.form['zoneID']
    if nodeCode and nodeName and zoneID:
        
        execute_query(
            'UPDATE NODE SET nodeCode = %s, nodeName = %s, zoneID = %s WHERE nodeID = %s', 
            (nodeCode, nodeName, zoneID, nodeID)
        )
        flash('Node updated successfully!')
    return redirect(url_for('node.node_list'))

# Delete NODE
@node_bp.route('/delete_node/<int:nodeID>', methods=['POST'])
def delete_node(nodeID):
    execute_query('DELETE FROM NODE WHERE nodeID = %s', (nodeID,))
    flash('Node deleted successfully!')
    return redirect(url_for('node.node_list'))
