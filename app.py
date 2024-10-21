from flask import Flask, session, redirect, url_for, request, render_template, flash
from app.routes import main_bp
from app.projects import projects_bp
from app.pbts import pbts_bp
from app.ifes import ifes_bp
from app.members import members_bp
from app.team import team_bp
from app.state import state_bp
from app.visuals import visual_bp
from app.wilayah import wilayah_bp
from app.zone import zone_bp
from app.node import node_bp
from app.asset import asset_bp

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
    
    return render_template('login.html')

@app.route('/logout')
def logout():
    session.pop('admin', None)
    flash('You have been logged out.')
    return redirect(url_for('login'))

# Protected admin route
@app.route('/admin_dashboard')
def admin_dashboard():
    if 'admin' in session:
        return render_template('admin_dashboard.html')
    else:
        flash('Please log in to access the admin dashboard.')
        return redirect(url_for('login'))
    
if __name__ == '__main__':
    app.run(debug=True)
