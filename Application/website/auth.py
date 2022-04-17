#TODO: Employees management portal (for other stakeholders)                              //CLI
#TODO: User can rate the products from my orders                                         //Optional
#TODO: Indexing of tables
#TODO: Make page to insert new product                                                   //CLI
#TODO: make a class of all the sql queries and access them using it                      //In Progress
#TODO: form for transaction details on cart page                                         //Optional (COD only, write in docs)
#TODO: #DOCUMENTATION In case of more ordered than permissible, it orders available quantity
#TODO: vendor page, integration
#TODO: Assign Delivery Guy


from . import myDB
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
        if (myDB.authenticate_Customer(email, password)):
            #send to main page
            user = User(email, password)
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

        try:  
            customer_list=myDB.get_Customer(temp_email_add)
            if(len(customer_list) != 0):
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
        if(valid):
            customer_info = [temp_first_name, temp_last_name, temp_house_no, temp_locality, temp_city, temp_pincode, temp_email_add, temp_passwd]
            try:
                myDB.add_Customer(customer_info)
                flash("Account Created!", category='success')
                # user = User(temp_email_add, temp_passwd)
                # login_user(user, remember=True)
                return redirect(url_for('auth.login'))
            except mysql.connector.Error as e:
                flash("Sorry, an error occurred while registering, please try again!", category = 'error')
                redirect(url_for('auth.signup'))
        else:
            flash("Invalid House Number or Pincode!", category='error')

    return render_template("Signup.html", user=current_user)
