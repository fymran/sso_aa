# app/projects.py
from flask import session, Blueprint, render_template, request, redirect, url_for, flash
from db_config import get_db_connection

projects_bp = Blueprint('projects', __name__)

@projects_bp.before_request
def restrict_to_admin():
    if 'admin' not in session:
        flash('Please log in to access the admin panel.')
        return redirect(url_for('login'))

# Helper function for executing queries
def execute_query(query, args=None, fetch=False):
    """Executes a SQL query and optionally fetches the results."""
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute(query, args or ())
    result = cursor.fetchall() if fetch else None
    conn.commit()
    cursor.close()
    conn.close()
    return result

# View all projects
@projects_bp.route('/projects')
def projects():
    projects = execute_query('SELECT a.projectID, a.projectCode, a.projectName, b.productName, a.costCentre FROM PROJECT a join PRODUCT b ON a.productID = b.productID', fetch=True)
    return render_template('admin/projects.html', projects=projects)

# Add a new project and create its corresponding asset table
@projects_bp.route('/add_project', methods=['POST'])
def add_project():
    projCode = request.form['projCode']
    projName = request.form['projName']
    prodID = request.form['productID']
    costCentre = request.form['costCentre']

    try:
        # Insert the project
        execute_query('INSERT INTO PROJECT (projectCode, projectName, productID, costCentre) VALUES (%s, %s, %s, %s)', (projCode, projName, prodID, costCentre))
        
        # Get the project ID of the newly added project
        query = 'SELECT projectID FROM PROJECT WHERE projectCode = %s'
        projID = execute_query(query, (projCode,), fetch=True)[0][0]
        
        print(f"Project ID is {projID}")

        # Create the corresponding asset table for the project
        create_table_query = f"""
            CREATE TABLE asset_{projID} (
                assetID INT PRIMARY KEY AUTO_INCREMENT,
                assetNo VARCHAR(25) NOT NULL,
                pbtID INT,
                address VARCHAR(255),
                coordiNorth VARCHAR(100),
                coordiEast VARCHAR(100),
                postcode VARCHAR(5),
                nodeID INT
            );
        """
        execute_query(create_table_query)
        flash('Project and corresponding asset table created successfully!')
    
    except Exception as e:
        flash(f'Error: {str(e)}')
        print(f"Error while creating project or asset table: {str(e)}")
    
    return redirect(url_for('projects.projects'))

# Edit project
@projects_bp.route('/edit_project/<string:projID>', methods=['GET', 'POST'])
def edit_project(projID):
    if request.method == 'POST':
        projCode = request.form['projCode']
        projName = request.form['projName']
        prodID = request.form['productID']
        costCentre = request.form['costCentre']
        execute_query('UPDATE PROJECT SET projectCode=%s, projectName=%s, productID=%s, costCentre=%s WHERE projectID=%s', (projCode, projName, costCentre, projID))
        flash('Project updated successfully!')
        return redirect(url_for('projects.projects'))

    # Fetch project details for editing
    project = execute_query('SELECT * FROM PROJECT WHERE projectID = %s', (projID,), fetch=True)[0]
    return render_template('admin/edit_project.html', project=project)

# Delete project
@projects_bp.route('/delete_project/<string:projID>', methods=['POST'])
def delete_project(projID):
    execute_query('DELETE FROM PROJECT WHERE projectID = %s', (projID,))
    flash('Project deleted successfully!')
    return redirect(url_for('projects.projects'))
