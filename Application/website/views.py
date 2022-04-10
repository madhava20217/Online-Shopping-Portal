#TODO: product site: product rating average and take details 
#from sql queries
#TODO: make a page for showing previous orders of the customer

from flask import Blueprint, render_template, request

views = Blueprint('views', __name__)

@views.route('/')
def home1():
    return render_template("Home1.html")

@views.route('/2')
def home2():
    return render_template("Home2.html")

@views.route('/3')
def home3():
    return render_template("Home3.html")

@views.route('/4')
def home4():
    return render_template("Home4.html")

@views.route('/5')
def home5():
    return render_template("Home5.html")

@views.route('/product', methods=['GET','POST'])
def product():
    if request.method == 'POST':
        #TODO here
        pass
    return render_template("Product.html", prod_name = "adfadsf", prod_price = "53", prod_discount = "1")

@views.route('/cart')
def cart():
    return render_template("Cart.html")
