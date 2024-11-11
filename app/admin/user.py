from flask import session, Blueprint, render_template, request, redirect, url_for, flash
from db_config import get_db_connection

user_bp = Blueprint('user', __name__)

@user_bp.before_request
def restrict_to_admin():
    if 'admin' not in session:
        flash('Please log in to access the admin panel.')
        return redirect(url_for('login'))

# Helper function
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

# View all user
@user_bp.route('/user')
def user():
    user = execute_query('SELECT * FROM user', fetch=True)
    return render_template('admin/user.html', user=user)

# Add a new user
@user_bp.route('/add_user', methods=['GET', 'POST'])
def add_user():
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')
        execute_query('INSERT INTO user (username, password) VALUES (%s, %s)', (username, password,))
        flash('New user added successfully!')
        return redirect(url_for('user.user'))
    
    return render_template('admin/add_user.html')

@user_bp.route('/edit_user/<int:user_id>', methods=['GET', 'POST'])
def edit_user(user_id):
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')
        if username and password:
            execute_query('UPDATE user SET username = %s, password = %s WHERE userID = %s', (username, password, user_id))
            flash('User updated successfully!')
            return redirect(url_for('user.user'))

    user = execute_query('SELECT * FROM user WHERE userID = %s', (user_id,), fetch=True)[0]
    return render_template('admin/edit_user.html', user=user)


# Delete a user
@user_bp.route('/delete_user/<int:user_id>', methods=['POST'])
def delete_user(user_id):
    execute_query('DELETE FROM user WHERE userID = %s', (user_id,))
    flash('User deleted successfully!')
    return redirect(url_for('user.user'))
