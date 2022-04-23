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
        return render_template('home.html')
    
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
                login_user(vend)
                print(type(current_user.get_id()), current_user.get_id())
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
            login_user(emp)
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
    @login_required
    def emp_logout():
        logout_user()
        return redirect("/")

    @app.route('/api/vend_logout')
    @login_required
    def vend_logout():
        logout_user()
        return redirect("/")


    @app.route("/emp_dashboard_del")
    @login_required
    def del_dashboard():
        del_list = get_delivery_list(current_user.get_id())
        if del_list==None:
            del_list=[]
        return render_template("delivery_emp_dashboard.html", delivery=del_list)

    @app.route("/api/emp_dashboard_del", methods=['POST'])
    @login_required
    def del_dashboard_post():
        order_id = request.form['form-name']
        print("{"*100)
        print(order_id)
        temp = delivered_order(order_id)
        if temp==False:
            flash("Error while updating. Please Try again!", category="error")
        return redirect("/emp_dashboard_del")
        

    @app.route("/emp_dashboard_ser")
    @login_required
    def service_dashboard():
        comp_list = get_complaint_list(current_user.get_id())
        if comp_list==None:
            comp_list=[]
        return render_template("service_emp_dashboard.html", complaint_list=comp_list)

    @app.route("/api/emp_dashboard_ser", methods=['POST'])
    @login_required
    def service_dashboard_post():
        complaint_id = request.form['form-name']
        temp = resolved_complaint(complaint_id)
        if temp==False:
            flash("Cannot mark complaint as resolved! Try again!", category="error")
        return redirect("/emp_dashboard_ser")

    @app.route("/vendor_dashboard")
    @login_required
    def vendor_dashboard():
        return render_template("vendor_dashboard.html")

    @app.route("/api/vendor_dashboard", methods=['POST'])
    @login_required
    def vendor_dashboard_post():       
        prod_id = request.form['prod_id']
        quantity = request.form['quantity']
        print("inside vendor_dashboard(): ", end='')
        print(current_user.get_id())
        temp = restock_prod(current_user.get_id(), prod_id, quantity)
        if temp==None:
            flash("Entered Product ID does not exist", category="error")
        else:
            flash("Stock Updated!", category="success")

        return redirect("/vendor_dashboard")
        

    @app.route("/vendor_add_new_product")
    @login_required
    def add_prod():
        return render_template("add_prod.html")

    @app.route("/api/vendor_add_new_product", methods=['POST'])
    @login_required
    def add_new_prod():
        prod_name = request.form['prod_name']
        price = request.form['price']
        discount = request.form['discount']
        gst = request.form['gst']
        stock = request.form['stock']
        gst = int(gst)
        discount = int(discount)
        price = int(price)

        temp = add_new_product(current_user.get_id(), prod_name, price, discount, gst, stock)
        if temp==None:
            flash("Error! Try again later", category="error")
            return redirect("/vendor_add_new_product")
        else:
            flash("New Product Successfully added", category="success")
        return redirect("/vendor_dashboard")


    login_manager = LoginManager()
    login_manager.init_app(app)
    # login_manager.login_view = 'emp_login'

    @login_manager.user_loader
    def load_user(id):
        temp = getVendor_by_ID(id)
        # print("email inside laod user", id)
        # print("inside load user", temp)
        if temp==None:
            temp = getEmp_by_ID(id)
            if temp==None or temp==False or temp==-1:
                return None
            else:
                return Employee(id, temp[0], temp[1])
        else:
            return Vendor(id, temp)

    return app

    
    