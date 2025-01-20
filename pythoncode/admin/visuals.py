from flask import request, session, Blueprint, render_template, redirect, url_for, flash
from db_config import get_db_connection

visual_bp = Blueprint('visual', __name__)

@visual_bp.before_request
def restrict_to_admin():
    if 'admin' not in session:
        flash('Please log in to access the admin panel.')
        return redirect(url_for('login'))

@visual_bp.route('/visual_ifes_members')
def visual_ifes_members():
    conn = get_db_connection()
    cursor = conn.cursor()

    # Query to get IFES and their members grouped by Wilayah
    query = """
    SELECT W.wilayahID, W.wilayahName, I.ifesName, M.memberEmail, M.memberID
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

    # Group data by Wilayah
    visual_data = {}
    for wilayah_id, wilayah_name, ifes_name, member_name, member_id in data:
        if wilayah_name not in visual_data:
            visual_data[wilayah_name] = {'wilayah_id': wilayah_id, 'ifes': set(), 'members': []}
        visual_data[wilayah_name]['ifes'].add(ifes_name)  # Group IFES leaders under each Wilayah
        # Add members and their IDs (for delete functionality)
        if (member_name, member_id) not in visual_data[wilayah_name]['members']:
            visual_data[wilayah_name]['members'].append((member_name, member_id))

    # Convert sets to lists for easier template processing
    for wilayah in visual_data:
        visual_data[wilayah]['ifes'] = sorted(list(visual_data[wilayah]['ifes']))  # Sort for consistency
        visual_data[wilayah]['members'] = sorted(visual_data[wilayah]['members'], key=lambda x: x[0])  # Sort members by name

    return render_template('admin/visual_ifes_members.html', visual_data=visual_data)

@visual_bp.route('/delete_member', methods=['POST'])
def delete_member():
    wilayah_id = request.form.get('wilayah_id')
    member_id = request.form.get('member_id')

    if not wilayah_id or not member_id:
        flash('Invalid data provided for deletion.')
        return redirect(url_for('visual.visual_ifes_members'))

    conn = get_db_connection()
    cursor = conn.cursor()

    try:
        # Find all IFES IDs under the given Wilayah ID
        query_ifes_ids = "SELECT ifesID FROM IFES WHERE wilayahID = %s"
        cursor.execute(query_ifes_ids, (wilayah_id,))
        ifes_ids = [row[0] for row in cursor.fetchall()]

        if ifes_ids:
            # Delete relationships from TEAM table
            query_delete = "DELETE FROM TEAM WHERE ifesID IN (%s) AND memberID = %s"
            formatted_query = query_delete % (', '.join(['%s'] * len(ifes_ids)), '%s')
            cursor.execute(formatted_query, (*ifes_ids, member_id))
            conn.commit()
            flash('CC successfully removed from the Wilayah.')
        else:
            flash('No IFES found under the specified Wilayah.')
    except Exception as e:
        conn.rollback()
        flash(f'An error occurred: {e}')
    finally:
        cursor.close()
        conn.close()

    return redirect(url_for('visual.visual_ifes_members'))
