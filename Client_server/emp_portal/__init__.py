#TODO: login and linking


import traceback

from flask import Flask, render_template, request, redirect, url_for, flash
from .db import *
from flask_login import UserMixin, login_user, login_required, logout_user, current_user,  LoginManager, AnonymousUserMixin
from .employee import Employee
from .Vendor import Vendor


def create_app():
    app = Flask(__name__, instance_relative_config = True)
    app.config.from_mapping(SECRET_KEY = "dbdbdbdbdb")

    @app.route('/')
    def hello():
        print(current_user.get_id())
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
        # print('testing')
        # print(request.form)
        email = request.form['email_id']
        passwd = request.form['password']
        try:
            res = checkVendor(email, passwd)
            # print(res)
            if res == 1:
                vend_id = getVendorID(email)
                vend = Vendor(vend_id, email)
                login_user(vend, remember=True)
                flash('Successfully logged in', category = 'success')
                return redirect('/vendor_dashboard')

            else:
                flash("Error logging in, please try again later!", category = "error")
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

        res = get_employee(email, password)

        if (type(res) == tuple):
            #create user here
            emp = Employee(res[0], email, res[1])
            # user = User(res[0], email, res[1])
            login_user(emp, remember = True)
            flash('Successfully logged in', category = 'success')
            
            if(res[1] == "service"):
                return redirect('/emp_dashboard_ser')
            else:
                return redirect('/emp_dashboard_del')

        elif res == -1:
            flash("Access denied", category = "error")

        else:
            flash("Incorrect Login Credentials!", category = "warning")
        return redirect('/emp_login')


    @app.route('/api/emp_logout')
    # @login_required
    def emp_logout():
        logout_user()
        return redirect('/')

    @app.route('/api/vend_logout')
    # @login_required
    def vend_logout():
        logout_user()
        return redirect('/')


    @app.route("/emp_dashboard_del")
    # @login_required
    def del_dashboard():
        return render_template("delivery_emp_dashboard.html")

    @app.route("/emp_dashboard_ser")
    # @login_required
    def service_dashboard():
        return render_template("service_emp_dashboard.html")

    @app.route("/vendor_dashboard")
    # @login_required
    def vendor_dashboard():
        return render_template("vendor_dashboard.html")


    login_manager = LoginManager()
    login_manager.init_app(app)
    # login_manager.login_view = 'emp_login'

    @login_manager.user_loader
    def load_user(email):
        temp = getVendorID(email)
        if temp==None:
            temp = get_employee(email)
        else:
            return Vendor(temp, email)

        if temp==None or temp==False or temp==-1:
            return None
        else:
            return Employee(temp[0][0], email, temp[0][1])

    return app

    
    