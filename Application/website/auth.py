#TODO: Clean up mysql connector imports and files

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

        cursor = mydb.cursor(buffered = True)
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
    
    return render_template("Signup.html")

''' function to initialise connection to online shopping database in mydb'''
def connect_db():
    mydb = mysql.connector.connect(host = "localhost",
                                user = "root",
                                password = "Madhava2207",
                                database = "online_shopping")

    return mydb