from flask import session, Blueprint, render_template, request, redirect, url_for, flash
from db_config import get_db_connection

ifes_bp = Blueprint('ifes', __name__)

@ifes_bp.before_request
def restrict_to_admin():
    if 'admin' not in session:
        flash('Please log in to access the admin panel.')
        return redirect(url_for('login'))

# Helper functions
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

def get_wilayah_dropdown():
    """Fetches all wilayah data for dropdown menus."""
    return execute_query('SELECT wilayahID, wilayahCode, wilayahName FROM WILAYAH', fetch=True)

# View all IFES entries
@ifes_bp.route('/ifes')
def ifes_list():
    query = """
    SELECT IFES.ifesID, IFES.ifesName, IFES.ifesEmail, WILAYAH.wilayahName, WILAYAH.wilayahCode 
    FROM IFES
    LEFT JOIN WILAYAH ON IFES.wilayahID = WILAYAH.wilayahID
    """
    ifes_records = execute_query(query, fetch=True)
    return render_template('admin/ifes.html', ifes=ifes_records)

# Add a new IFES
@ifes_bp.route('/add_ifes', methods=['GET', 'POST'])
def add_ifes():
    if request.method == 'POST':
        ifes_data = (
            request.form['ifesName'],
            request.form['ifesEmail'],
            request.form['wilayahID']
        )
        execute_query('INSERT INTO IFES (ifesName, ifesEmail, wilayahID) VALUES (%s, %s, %s)', ifes_data)
        flash('New IFES added successfully!')
        return redirect(url_for('ifes.ifes_list'))

    wilayah_records = get_wilayah_dropdown()
    return render_template('admin/add_ifes.html', wilayahs=wilayah_records)

# Edit IFES
@ifes_bp.route('/edit_ifes/<int:ifesID>', methods=['GET', 'POST'])
def edit_ifes(ifesID):
    if request.method == 'POST':
        ifes_data = (
            request.form['ifesName'],
            request.form['ifesEmail'],
            request.form['wilayahID'],
            ifesID
        )
        execute_query('UPDATE IFES SET ifesName = %s, ifesEmail = %s, wilayahID = %s WHERE ifesID = %s', ifes_data)
        flash('IFES updated successfully!')
        return redirect(url_for('ifes.ifes_list'))

    ifes = execute_query('SELECT * FROM IFES WHERE ifesID = %s', (ifesID,), fetch=True)[0]
    wilayah_records = get_wilayah_dropdown()
    return render_template('admin/edit_ifes.html', ifes=ifes, wilayahs=wilayah_records)

# Delete IFES
@ifes_bp.route('/delete_ifes/<int:ifesID>', methods=['POST'])
def delete_ifes(ifesID):
    execute_query('DELETE FROM IFES WHERE ifesID = %s', (ifesID,))
    flash('IFES deleted successfully!')
    return redirect(url_for('ifes.ifes_list'))
