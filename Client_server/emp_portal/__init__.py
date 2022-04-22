#TODO: login and linking


import traceback

from flask import Flask, render_template, request, redirect, url_for, flash, session
from .db import *
from flask_login import UserMixin, login_user, login_required, logout_user, current_user, login_manager
from .employee import Employee
from .Vendor import Vendor



def create_app():
    app = Flask(__name__, instance_relative_config = True)
    app.config.from_mapping(SECRET_KEY = "dbdbdbdbdb")


    @app.route('/')
    def hello():
        return render_template('Home.html')
    
    @app.route('/vend_signup')
    def signup():
        return render_template('sign_up_vendor.html')


    @app.route('/api/signup', methods = ["POST"])
    def sign_up_vendor():
        
        #fetching data from the form
        f_name = request.form['first_name']
        l_name = request.form['last_name']
        try:
            p_no = int(request.form['plot_number'].strip())
            pin = int(request.form['pin_code'].strip())
        except Error as e:
            flash("There seems to be something wrong going on :/", category = "error")
            return redirect("/") # redirect(url_for(__init__.sign_up_vendor))

        city = request.form['city']
        
        email = request.form['email_id']
        passwd = request.form['password']

        val = checkVendor(email, passwd)
        
        if(val == True):
            flash("The email already exists!", category = "warning")
            return redirect('/vend_signup')
        
        if(val == -1):
            flash("There seems to be something wrong going on :/", category = "error")
            return redirect('/')

        else:
            if(register_vendor(f_name, l_name, p_no, city, pin, email, passwd)):
                flash("Registration success!", category = "message")
                return redirect('/vend_login')
            else:
                flash("There seems to be something wrong going on :/", category = "error")

        return redirect('/')

    @app.route('/vend_login')
    def vend_login():
        return render_template('vendor_login.html')

    @app.route('/api/vend_login', methods = ['POST'])
    def vendor_login():
        print('testing')
        print(request.form)
        email = request.form['email_id']
        passwd = request.form['password']
        try:
            res = checkVendor(email, passwd)
            print(res)
            if res == 1:
                vend_id = getVendorID(email, passwd)
                vend = Vendor(vend_id, email)
                login_user(vend, remember=True)
                flash('Successfully logged in', category = 'success')
                return redirect('/')

            else:
                flash("Error logging in, please check password or try again later!", category = "error")
                return redirect('/vend_login')
        except Error as e:
            print(e)
    
    @app.route('/emp_login')
    def emp_login_temp():
        return render_template('employee_login.html')
    

    @app.route('/api/emp_login', methods = ['POST'])
    def emp_login():
        email = request.form['email_id']
        password = request.form['password']

        print(request.form)

        res = get_employee(email, password)
        print(res)

        if (type(res) == tuple):
            #create user here
            emp = Employee(res[0][0], email, res[0][1])
            # user = User(res[0], email, res[1])
            login_user(emp, remember = True)
            flash('Successfully logged in', category = 'success')
            # return redirect('/')
            
            if(res[1] == "service"):
                return redirect('/')
            else:
                return redirect('/emp_dashboard_del')
            

        elif res == -1:
            flash("Access denied", category = "error")

        else:
            flash("Incorrect Login Credentials!", category = "warning")
        return redirect('/emp_login')


    @app.route('/api/emp_logout')
    @login_required
    def emp_logout():
        logout_user()
        return redirect('/')

    @app.route('/api/vend_logout')
    @login_required
    def vend_logout():
        logout_user()
        return redirect('/')

    return app
'''
    @login_manager.user_loader
    def load_user(id):
        temp1 = getVendor_by_ID(id)
        if temp1==None:
            temp1 = getEmp_by_ID(id)
        else:
            return Vendor(id, temp1)

        if temp1==None:
            return None
        else:
            return Employee(id, temp1[0], temp1[1])
'''
    
    