from flask import Blueprint, render_template, request, redirect, url_for

public_bp = Blueprint('public', __name__)

@public_bp.route('/')
def home():
    return render_template('public/public_home.html')

@public_bp.route('/l2_remote/request_ticket', methods=['GET', 'POST'])
def request_ticket():
    if request.method == 'POST':
        project_id = request.form['project']
        product = request.form['product']
        asset_id = request.form['asset']
        inc_number = request.form['inc_number']
        
        # Process and generate the email
        return redirect(url_for('public.email_template', project_id=project_id, product=product, asset_id=asset_id, inc_number=inc_number))

    # Fetch project names and assets (you'll need models to fetch data from the DB)
    projects = Project.query.all()  # Assuming Project model exists
    return render_template('public/request_ticket.html', projects=projects)

@public_bp.route('/email_template')
def email_template():
    project_id = request.args.get('project_id')
    product = request.args.get('product')
    asset_id = request.args.get('asset_id')
    inc_number = request.args.get('inc_number')

    # Fetch project and asset details from DB
    project = Project.query.get(project_id)
    asset = Asset.query.get(asset_id)
    
    # Create the mailto link
    subject = f"Ticket Escalation - INC {inc_number}"
    body = f"""
    Project: {project.projectName}
    Product: {product}
    Asset: {asset.assetName}
    INC Number: {inc_number}
    """
    
    mailto_link = f"mailto:?subject={subject}&body={body}"

    return render_template('public/email_template.html', project=project, product=product, asset=asset, inc_number=inc_number, mailto_link=mailto_link)
