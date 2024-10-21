from flask import session, Blueprint, render_template, request, redirect, url_for, flash
from db_config import get_db_connection

projects_bp = Blueprint('projects', __name__)

@projects_bp.before_request
def restrict_to_admin():
    if 'admin' not in session:
        flash('Please log in to access the admin panel.')
        return redirect(url_for('login'))
    
@projects_bp.route('/projects')
def projects():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute('SELECT projectID, projectCode, projectName FROM PROJECT')
    projects = cursor.fetchall()
    cursor.close()
    conn.close()
    return render_template('projects.html', projects=projects)

@projects_bp.route('/add_project', methods=['POST'])
def add_project():
    projCode = request.form['projCode']
    projName = request.form['projName']
    conn = get_db_connection()
    cursor = conn.cursor()
    
    try:
        # Insert the project first
        cursor.execute('INSERT INTO PROJECT (projectCode, projectName) VALUES (%s, %s)', (projCode, projName))
        conn.commit()

        # Check the last inserted project ID
        cursor.execute('SELECT LAST_INSERT_ID()')
        projID = cursor.fetchone()[0]  # This retrieves the last inserted projectID
        print(f"Project ID is {projID}")

        # Create the corresponding asset table for the project
        create_table_query = f"""
            CREATE TABLE asset_{projID} (
                assetID INTEGER PRIMARY KEY AUTO_INCREMENT,
                assetNo VARCHAR(25) NOT NULL,
                pbtID INTEGER,
                address VARCHAR(255),
                coordiNorth VARCHAR(100),
                coordiEast VARCHAR(100),
                postcode VARCHAR(5),
                nodeID INTEGER
            );
            """

        cursor.execute(create_table_query)
        conn.commit()

        flash('Project and corresponding asset table created successfully!')
    
    except Exception as e:
        conn.rollback()
        flash(f'Error: {str(e)}')
        print(f"Error while creating project or asset table: {str(e)}")
    
    finally:
        cursor.close()
        conn.close()

    return redirect(url_for('projects.projects'))


@projects_bp.route('/edit_project/<string:projID>', methods=['GET', 'POST'])
def edit_project(projID):
    if request.method == 'POST':
        projCode = request.form['projCode']
        projName = request.form['projName']
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute('UPDATE PROJECT SET projectCode=%s, projectName=%s WHERE projectID=%s', (projCode, projName, projID))
        conn.commit()
        cursor.close()
        conn.close()
        flash('Project updated successfully!')
        return redirect(url_for('projects.projects'))
    else:
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute('SELECT * FROM PROJECT WHERE projectID = %s', (projID,))
        project = cursor.fetchone()
        cursor.close()
        conn.close()
        return render_template('edit_project.html', project=project)

@projects_bp.route('/delete_project/<string:projID>', methods=['POST'])
def delete_project(projID):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute('DELETE FROM PROJECT WHERE projectID = %s', (projID,))
    conn.commit()
    cursor.close()
    conn.close()
    flash('Project deleted successfully!')
    return redirect(url_for('projects.projects'))
