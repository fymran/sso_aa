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

app = Flask(__name__)
app.secret_key = 'your_secret_key'

ADMIN_USERNAME = 'admin'
ADMIN_PASSWORD = 'admin123'

# Register blueprints
app.register_blueprint(main_bp)
app.register_blueprint(projects_bp)
app.register_blueprint(pbts_bp)
app.register_blueprint(members_bp)
app.register_blueprint(team_bp)
app.register_blueprint(ifes_bp)
app.register_blueprint(state_bp)
app.register_blueprint(visual_bp)
app.register_blueprint(wilayah_bp)
app.register_blueprint(zone_bp)
app.register_blueprint(node_bp)
app.register_blueprint(asset_bp)

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

# Protected admin route
@app.route('/admin_dashboard')
def admin_dashboard():
    if 'admin' in session:
        return render_template('admin/admin_dashboard.html')
    else:
        flash('Please log in to access the admin dashboard.')
        return redirect(url_for('login'))
    
if __name__ == '__main__':
    app.run(debug=True)
