# app/pbts.py
from flask import Blueprint, render_template, request, redirect, url_for, flash
from db_config import get_db_connection

pbts_bp = Blueprint('pbts', __name__)

@pbts_bp.route('/pbts')
def pbts():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute('SELECT pbtID, pbtCode, pbtName FROM PBT')
    pbts = cursor.fetchall()
    cursor.close()
    conn.close()
    return render_template('pbts.html', pbts=pbts)

@pbts_bp.route('/add_pbt', methods=['GET', 'POST'])
def add_pbt():
    conn = get_db_connection()
    cursor = conn.cursor()

    if request.method == 'POST':
        pbtCode = request.form['pbtCode']
        pbtName = request.form['pbtName']

        cursor.execute('INSERT INTO PBT (pbtCode, pbtName) VALUES (%s, %s)', 
                       (pbtCode, pbtName))
        conn.commit()
        cursor.close()
        conn.close()

        flash('New PBT added successfully!')
        return redirect(url_for('pbts.pbts'))
    
    cursor.close()
    conn.close()

    return render_template('add_pbt.html')

@pbts_bp.route('/edit_pbt/<int:pbtID>', methods=['GET', 'POST'])
def edit_pbt(pbtID):
    if request.method == 'POST':
        pbtCode = request.form['pbtCode']
        pbtName = request.form['pbtName']
        
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute('UPDATE PBT SET pbtCode=%s, pbtName=%s WHERE pbtID = %s', (pbtCode, pbtName, pbtID))
        conn.commit()
        cursor.close()
        conn.close()
        
        flash('PBT updated successfully!')
        return redirect(url_for('pbts.pbts'))  # Redirect to the PBT list page
    else:
        conn = get_db_connection()
        cursor = conn.cursor()

        # Fetch the PBT data
        cursor.execute('SELECT * FROM PBT WHERE pbtID = %s', (pbtID,))
        pbt = cursor.fetchone()
        
        cursor.close()
        conn.close()
        
        return render_template('edit_pbt.html', pbt=pbt )
    
@pbts_bp.route('/delete_pbt/<int:pbtID>', methods=['POST'])
def delete_pbt(pbtID):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute('DELETE FROM PBT WHERE pbtID = %s', (pbtID,))
    conn.commit()
    cursor.close()
    conn.close()
    
    flash('PBT deleted successfully!')
    return redirect(url_for('pbts.pbts'))
