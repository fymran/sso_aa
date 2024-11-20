from flask import session, Blueprint, render_template, request, redirect, url_for, flash
from db_config import get_db_connection

maps_bp = Blueprint('maps', __name__)

@maps_bp.before_request
def restrict_to_sso():
    if 'sso' not in session:
        flash('Please log in to access the SSO panel.')
        return redirect(url_for('login'))

# Step 1: Select Product
@maps_bp.route('/go_product', methods=['GET', 'POST'])
def go_product():
    conn = get_db_connection()
    cursor = conn.cursor()
    
    # Fetch all products to populate the dropdown
    cursor.execute('SELECT productID, productName FROM PRODUCT')
    products = cursor.fetchall()
    
    if request.method == 'POST':
        # Retrieve the selected productID from the form
        productID = int(request.form['productID'])
        
        # Redirect to different pages based on the selected productID
        if productID == 1:
            return redirect(url_for('maps.find_asset', productID=productID))
        else:
            return redirect(url_for('maps.go_product', productID=productID))
    
    cursor.close()
    conn.close()
    
    return render_template('public/select_product.html', products=products)

# Step 2a: Select Project based on ProductID = 1
@maps_bp.route('/find_asset/<int:productID>', methods=['GET', 'POST'])
def find_asset(productID):
    conn = get_db_connection()
    cursor = conn.cursor()
    
    # Fetch projects associated with the selected productID
    cursor.execute('SELECT projectID, projectCode FROM PROJECT WHERE productID = 1;')
    projects = cursor.fetchall()
    
    if request.method == 'POST':
        # Retrieve the selected projectID from the form
        projectID = request.form['projectID']
        # Redirect to the asset list page, passing the selected projectID as a parameter
        return redirect(url_for('maps.asset_list', projectID=projectID))
    
    cursor.close()
    conn.close()
    
    return render_template('public/project_selection.html', projects=projects)


# Step 3: View assets for the selected project
@maps_bp.route('/maps/<int:projectID>', methods=['GET'])
def asset_list(projectID):
    conn = get_db_connection()
    cursor = conn.cursor()

    # Fetch project code from the PROJECT table based on projectID
    cursor.execute('SELECT projectCode FROM PROJECT WHERE projectID = %s', (projectID,))
    projectCode = cursor.fetchone()[0]  # Fetch the first (and only) result

    # Dynamically select the asset table based on projectID
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

    # Pass projectCode to the template
    return render_template('public/maps_asset.html', assets=assets, projectID=projectID, projectCode=projectCode)
