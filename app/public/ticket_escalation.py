from flask import Blueprint, render_template, request, redirect, url_for, flash
from db_config import get_db_connection

ticket_bp = Blueprint('ticket', __name__)

# Ticket escalation main page
@ticket_bp.route('/ticket_escalation')
def ticket_escalation_menu():
    return render_template('public/ticket_escalation_menu.html')

# Remote ticket escalation options
@ticket_bp.route('/ticket_escalation/remote')
def remote_ticket_menu():
    return render_template('public/remote_ticket.html')

# Request Ticket process
@ticket_bp.route('/ticket_escalation/remote/request', methods=['GET', 'POST'])
def request_ticket():
    conn = get_db_connection()
    cursor = conn.cursor()
    
    # Fetch project and PBT data for dropdowns
    cursor.execute('SELECT projectID, projectName FROM PROJECT')
    projects = cursor.fetchall()
    
    cursor.execute('SELECT pbtID, pbtName FROM PBT')
    pbts = cursor.fetchall()
    
    # If POST request (form submission)
    if request.method == 'POST':
        project_id = request.form['project']
        pbt_id = request.form['pbt']
        product = request.form['product']
        asset_id = "C01"
        inc_number = request.form['inc_number']

        # Here, compose the email content or trigger the Outlook send process.
        flash('Ticket created and email generated for escalation.')
        return redirect(url_for('ticket_escalation_menu'))

    cursor.close()
    conn.close()
    return render_template('public/request_ticket.html', projects=projects, pbts=pbts)
