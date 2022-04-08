from . import create_app
from flaskext.mysql import MySQL

class runner_class:
    def __init__(self):
        self.app = create_app()

        mysql = MySQL()
        mysql.init_app(self.app)
        
        self.database_connection = mysql.connect()
    
    def get_cursor():
        return self.database_connection.cursor()

