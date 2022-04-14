#TODO: check logic for signup auto-increment (it still auto increments)
#TODO: dynamic list for shopping cart                                               // Done
#TODO: fix user login (create customer object)                                      // Done
#TODO: complete signup procedure                                                    // Done
#TODO: shopping cart page (product quantity and total price)                        // Done
#TODO: Add edit and delete option in shopping cart page and a checkout button
#TODO: Auto increment in product table and some other tables                        // Done
#TODO: The cost of products are too high! A 43g chips potato costs 72858.00 Rs!!!   // Done
#TODO: product page to shopping cart linking (add to cart button)
#TODO: users' previous orders page (delivery details etc)                           // Done
#TODO: transaction page (checkout and pay)
#TODO: home page products linking to invidual product pages
#TODO: Inserting product to user's shopping cart in database when the user clicks add to cart button    // Done
#TODO: Employees management portal (for other stakeholders)
#TODO: utilise views in the querying process
#TODO: Optional : User can rate the products from my orders
#TODO: Indexing of tables
#TODO: make page for customer can review, complain, comment
#TODO: Make page to insert new product 
#TODO: Reduce stocks of product as it gets ordered
#TODO: take care of stock availability in individual product pages
#TODO: optional: Review of each product in product page
#TODO: create a form under shopping cart for transaction type
#TODO: logout is buggy
#TODO: make product links in shopping cart                                          // Done
#TODO: make a class of all the sql queries and access them using it

from . import connect_db, getcursor, db_commit, mydb
from flask import Blueprint, render_template, request, flash, redirect, url_for
from flask_login import login_user, logout_user, login_required, current_user, UserMixin
import mysql.connector
from .User import User



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

        cursor = getcursor()
        login_query = "select * from Customer where email_address = %s and password = %s"
        cursor.execute(login_query, [email, password])
        
        #checking if the email and password entered are valid or not
        valid = False

        #if length isn't 0, we found the customer!
        temp = list(iter(cursor.fetchall()))
    
        if len(temp) != 0:
            valid = True
        
        cursor.close()

        if valid:
            #send to main page
            print("PASSED", len(temp), temp)
            user = User(temp[0][7], temp[0][8])
            login_user(user, remember=True)
            flash("Logged in successfully!", category='success')
            return redirect(url_for('views.home1'))
        else:
            flash("Incorrect Email or Password! Try Again", category='error')
    
    return render_template("Login.html", user=current_user)

@auth.route('/logout')
@login_required
def logout():
    logout_user()
    return redirect(url_for('views.home1'))
    
@auth.route('/signup', methods=['GET', 'POST'])
def signup():
    if request.method == 'POST':
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
        check_valid_email = "select * from customer where email_address = %s"
        cursor = getcursor()

        try:  
            cursor.execute(check_valid_email, [temp_email_add])
            if(len(list(iter(cursor.fetchall()))) != 0):
                valid = False
        except Exception as e:
            print("Exception caught when getting valid email address!")
            print(e)
            valid = False
        cursor.close()

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
        if(valid):
            #print("ERROR OCCURRED WHILE REGISTERING, CHECK VALIDITY OF PINCODE AND/OR HOUSE NUMBER")
            register_statement = "INSERT INTO Customer(First_name, Last_name, House_number, Locality, City, Pincode, email_address, password) values (%s, %s, %s, %s, %s, %s, %s, %s)"
            tup = [temp_first_name, temp_last_name, temp_house_no, temp_locality, temp_city, temp_pincode, temp_email_add, temp_passwd]
            try:
                cursor2 = getcursor()
                cursor2.execute(register_statement, tup)
                db_commit()
                cursor2.close()
                flash("Account Created!", category='success')
                user = User(tup[6], tup[7])
                login_user(user, remember=True)
                return redirect(url_for('auth.login'))
            except mysql.connector.Error as e:
                #print(e)
                flash("Sorry, an error occurred while registering, please try again!", category = 'error')
                redirect(url_for('auth.signup'))
        else:
            flash("Invalid House Number or Pincode!", category='error')

    return render_template("Signup.html", user=current_user)
