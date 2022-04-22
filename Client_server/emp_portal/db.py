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
        return lst[0][0]

    except Error as e:
        print("Error when returning vendor ID")
        print(e);
        return None
    except:
        return None

# def getEmployeeIDtype(email):
#     '''function to get employee's employeeID
#     arguments: email
#     returns: employee ID, an integer value'''
#     chk_ven = "select employee_ID from Employee where email_address = %s limit 1"
#     try:
#         cursor.execute(chk_ven, [email])
#         lst = list(iter(cursor.fetchall()))
#         return lst[0][0]

#     except Error as e:
#         print("Error when returning Employee ID")
#         print(e);
#         return None

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
        print(e);
        return None
    except:
        return None

def getVendor_by_ID(vend_id):
    chk_ven = "select email_address from vendor where vendor_ID = %s limit 1"
    try:
        cursor.execute(chk_ven, [vend_id])
        lst = list(iter(cursor.fetchall()))
        return lst[0][0]

    except Error as e:
        print("Error when returning vendor ID")
        print(e);
        return None


def getEmp_by_ID(emp_id):
    chk_emp = "select email_address from Employee where employee_ID = %s limit 1"
    chk_del = "select employee_id from delivery_partner where employee_id = %s limit 1"
    chk_svc = "select employee_id from service_employee where employee_id = %s limit 1"
    chk_wrh = "select employee_id from warehouse_worker where employee_id = %s limit 1"
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
        print(e);
        return None