from flask import Flask, session, redirect, url_for, request, render_template, flash
from app.admin.routes import main_bp
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
from app.public.routes import public_bp
from app.public.ticket_escalation import ticket_bp
from app.public.maps import maps_bp

# Application configuration
app = Flask(__name__)
app.secret_key = 'your_secret_key'

# Constants for admin login credentials
ADMIN_USERNAME = 'admin'
ADMIN_PASSWORD = 'admin123'

# Register Blueprints
admin_blueprints = [
    main_bp, projects_bp, pbts_bp, members_bp, team_bp, ifes_bp,
    state_bp, visual_bp, wilayah_bp, zone_bp, node_bp, asset_bp
]

for bp in admin_blueprints:
    app.register_blueprint(bp)

public_blueprints = [
    public_bp, ticket_bp, maps_bp
]
for bpp in public_blueprints:
    app.register_blueprint(bpp)

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
        else:
            flash('Invalid credentials!')
            return redirect(url_for('login'))
    
    return render_template('admin/login.html')

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

if __name__ == '__main__':
    app.run(debug=True)
