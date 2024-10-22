from flask import Blueprint, render_template, request
from app.core.models import Project  # Assuming Project model is shared

escalation_bp = Blueprint('escalation', __name__)

@escalation_bp.route('/choice')
def escalation_choice():
    return render_template('escalation/escalation_choice.html')

@escalation_bp.route('/l2_remote/request_ticket', methods=['GET', 'POST'])
def request_ticket():
    if request.method == 'POST':
        project_id = request.form['project']
        return f"Ticket requested for project ID: {project_id}"
    
    projects = Project.query.all()  # Fetch projects from the database
    return render_template('escalation/request_ticket.html', projects=projects)
