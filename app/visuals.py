from flask import Blueprint, render_template
from db_config import get_db_connection

visual_bp = Blueprint('visual', __name__)

@visual_bp.route('/visual_ifes_members')
def visual_ifes_members():
    conn = get_db_connection()
    cursor = conn.cursor()

    # Query to get IFES and their members grouped by Wilayah
    query = """
    SELECT WILAYAH.wilayahName, IFES.ifesName, MEMBER.memberEmail
    FROM TEAM
    JOIN IFES ON TEAM.ifesID = IFES.ifesID
    JOIN MEMBER ON TEAM.memberID = MEMBER.memberID
    JOIN WILAYAH ON IFES.wilayahID = WILAYAH.wilayahID
    ORDER BY WILAYAH.wilayahName, IFES.ifesName;
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

    # Convert sets back to lists for easier template processing
    for wilayah in visual_data:
        visual_data[wilayah]['ifes'] = list(visual_data[wilayah]['ifes'])
        visual_data[wilayah]['members'] = list(visual_data[wilayah]['members'])

    return render_template('visual_ifes_members.html', visual_data=visual_data)
