import mysql.connector

class MyDBConnector:
    '''Class for Database Connection for the application'''
    def __init__(self):
        self.mydb = None
        self.cursor = None

    def connect(self):
        '''Connects to the database of Online_Shopping with the apt login credentials.'''
        if self.checkConn():
            self.mydb = mysql.connector.Connect(host = "localhost",
                            database = "online_shopping",
                            user = "root",
                            password = "Madhava2207")

    def __checkConn(self):
        '''Private function for checking database connection'''
        return self.mydb != None
    
    def __getCursor(self):
        '''Gets cursor for the DB and stores it in self.cursor()'''
        if (checkConn(self)):
            self.cursor = self.mydb.cursor()
        else:
            self.connect()
            self.cursor = self.mydb.cursor()

    def __closeCursor(self):
        '''Closes the cursor'''
        if self.cursor != None:
            self.cursor.close()

    def get_all_products(self):
        '''Function to get all available products for display on the home page
        Returns: a list of all available products
        To be used in Home1'''
        self.__getCursor()
        