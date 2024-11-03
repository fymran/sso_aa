from flask import Flask, session, redirect, url_for, request, render_template, flash
from app.admin.routes import admin_bp
from app.admin.projects import projects_bp
from app.admin.pbts import pbts_bp
from app.admin.ifes import ifes_bp
from app.admin.members import members_bp
from app.admin.team import team_bp
from app.admin.state import state_bp
from app.admin.visuals import visual_bp
from app.admin.wilayah import wilayah_bp
from app.admin.zone import zone_bp
from app.admin.node import node_bp
from app.admin.asset import asset_bp
from app.public.routes import sso_bp
from app.public.ticket_escalation import ticket_bp
from app.public.maps import maps_bp

# Application configuration
app = Flask(__name__)
app.secret_key = 'your_secret_key'

# Constants for admin & sso login credentials
ADMIN_USERNAME = 'admin'
ADMIN_PASSWORD = 'admin123'
SSO_USERNAME = 'sso'
SSO_PASSWORD = 'sso123'

# Register Blueprints
admin_blueprints = [
    admin_bp, projects_bp, pbts_bp, members_bp, team_bp, ifes_bp,
    state_bp, visual_bp, wilayah_bp, zone_bp, node_bp, asset_bp
]

for bp in admin_blueprints:
    app.register_blueprint(bp)

sso_blueprints = [
    sso_bp, ticket_bp, maps_bp
]
for sso in sso_blueprints:
    app.register_blueprint(sso)

# Admin Login
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        
        if username == ADMIN_USERNAME and password == ADMIN_PASSWORD:
            session['admin'] = True
            flash('Login successful!')
            return redirect(url_for('admin_dashboard'))
        elif username == SSO_USERNAME and password == SSO_PASSWORD:
            session['sso'] = True
            flash('SSO Login Successful!')
            return redirect(url_for('sso_main_menu'))
        else:
            flash('Invalid credentials!')
            return redirect(url_for('login'))
    
    return render_template('login.html')

@app.route('/logout')
def logout():
    session.pop('admin', None)
    flash('You have been logged out.')
    return redirect(url_for('login'))

# Admin Dashboard
@app.route('/admin_dashboard')
def admin_dashboard():
    if 'admin' in session:
        return render_template('admin/admin_dashboard.html')
    else:
        flash('Please log in to access the admin dashboard.')
        return redirect(url_for('login'))
#SSO main menu
@app.route('/sso_main_menu')
def sso_main_menu():
    if 'sso' in session:
        return render_template('public/sso_main_menu.html')
    else:
        flash('Please log in to access the sso main menu.')
        return redirect(url_for('login'))

if __name__ == '__main__':
    app.run(debug=True)
