# app/pbts.py
from flask import session, Blueprint, render_template, request, redirect, url_for, flash
from db_config import get_db_connection

pbts_bp = Blueprint('pbts', __name__)

@pbts_bp.before_request
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

# View all PBT entries
@pbts_bp.route('/pbts')
def pbts():
    pbts = execute_query('SELECT pbtID, pbtCode, pbtName FROM PBT', fetch=True)
    return render_template('admin/pbts.html', pbts=pbts)

# Add a new PBT
@pbts_bp.route('/add_pbt', methods=['GET', 'POST'])
def add_pbt():
    if request.method == 'POST':
        pbtCode = request.form['pbtCode']
        pbtName = request.form['pbtName']
        execute_query('INSERT INTO PBT (pbtCode, pbtName) VALUES (%s, %s)', (pbtCode, pbtName))
        flash('New Customer added successfully!')
        return redirect(url_for('pbts.pbts'))

    return render_template('admin/add_pbt.html')

# Edit PBT
@pbts_bp.route('/edit_pbt/<int:pbtID>', methods=['GET', 'POST'])
def edit_pbt(pbtID):
    if request.method == 'POST':
        pbtCode = request.form['pbtCode']
        pbtName = request.form['pbtName']
        execute_query('UPDATE PBT SET pbtCode=%s, pbtName=%s WHERE pbtID = %s', (pbtCode, pbtName, pbtID))
        flash('Customer updated successfully!')
        return redirect(url_for('pbts.pbts'))
    
    # Fetch the PBT data for editing
    pbt = execute_query('SELECT * FROM PBT WHERE pbtID = %s', (pbtID,), fetch=True)[0]
    return render_template('admin/edit_pbt.html', pbt=pbt)

# Delete PBT
@pbts_bp.route('/delete_pbt/<int:pbtID>', methods=['POST'])
def delete_pbt(pbtID):
    execute_query('DELETE FROM PBT WHERE pbtID = %s', (pbtID,))
    flash('Customer deleted successfully!')
    return redirect(url_for('pbts.pbts'))
