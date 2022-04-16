#

import mysql.connector

class MyDBConnector:
    '''Class for Database Connection for the application'''
    def __init__(self):
        self.__mydb = None
        self.__cursor = None

        self.__checkConn()
        #queries
        self.__get_all_products_Home = "select product_name, price, discount_percentage, product_id from all_products"

    def __connect(self):
        '''
        Public Method
        Connects to the database of Online_Shopping with the apt login credentials.'''
        self.__mydb = mysql.connector.Connect(host = "localhost",
                            database = "online_shopping",
                            user = "root",
                            password = "Madhava2207")

    def __checkConn(self):
        '''Private function for checking database connection'''
        return self.__mydb != None
    
    def __getCursor(self):
        '''Gets cursor for the DB and stores it in self.cursor()'''
        if (self.__checkConn()):
            self.__connect()
            self.__cursor = self.__mydb.cursor()
        else:
            self.__connect()
            self.__cursor = self.__mydb.cursor()

    def __closeCursor(self):
        '''Closes the cursor'''
        if self.__cursor != None:
            self.__cursor.close()

    def get_all_products(self):
        '''Function to get all available products for display on the home page
        Returns: a list of all available products
        To be used in Home1'''
        self.__getCursor()
        self.__cursor.execute(self.__get_all_products_Home)
        product_list = list(iter(self.__cursor.fetchall()))
        return product_list

if __name__ == "__main__":
    conn = MyDBConnector()

    print(conn.get_all_products())
