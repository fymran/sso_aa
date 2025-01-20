import mysql.connector

def get_db_connection():
    connection = mysql.connector.connect(
        host='localhost',#'ssoaa.mysql.pythonanywhere-services.com'
        user='root',#'ssoaa'
        password='',#'ssoaa_root'
        database='sso_db'#'ssoaa$sso_db'
    )
    return connection
