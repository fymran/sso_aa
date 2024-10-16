from flask import Flask
from app.routes import main_bp
from app.projects import projects_bp
from app.pbts import pbts_bp
from app.cctvs import cctvs_bp
from app.members import members_bp
from app.team import team_bp
from app.ifes import ifes_bp
from app.state import state_bp

app = Flask(__name__)
app.secret_key = 'your_secret_key'

# Register blueprints
app.register_blueprint(main_bp)
app.register_blueprint(projects_bp)
app.register_blueprint(pbts_bp)
app.register_blueprint(cctvs_bp)
app.register_blueprint(members_bp)
app.register_blueprint(team_bp)
app.register_blueprint(ifes_bp)#this is the new changes
app.register_blueprint(state_bp)

if __name__ == '__main__':
    app.run(debug=True)
