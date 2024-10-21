from flask import Blueprint, render_template, redirect, url_for, session, flash

main_bp = Blueprint('main', __name__)

@main_bp.route('/')
def index():
    if 'admin' not in session:
        flash('Please log in to access the admin dashboard.')
        return redirect(url_for('login'))
    return render_template('admin_dashboard.html')  # Render the admin dashboard if logged in
