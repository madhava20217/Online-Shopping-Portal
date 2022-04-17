import mysql.connector

class MyDBConnector:
    '''Class for Database Connection for the application'''
    def __init__(self):
        self.__mydb = None
        self.__cursor = None

        self.__connect()
        self.__getCursor()


        #queries
        self.__update_all_products_Home = "select product_name, price, discount_percentage, product_id from all_products"
        self.__get_customer = "select * from Customer where email_address = %s and password = %s"
        self.__customer_email_Dictionary = {}
        self.__all_products = self.__update_all_products()
        
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
        if (not self.__checkConn()):
            self.__connect()
            
        self.__cursor = self.__mydb.cursor()

    def __closeCursor(self):
        '''Closes the cursor'''
        if self.__cursor != None:
            self.__cursor.close()

    def __commit(self):
        self.__mydb.commit()

    def __update_all_products(self):
        '''Helper Function to get all available products for display on the home page
        Returns: a list of all available products
        To be used in Home1'''
        self.__cursor.execute(self.__update_all_products_Home)
        product_list = list(iter(self.__cursor.fetchall()))
        return product_list

    def get_all_products(self):
        '''Public method to get product list'''
        try:
            self.__all_products
        except NameError as e:
            self.__update_all_products()
        return self.__all_products
        

    def authenticate_Customer(self, email, password):
        ''' 
        Public function, for authentication of the user
        Returns True if valid, else False (no access to be granted in this case)
        Takes as parameters, email and password,
        Returns a boolean True value if it  as parameters are required'''
        self.__cursor.execute(self.__get_customer, [email, password])
        cust_list = list(iter(self.__cursor.fetchall()))

        if len(cust_list) != 0:
            self.current_customer = cust_list[0]
            return True
        else:
            return False

    def get_Customer(self, email):
        '''
        Function for 
        '''

        if(email in self.__customer_email_Dictionary.keys()):
            return self.__customer_email_Dictionary.get(email)
        else:
            query = "select * from Customer where email_address = %s"
            self.__cursor.execute(query, [email])
            cust_list = list(iter(self.__cursor.fetchall()))
            self.__customer_email_Dictionary[email] = cust_list[0]
            return cust_list

    def add_Customer(self, customer_info):
        query = "INSERT INTO Customer(First_name, Last_name, House_number, Locality, City, Pincode, email_address, password) values (%s, %s, %s, %s, %s, %s, %s, %s)"
        self.__cursor.execute(query, customer_info)
        self.__commit()

    def add_Complaint(self, complaint_info):
        query = "insert into complains (customer_ID, order_ID, service_employee_id, date_of_creation, details, resolved) values (%s,%s,%s,%s,%s,%s)"
        self.__cursor.execute(query, complaint_info)
        self.__commit()

    def get_Customer_Orders(self, customer_id):
        # use view customer_order
        pass

    def add_Order(self, order_id):
        # use order table
        query=" insert into Order(order_id,Total_Price, Taxes, Total_Discount_Percentage) values(%s,%s,%s)"
        self.__cursor.execute(query,order_id)
        self.__commit()
        pass

    def delete_from_Cart(self, customer_id):
        # use table shopping cart
        pass

    def add_to_Cart(self, customer_id, Product_id, Quantity):
        # use table shopping cart
        query = "INSERT INTO Shopping_Cart (Customer_ID, Product_ID, Quantity) values (%s,%s,%s)"
        self.__cursor.execute(query, [customer_id, Product_id, Quantity])
        self.__commit()


    def get_Cart(self, customer_id):
        # use view customer cart
        pass

    def add_order_products(self, order_id, product_id, quantity):
        query = "Insert into order_products(order_id, product_id, quantity) values (%s,%s,%s)"
        self.__cursor.execute(query, [order_id, product_id, quantity])
        self.__commit()


    def get_Stores(self, product_id, Stocks):
        pass

    def add_product(self, product_info):
        # product_info is an array 
        query = "INSERT INTO Product (Price, Product_name, Discount_Percentage, GST_Percentage) values (%s,%s,%s,%s)"
        self.__cursor.execute(query, product_info)
        self.__commit()



    
    

    
#testing, main function
if __name__ == "__main__":
    conn = MyDBConnector()

    print(conn.get_all_products())


    print(conn.get_Customer("ssadgrove0@sitemeter.com"))
    print(conn.get_Customer("meady3@topsy.com"))
    print(conn.get_Customer("ashawcross8@1und1.de"))
    print(conn.get_Customer("smertina@a8.net"))