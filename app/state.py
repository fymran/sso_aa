from flask import Blueprint, render_template, request, redirect, url_for, flash
from db_config import get_db_connection

state_bp = Blueprint('state', __name__)

# View all States
@state_bp.route('/state')
def state_list():
    conn = get_db_connection()
    cursor = conn.cursor()
    
    # Fetch all states
    cursor.execute('SELECT stateCode, stateName FROM STATE')
    state_records = cursor.fetchall()

    cursor.close()
    conn.close()

    return render_template('state.html', states=state_records)

# Add a new State
@state_bp.route('/add_state', methods=['GET', 'POST'])
def add_state():
    if request.method == 'POST':
        stateName = request.form['stateName']
        
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute('INSERT INTO STATE (stateName) VALUES (%s)', (stateName,))
        conn.commit()
        cursor.close()
        conn.close()

        flash('New State added successfully!')
        return redirect(url_for('state.state_list'))

    return render_template('add_state.html')

# Edit a State
@state_bp.route('/edit_state/<int:stateID>', methods=['GET', 'POST'])
def edit_state(stateID):
    conn = get_db_connection()
    cursor = conn.cursor()

    if request.method == 'POST':
        stateName = request.form['stateName']

        cursor.execute('UPDATE STATE SET stateName = %s WHERE stateID = %s', (stateName, stateID))
        conn.commit()

        flash('State updated successfully!')
        return redirect(url_for('state.state_list'))
    
    # Fetch the state data to be edited
    cursor.execute('SELECT stateID, stateName FROM STATE WHERE stateID = %s', (stateID,))
    state = cursor.fetchone()

    cursor.close()
    conn.close()

    return render_template('edit_state.html', state=state)

# Delete a State
@state_bp.route('/delete_state/<int:stateID>', methods=['POST'])
def delete_state(stateID):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute('DELETE FROM STATE WHERE stateID = %s', (stateID,))
    conn.commit()
    cursor.close()
    conn.close()

    flash('State deleted successfully!')
    return redirect(url_for('state.state_list'))
