from flask import session, Blueprint, render_template, redirect, url_for, flash
from db_config import get_db_connection

visual_bp = Blueprint('visual', __name__)

@visual_bp.before_request
def restrict_to_admin():
    if 'admin' not in session:
        flash('Please log in to access the admin panel.')
        return redirect(url_for('login'))

# Visualize IFES and Members Grouped by Wilayah
@visual_bp.route('/visual_ifes_members')
def visual_ifes_members():
    conn = get_db_connection()
    cursor = conn.cursor()

    # Query to get IFES and their members grouped by Wilayah
    query = """
    SELECT W.wilayahName, I.ifesName, M.memberEmail
    FROM TEAM T
    JOIN IFES I ON T.ifesID = I.ifesID
    JOIN MEMBER M ON T.memberID = M.memberID
    JOIN WILAYAH W ON I.wilayahID = W.wilayahID
    ORDER BY W.wilayahName, I.ifesName;
    """
    cursor.execute(query)
    data = cursor.fetchall()

    cursor.close()
    conn.close()

    # Group data by Wilayah and IFES
    visual_data = {}
    for wilayah, ifesName, memberName in data:
        if wilayah not in visual_data:
            visual_data[wilayah] = {'ifes': set(), 'members': set()}
        visual_data[wilayah]['ifes'].add(ifesName)  # Group IFES leaders under each Wilayah
        visual_data[wilayah]['members'].add(memberName)  # Collect all members under the Wilayah

    # Convert sets to lists for easier template processing
    for wilayah in visual_data:
        visual_data[wilayah]['ifes'] = sorted(list(visual_data[wilayah]['ifes']))  # Sort for consistency
        visual_data[wilayah]['members'] = sorted(list(visual_data[wilayah]['members']))

    return render_template('admin/visual_ifes_members.html', visual_data=visual_data)
