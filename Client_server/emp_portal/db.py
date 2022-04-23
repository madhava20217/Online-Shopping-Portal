import mysql.connector
from mysql.connector import Error

from flask import current_app, g
from flask.cli import with_appcontext

conn = None
cursor = None

try:
    conn = mysql.connector.connect(host = "localhost",
                                database = "online_shopping",
                                user = "root",
                                password = "Madhava2207")

    if conn.is_connected():
        cursor = conn.cursor(buffered = True)

except Error as e:
    print(e)
    print("Error occurred during connection / cursor creation")



def checkVendor(email, password = None):
    '''function to check if employee exists
    Return values:
        1) if vendor email doesn't exist, False
        2) if vendor email exists already, True
        3) if password matches, 1
        4) if password doesn't match, 0
        5) -1 if error'''
    
    chk_ven = "select * from vendor where email_address = %s limit 1"
    
    try:
        cursor.execute(chk_ven, [email])
        lst = list(iter(cursor.fetchall()))

        if len(lst) == 0:
            return False
        
        if password == None:
            return True
        
        if lst[0][7] == password:
            return 1
        
        return 0

    except Error as e:
        print("Error caught when checking vendor")
        print(e)
        return -1

def getVendorID(email):
    '''function to get vendor's vendorID
    arguments: email and password
    returns: vendor ID, an integer value'''
    chk_ven = "select vendor_ID from vendor where email_address = %s limit 1"
    try:

        cursor.execute(chk_ven, [email])
        lst = list(iter(cursor.fetchall()))
        print("/**"*500)
        print(email)
        print(lst)
        return lst[0][0]

    except Error as e:
        print("Error when returning vendor ID")
        print(e)
        return None
    except:
        return None

def getVendorEmail(id):
    '''function to get vendor's email address given the ID'''
    get_email = "select email_address from "

def register_vendor(first_name, last_name, plot, city, pin, email, password):
    '''Function for inserting values to the database
    Arguments: first_name, last_name, plot, city, pincode, email and password'''
    
    try:
        tup = [first_name, last_name, plot, city, pin, email, password]
        reg = "insert into vendor(first_name, last_name, plot_number, city, pincode, email_address, password) values (%s, %s, %s, %s, %s, %s, %s)"
        cursor.execute(reg, tup)

        conn.commit()
    except Error as e:
        print("Error in inserting values into vendor!")
        print(e)
        return False
    return True

def get_employee(email, password=None):
    '''function to verify employee credentials and type
    arguments: email and password
    returns: list of employee ID and category if found
    returns -1 for warehouse worker
    False if not found'''
    chk_ven = "select * from employee where email_address = %s limit 1"
    chk_del = "select employee_id from delivery_partner where employee_id = %s limit 1"
    chk_svc = "select employee_id from service_employee where employee_id = %s limit 1"
    chk_wrh = "select employee_id from warehouse_worker where employee_id = %s limit 1"

    print(email, password)
    try:
        cursor.execute(chk_ven, [email])
        lst = list(iter(cursor.fetchall()))
        if(len(lst) == 0):
            return False
        #searching in the other lists

        print(lst)
        print(lst[0][16])


        id = lst[0][0]
        passwd = lst[0][16]

        if password!=None and passwd != password:
            return False


        cursor.execute(chk_del, [id])
        if len(list(iter(cursor.fetchall()))) != 0:
            return tuple([id, "delivery"])
        
        cursor.execute(chk_svc, [id])
        if len(list(iter(cursor.fetchall()))) != 0:
            return tuple([id, "service"])
        
        return -1

    except Error as e:
        print("Error when returning vendor ID")
        print(e)
        return None
    except:
        return None

def getVendor_by_ID(vend_id):
    '''Returns vendor ID if exists, else returns None'''
    chk_ven = "select email_address from vendor where vendor_ID = %s limit 1"
    try:
        cursor.execute(chk_ven, [vend_id])
        lst = list(iter(cursor.fetchall()))
        return lst[0][0]

    except Error as e:
        print("Error when returning vendor ID")
        print(e)
        return None
    except:
        return None


def getEmp_by_ID(emp_id):
    '''Classifies and returns employees if they exist
    Returns: -1 if it is a warehouse worker (access denied)
    tuple consisting of employee_ID and category if service or delivery agent
    None if it doesn't exist'''

    chk_emp = "select email_address from Employee where employee_ID = %s limit 1"
    chk_del = "select employee_id from delivery_partner where employee_id = %s limit 1"
    chk_svc = "select employee_id from service_employee where employee_id = %s limit 1"
    try:
        cursor.execute(chk_emp, [emp_id])
        lst = list(iter(cursor.fetchall()))
        if(len(lst) == 0):
            return False    

        email = lst[0][0]

        cursor.execute(chk_del, [emp_id])
        if len(list(iter(cursor.fetchall()))) != 0:
            return tuple([email, "delivery"])
        
        cursor.execute(chk_svc, [emp_id])
        if len(list(iter(cursor.fetchall()))) != 0:
            return tuple([email, "service"])
        
        return -1

    except Error as e:
        print("Error when returning employee ID")
        print(e)
        return None
    except:
        return None

def restock_prod(vendor_id, product_id, restock_amount):
    '''
    First checks if the product exists, then updates if it does
    Adds the vendor to the "supplies" table if it doesn't already exist
    
    Return values: True on a successful addition
    -1 when product doesn't exist
    False if other exceptions'''
    try:
        print("*"*1000)
        print(vendor_id, product_id, restock_amount)
        update_quant = "update stores set stocks = stocks + %s where product_id = %s order by stocks ASC limit 1"

        
        cursor.execute(update_quant, [restock_amount, product_id])

        check_if_product_aready_supplied_once = "select 1 from Supplies where Product_ID = %s and Vendor_id = %s"


        cursor.execute(check_if_product_aready_supplied_once,[product_id,vendor_id])
        product_supplied = False
        if len(list(iter(cursor.fetchall()))) != 0:
                   product_supplied = True
        if(product_supplied == False):
            insert_into_supplies = "Insert into Supplies values(%s,%s,%s)"
            cursor.execute(insert_into_supplies,[vendor_id,product_id,restock_amount])
        if(product_supplied == True):
            increase_product_quantity = "Update Supplies set quantity = quantity + %s where Product_ID = %s and Vendor_id = %s"
            cursor.execute(increase_product_quantity,[restock_amount,product_id,vendor_id])
        conn.commit()
        return True
    except Error as e:
            print(e)
            return None

def add_new_product(vendor_id, name, price, discount, gst,restock_amount):
    '''Inserts a new product into the "products" table, randomly allocates a '''
    try:
        print("DONE")
        insert_product_into_product = "Insert into Product(price, product_name, discount_percentage, gst_percentage) values(%s,%s,%s,%s)"
        cursor.execute(insert_product_into_product,[price,name,discount,gst])

        print("DONE")

        max_product_id_query = "select max(product_id) from Product" 
        cursor.execute(max_product_id_query)
        max_product_id_iterator = iter(cursor.fetchall())
        max_product_id = list(max_product_id_iterator)[0][0]

        select_warehouse_with_minimum_stock = "select Warehouse_ID from Stores where product_id = %s order by stocks limit 1;"
        cursor.execute(select_warehouse_with_minimum_stock,[max_product_id])



        print("DONE")

        select_warehouse_iterator = iter(cursor.fetchall())
        warehouse_with_minimum_stock = list(select_warehouse_iterator)[0][0]

        insert_product = "update stores set stocks = stocks + %s where product_id = %s order by stocks ASC limit 1"
        cursor.execute(insert_product,[restock_amount,max_product_id])

        insert_into_supplies = "Insert into Supplies (Vendor_ID, Product_ID, Quantity) values(%s,%s,%s)"
        cursor.execute(insert_into_supplies,[vendor_id,max_product_id,restock_amount])
    
        return True
    except Error as e:
            print(e)
            return None

    conn.commit()

def get_delivery_list(emp_id):
    delivery_list_query = 'select order_id, customer_address, Warehouse_address from delivery_guy where employee_id = %s'
    
    try:
        cursor.execute(delivery_list_query,[emp_id])
        lst = list(iter(cursor.fetchall()))
        return lst

    except Error as e:
        print("Error when returning delivery ID list")
        print(e)
        return None

def get_complaint_list(emp_id):
    complaint_list_query = "select order_id, details, date_of_creation from complains where emp_id = %s "
    try:
        cursor.execute(complaint_list_query,[emp_id])
        lst = list(iter(cursor.fetchall()))
        return lst

    except Error as e:
        print("Error when returning vendor ID")
        print(e)
        return None