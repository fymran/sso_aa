from flask import Flask, render_template, request, redirect, url_for
import mysql.connector

app = Flask(__name__)

# MySQL Database Configuration
db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': '',
    'database': 'sso_db',
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

# Initialize database tables
def init_db():
    query_db('''
        CREATE TABLE IF NOT EXISTS species (
            speciesID INT AUTO_INCREMENT PRIMARY KEY,
            speciesName VARCHAR(255) NOT NULL
        )
    ''')
    query_db('''
        CREATE TABLE IF NOT EXISTS character1 (
            charID INT AUTO_INCREMENT PRIMARY KEY,
            charName VARCHAR(255) NOT NULL,
            speciesID INT NOT NULL,
            FOREIGN KEY (speciesID) REFERENCES species(speciesID)
        )
    ''')

init_db()

# Home route
@app.route('/')
def index():
    characters = query_db('''
        SELECT c.charID, c.charName, c.speciesID, s.speciesName
        FROM character1 c
        JOIN species s ON c.speciesID = s.speciesID
    ''')
    species_list = query_db("SELECT * FROM species")
    return render_template('index.html', characters=characters, species_list=species_list)

# Add character
@app.route('/add', methods=['POST'])
def add_character():
    char_name = request.form['charName']
    species_id = request.form['speciesID']
    if char_name and species_id:
        query_db("INSERT INTO character1 (charName, speciesID) VALUES (%s, %s)", (char_name, species_id))
    return redirect(url_for('index'))

# Edit character
@app.route('/edit/<int:charID>', methods=['POST'])
def edit_character(charID):
    char_name = request.form['charName']
    species_id = request.form['speciesID']
    if char_name and species_id:
        query_db("UPDATE character1 SET charName = %s, speciesID = %s WHERE charID = %s", (char_name, species_id, charID))
    return redirect(url_for('index'))

# Delete character
@app.route('/delete/<int:charID>', methods=['POST'])
def delete_character(charID):
    query_db("DELETE FROM character1 WHERE charID = %s", (charID,))
    return redirect(url_for('index'))

if __name__ == '__main__':
    app.run(debug=True)
