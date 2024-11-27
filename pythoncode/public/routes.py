from flask import Blueprint, render_template, redirect, url_for, session, flash

sso_bp = Blueprint('sso', __name__)

@sso_bp.route('/sso_login')
def public_main_menu():
    if 'sso' not in session:
        flash('Please log in to access the main menu.')
        return redirect(url_for('login'))
    return render_template('public/public_main_menu.html')
