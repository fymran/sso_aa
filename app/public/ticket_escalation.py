from flask import Blueprint, render_template, request, jsonify
from db_config import get_db_connection

ticket_bp = Blueprint('ticket', __name__)

# Helper function to fetch dropdown options
def fetch_options():
    with get_db_connection() as conn:
        cursor = conn.cursor()
        cursor.execute('SELECT projectID, projectCode, projectName FROM PROJECT')
        projects = cursor.fetchall()
        cursor.execute('SELECT pbtID, pbtName, pbtCode FROM PBT')
        pbts = cursor.fetchall()
    return projects, pbts

# Ticket escalation main page
@ticket_bp.route('/ticket_escalation')
def ticket_escalation_menu():
    return render_template('public/ticket_escalation_menu.html')

# Remote ticket escalation options
@ticket_bp.route('/ticket_escalation/remote')
def remote_ticket_menu():
    return render_template('public/remote_ticket.html')

# Request Ticket process
@ticket_bp.route('/ticket_escalation/remote/request', methods=['GET', 'POST'])
def request_ticket():
    projects, pbts = fetch_options()
    return render_template('public/request_ticket.html', projects=projects, pbts=pbts)

# Ticket Ready process
@ticket_bp.route('/ticket_escalation/remote/ready', methods=['GET', 'POST'])
def ticket_ready():
    projects, pbts = fetch_options()
    return render_template('public/ticket_ready.html', projects=projects, pbts=pbts)

# Fetch assets based on selected project and PBT
@ticket_bp.route('/fetch_assets', methods=['POST'])
def fetch_assets():
    project_id = request.form.get('project_id')
    pbt_id = request.form.get('pbt_id')
    
    if not project_id or not pbt_id:
        return jsonify({"error": "Invalid input"}), 400

    try:
        with get_db_connection() as conn:
            cursor = conn.cursor()
            query = f"SELECT assetID, assetNo, postcode FROM ASSET_{project_id} WHERE pbtID = %s"
            cursor.execute(query, (pbt_id,))
            assets = cursor.fetchall()

        return jsonify(assets)
    except Exception as e:
        print(f"Error fetching assets: {e}")  # Or log to a file
        return jsonify({"error": "An internal error occurred"}), 500

# Fetch wilayah based on asset's nodeID through ZONE and WILAYAH tables
@ticket_bp.route('/fetch_wilayah/<string:projectID>', methods=['POST'])
def fetch_detail(projectID):
    asset_id = request.form.get('asset_id')
    
    if not asset_id:
        return jsonify({"error": "Asset ID is required"}), 400

    try:
        with get_db_connection() as conn:
            cursor = conn.cursor()
            query = f"""
                SELECT W.wilayahCode, W.wilayahName, N.nodeCode, S.stateName, Z.zoneName, A.postcode
                FROM ASSET_{projectID} AS A
                JOIN NODE AS N ON A.nodeID = N.nodeID
                JOIN ZONE AS Z ON N.zoneID = Z.zoneID
                JOIN WILAYAH AS W ON Z.wilayahID = W.wilayahID
                JOIN STATE AS S ON W.stateCode = S.stateCode
                WHERE A.assetID = %s
            """
            cursor.execute(query, (asset_id,))
            asset_detail = cursor.fetchone()
            
        if asset_detail:
            return jsonify({
                "wilayahCode": asset_detail[0],
                "wilayahName": asset_detail[1],
                "nodeCode": asset_detail[2],
                "stateName": asset_detail[3],
                "zoneName": asset_detail[4],
                "postcode": asset_detail[5]
            })
        
        else:
            return jsonify({"error": "asset detail not found"}), 404
        
    except Exception as e:
        return jsonify({"error": str(e)}), 500