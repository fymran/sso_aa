# app/__init__.py
from flask import Flask

def create_app():
    app = Flask(__name__)
    app.secret_key = 'your_secret_key'  # Set your secret key here
    
    from app.projects import projects_bp
    from app.pbts import pbts_bp
    from app.cctvs import cctvs_bp

    # Register blueprints
    app.register_blueprint(projects_bp)
    app.register_blueprint(pbts_bp)
    app.register_blueprint(cctvs_bp)

    return app
