#TODO: check logic for signup auto-increment.

import mysql.connector
from flask import Blueprint, render_template, request


#defining global variable for database login measures
global mydb
mydb = mysql.connector.connect(host = "localhost",
                                user = "root",
                                password = "Madhava2207",
                                database = "online_shopping")

auth = Blueprint('auth', __name__)

@auth.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form.get('email')
        password = request.form.get('password1')

        #try-except block for uninitialised variable           
        try:
            mydb
        except NameError as e:
            connect_db()

        cursor = getcursor(mydb)
        login_query = "select customer_ID,password from Customer where email_address = %s and password = %s"
        cursor.execute(login_query, [email, password])
        
        #checking if the email and password entered are valid or not
        valid = False

        #if length isn't 0, we found the customer!
        if len(list(iter(cursor.fetchall()))) != 0:
            valid = True
        
        cursor.close()

        if valid:
            #send to main page
            return render_template("Home1.html")
    
    return render_template("Login.html")
    
@auth.route('/signup', methods=['GET', 'POST'])
def signup():
    if request.method == 'POST':
        register_statement = "INSERT INTO Customer(First_name, Last_name, House_number, Locality, City, Pincode, email_address, password) values (%s, %s, %s, %s, %s, %s, %s, %s)"

        temp_first_name = request.form.get('firstname')
        temp_last_name = request.form.get('lastname')
        temp_house_no = request.form.get('houseno')
        temp_locality = request.form.get('locality')
        temp_city = request.form.get('city')
        temp_pincode = request.form.get('pincode')
        temp_email_add = request.form.get('email')
        temp_passwd = request.form.get('password')

        #temp_house_no and temp_pincode are still strings, need to convert them to INT
        #valueerror will be thrown if invalid

        #'valid' variable: checks if exceptions are thrown or not
        valid = True

        #check valid email address 
        check_valid_email = "select customer_ID from customer where customer_id = %s"

        try:
            cursor = getcursor()
            cursor.execute(check_valid_email, [temp_email_add])
            if(len(list(iter(cursor.fetchall()))) != 0):
                valid = False
        except Exception as e:
            print("Exception caught when getting valid email address!")
            print(e)
            valid = False

        #try-except for temp_house_no
        try:
            test = int(temp_house_no)
            temp_house_no = test
        except ValueError:
            valid = False

        #try-except for pincode
        try:
            test = int(temp_pincode)
            temp_pincode = test
        except ValueError:
            valid = False
        
        #this can happen if pincode or house number are invalid, or if the email address exists
        if( not valid ):
            #print("NOT VALID")
            tup = [temp_first_name, temp_last_name, temp_house_no, temp_locality, temp_city, temp_pincode, temp_email_add, temp_passwd]
            #print(tup)
            print("ERROR OCCURRED WHILE REGISTERING, CHECK VALIDITY OF PINCODE AND/OR HOUSE NUMBER")
            return render_template("Signup.html")



        tup = [temp_first_name, temp_last_name, temp_house_no, temp_locality, temp_city, temp_pincode, temp_email_add, temp_passwd]
        try:
            getcursor().execute(register_statement, tup)
            mydb.commit()
            return render_template("Home1.html")
        except mysql.connector.Error as e:
            #print(e)
            return render_template("Signup.html")

    return render_template("Signup.html")

''' function to initialise connection to online shopping database in mydb'''
def connect_db():
    mydb = mysql.connector.connect(host = "localhost",
                                user = "root",
                                password = "Madhava2207",
                                database = "online_shopping")

    return mydb

'''function to get cursor object from database connection instance'''
def getcursor():
    return mydb.cursor(buffered = True)