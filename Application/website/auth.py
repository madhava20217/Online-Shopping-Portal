#TODO: Clean up mysql connector imports and files

import mysql.connector
from flask import Blueprint, render_template, request
from . import get_cursor

auth = Blueprint('auth', __name__)

@auth.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form.get('email')
        password = request.form.get('password1')

        ## query to find user by email
        # user = User.query.filter_by(email = email).first()
        # if user:
            ## if user email exists in the database
            # if check_password_hash(user.password, password):
            #     flash("Logged in successfully!", category='success')
            #     login_user(user, remember=True)
            #     return redirect(url_for('views.home'))
            # else:
                ## incorrect password
        # else:
            ## email doesn't exist
        cursor = get_cursor()
        login_query = "select customer_ID,password from Customer where email_address = %s and password = %s"
        cursor.execute(login_query, [email, password])
        
        #checking if the email and password entered are valid or not
        valid = False

        #if length isn't 0, we found the customer!
        if len(list(iter(cursor.fethcall()))) != 0:
            valid = True

        if valid:
            #send to main page
            return render_template("Home1.html")
    
    return render_template("Login.html")
    
@auth.route('/signup', methods=['GET', 'POST'])
def signup():
    
    return render_template("Signup.html")