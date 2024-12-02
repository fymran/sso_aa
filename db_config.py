import mysql.connector

def get_db_connection():
    connection = mysql.connector.connect(
        host='ssoaa.mysql.pythonanywhere-services.com',
        user='ssoaa',
        password='mysqlroot',
        database='ssoaa$sso_db'
    )
    return connection
