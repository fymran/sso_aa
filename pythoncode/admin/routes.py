from flask import Blueprint, render_template, redirect, url_for, session, flash

admin_bp = Blueprint('admin', __name__)

@admin_bp.route('/admin_login')
def index():
    if 'admin' not in session:
        flash('Please log in to access the admin dashboard.')
        return redirect(url_for('login'))
    return render_template('admin/admin_dashboard.html')  # Render the admin dashboard if logged in
