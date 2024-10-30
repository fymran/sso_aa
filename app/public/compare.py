@ticket_bp.route('/fetch_wilayah/<string:projectID>', methods=['POST'])
def fetch_wilayah(projectID):
    asset_id = request.form.get('asset_id')
    
    if not asset_id:
        return jsonify({"error": "Asset ID is required"}), 400

    try:
        with get_db_connection() as conn:
            cursor = conn.cursor()
            query = f"""
                SELECT W.wilayahCode, W.wilayahName, N.nodeCode, S.stateName, Z.zoneName
                FROM ASSET_{projectID} AS A
                JOIN NODE AS N ON A.nodeID = N.nodeID
                JOIN ZONE AS Z ON N.zoneID = Z.zoneID
                JOIN WILAYAH AS W ON Z.wilayahID = W.wilayahID
                JOIN STATE AS S ON W.stateCode = S.stateCode
                WHERE A.assetID = %s
            """
            cursor.execute(query, (asset_id,))
            wilayah_data = cursor.fetchone()

        if wilayah_data:
            return jsonify({
                "wilayahCode": wilayah_data[0],
                "wilayahName": wilayah_data[1],
                "nodeCode": wilayah_data[2],
                "stateName": wilayah_data[3],
                "zoneName": wilayah_data[4]
            })
        else:
            return jsonify({"error": "Wilayah data not found"}), 404
    except Exception as e:
        return jsonify({"error": str(e)}), 500
