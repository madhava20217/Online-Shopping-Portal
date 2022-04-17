#TODO: Update class variables when table is updated

import mysql.connector

class MyDBConnector:
    '''Class for Database Connection for the application'''
    def __init__(self):
        self.__mydb = None
        self.__cursor = None

        self.__checkConn()
        self.__connect()
        self.__getCursor()
        #lists
        self.get_all_products = self.__get_all_products()
        self.current_customer = None

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
            self.__cursor = self.__mydb.cursor(buffered=True)
        else:
            self.__connect()
            self.__cursor = self.__mydb.cursor(buffered=True)

    def __closeCursor(self):
        '''Closes the cursor'''
        if self.__cursor != None:
            self.__cursor.close()
        
    def __commit(self):
        self.__mydb.commit()

    def __get_all_products(self):
        '''Function to get all available products for display on the home page
        Returns: a list of all available products
        To be used in Home1'''
        query = "select product_name, price, discount_percentage, product_id from all_products"
        self.__cursor.execute(query)
        product_list = list(iter(self.__cursor.fetchall()))
        return product_list
    
    def authenticate_Customer(self, email, password):
        ''' Public function as parameters are required'''
        query = "select * from Customer where email_address = %s and password = %s"
        self.__cursor.execute(query, [email, password])
        cust_list = list(iter(self.__cursor.fetchall()))

        if len(cust_list) != 0:
            self.current_customer = cust_list[0]
            return True
        else:
            return False

    def get_Customer(self, email):
        query = "select * from Customer where email_address = %s"
        self.__cursor.execute(query, [email])
        cust_list = list(iter(self.__cursor.fetchall()))
        return cust_list

    def add_Customer(self, customer_info):
        query = "INSERT INTO Customer(First_name, Last_name, House_number, Locality, City, Pincode, email_address, password) values (%s, %s, %s, %s, %s, %s, %s, %s)"
        self.__cursor.execute(query, customer_info)
        self.__commit()

    def add_Complaint(self, complaint_info):
        query = "insert into complains (customer_ID, order_ID, service_employee_id, date_of_creation, details, resolved) values (%s,%s,%s,%s,%s,%s)"
        self.__cursor.execute(query, complaint_info)
        self.__commit()

    

#testing, main function
if __name__ == "__main__":
    conn = MyDBConnector()

    print(conn.get_all_products())
