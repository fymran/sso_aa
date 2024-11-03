from flask import Blueprint, render_template, request, jsonify, flash, session, redirect, url_for
from db_config import get_db_connection
import logging

ticket_bp = Blueprint('ticket', __name__)

@ticket_bp.before_request
def restrict_to_sso():
    if 'sso' not in session:
        flash('Please log in to access the sso panel.')
        return redirect(url_for('login'))

# Helper function to fetch dropdown options
def fetch_options():
    with get_db_connection() as conn:
        cursor = conn.cursor()
        cursor.execute('SELECT projectID, projectCode, projectName FROM PROJECT')
        projects = cursor.fetchall()
        cursor.execute('SELECT pbtID, pbtName, pbtCode FROM PBT')
        pbts = cursor.fetchall()
    return projects, pbts

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
        logging.error(f"Error fetching assets: {e}")
        return jsonify({"error": "An internal error occurred"}), 500

# Fetch wilayah based on asset's nodeID through ZONE and WILAYAH tables
@ticket_bp.route('/fetch_detail/<string:projectID>', methods=['POST'])
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
            
            # Fetch all IFES emails for the wilayah and their members
            query = f"""
                SELECT I.ifesEmail, M.memberEmail
                FROM IFES AS I
                LEFT JOIN TEAM AS T ON I.ifesID = T.ifesID
                LEFT JOIN MEMBER AS M ON T.memberID = M.memberID
                WHERE I.wilayahID = (SELECT Z.wilayahID FROM ASSET_{projectID} AS A
                                     JOIN NODE AS N ON A.nodeID = N.nodeID
                                     JOIN ZONE AS Z ON N.zoneID = Z.zoneID
                                     WHERE A.assetID = %s)
            """
            cursor.execute(query, (asset_id,))
            emails = cursor.fetchall()
            
            # Fetch project product
            query = """
                SELECT PRODUCT.productName
                FROM PRODUCT
                JOIN PROJECT ON PROJECT.productID = PRODUCT.productID
                WHERE projectID = %s
            """
            cursor.execute(query, (projectID,))
            product = cursor.fetchone()

        if asset_detail:
            # Separate IFES emails and MEMBER emails
            ifes_emails = list(set([email[0] for email in emails if email[0]]))
            member_emails = list(set([email[1] for email in emails if email[1]]))
            
            return jsonify({
                "wilayahCode": asset_detail[0],
                "wilayahName": asset_detail[1],
                "nodeCode": asset_detail[2],
                "stateName": asset_detail[3],
                "zoneName": asset_detail[4],
                "postcode": asset_detail[5],
                "ifesEmails": ifes_emails,
                "memberEmails": member_emails,
                "product": product[0] if product else None
            })
        
        else:
            return jsonify({"error": "Asset detail not found"}), 404
        
    except Exception as e:
        logging.error(f"Error fetching asset details: {e}")
        return jsonify({"error": "An internal error occurred"}), 500
