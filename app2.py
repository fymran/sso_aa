from flask import Flask, render_template, request, redirect, url_for
import mysql.connector

app = Flask(__name__)

# MySQL Database Configuration
db_config = {
    'host': 'localhost',
    'user': 'root',  # Replace with your MySQL username
    'password': '',  # Replace with your MySQL password
    'database': 'sso_db',  # Replace with your database name
}

# Helper function to interact with the database
def query_db(query, args=(), fetchone=False):
    conn = mysql.connector.connect(**db_config)
    cursor = conn.cursor()
    cursor.execute(query, args)
    data = cursor.fetchone() if fetchone else cursor.fetchall()
    conn.commit()
    cursor.close()
    conn.close()
    return data

# Initialize database table
def init_db():
    query_db('''
        CREATE TABLE IF NOT EXISTS character1 (
            charID INT AUTO_INCREMENT PRIMARY KEY,
            charName VARCHAR(255) NOT NULL
        )
    ''')

init_db()

# Home route
@app.route('/')
def index():
    characters = query_db("SELECT * FROM character1")
    return render_template('index.html', characters=characters)

# Add character
@app.route('/add', methods=['POST'])
def add_character():
    char_name = request.form['charName']
    if char_name:
        query_db("INSERT INTO character1 (charName) VALUES (%s)", (char_name,))
    return redirect(url_for('index'))

# Edit character
@app.route('/edit/<int:charID>', methods=['POST'])
def edit_character(charID):
    char_name = request.form['charName']
    if char_name:
        query_db("UPDATE character1 SET charName = %s WHERE charID = %s", (char_name, charID))
    return redirect(url_for('index'))

# Delete character
@app.route('/delete/<int:charID>', methods=['POST'])
def delete_character(charID):
    query_db("DELETE FROM character1 WHERE charID = %s", (charID,))
    return redirect(url_for('index'))

if __name__ == '__main__':
    app.run(debug=True)
