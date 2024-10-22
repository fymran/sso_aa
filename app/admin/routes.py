from flask import Blueprint, render_template, redirect, url_for, session, flash, request
from app.projects import project

main_bp = Blueprint('main', __name__)
escalation_bp = Blueprint('escalation', __name__)

@main_bp.route('/')
def index():
    if 'admin' not in session:
        flash('Please log in to access the admin dashboard.')
        return redirect(url_for('login'))
    return render_template('admin_dashboard.html')  # Render the admin dashboard if logged in

@escalation_bp.route('/escalation_choice')
def escalation_choice():
    return render_template('escalation_choice.html')

@escalation_bp.route('/escalate/l2_remote')
def l2_remote():
    return render_template('ticket.html')  # Points to the HTML page created above

@escalation_bp.route('/escalate/l2_onsite')
def l2_onsite():
    # Logic for L2 Onsite escalation goes here
    return "You selected L2 Onsite"

@escalation_bp.route('/l2_remote/request_ticket', methods=['GET', 'POST'])
def request_ticket():
    if request.method == 'POST':
        project_id = request.form['project']
        # Handle form submission logic here, e.g., redirect to the next step
        return f"Ticket requested for project ID: {project_id}"

    # Fetch the list of projects from the database
    projects = Project.query.all()
    return render_template('request_ticket.html', projects=projects)

@escalation_bp.route('/l2_remote/ticket_ready')
def ticket_ready():
    # Logic for handling an existing ticket goes here
    return "Ticket Ready page - Logic for processing a ready ticket should be implemented."
