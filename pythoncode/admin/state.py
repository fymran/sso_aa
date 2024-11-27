# app/state.py
from flask import session, Blueprint, render_template, request, redirect, url_for, flash
from db_config import get_db_connection

state_bp = Blueprint('state', __name__)

@state_bp.before_request
def restrict_to_admin():
    if 'admin' not in session:
        flash('Please log in to access the admin panel.')
        return redirect(url_for('login'))

# Helper function to execute queries
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

# View all States
@state_bp.route('/state')
def state_list():
    states = execute_query('SELECT stateCode, stateName FROM STATE', fetch=True)
    return render_template('admin/state.html', states=states)

# Add a new State
@state_bp.route('/add_state', methods=['GET', 'POST'])
def add_state():
    if request.method == 'POST':
        stateCode = request.form['stateCode']
        stateName = request.form['stateName']
        execute_query('INSERT INTO STATE (stateCode,stateName) VALUES (%s, %s)', (stateCode, stateName,))
        flash('New State added successfully!')
        return redirect(url_for('state.state_list'))

    return render_template('admin/add_state.html')

# Edit a State
@state_bp.route('/edit_state/<string:stateCode>', methods=['GET', 'POST'])
def edit_state(stateCode):
    if request.method == 'POST':
        stateName = request.form['stateName']
        execute_query('UPDATE STATE SET stateName = %s WHERE stateCode = %s', (stateName, stateCode))
        flash('State updated successfully!')
        return redirect(url_for('state.state_list'))

    # Fetch the state data to be edited
    state = execute_query('SELECT stateCode, stateName FROM STATE WHERE stateCode = %s', (stateCode,), fetch=True)[0]
    return render_template('admin/edit_state.html', state=state)

# Delete a State
@state_bp.route('/delete_state/<string:stateCode>', methods=['POST'])
def delete_state(stateCode):
    execute_query('DELETE FROM STATE WHERE stateCode = %s', (stateCode,))
    flash('State deleted successfully!')
    return redirect(url_for('state.state_list'))
