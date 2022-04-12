#TODO: product site: product rating average and take details 
#from sql queries
#TODO: make a page for showing previous orders of the customer

from flask import Blueprint, render_template, flash, request
from flask_login import current_user, login_required, login_user, logout_user

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
    # get product id, name, price, discount, and customer id 
    if request.method == 'POST':
        #TODO here
        # print("added to cart")
        quantity = request.form.get('quantity')


        flash('Added to Cart!', category='success')
        pass
    return render_template("Product.html", prod_name = "adfadsf", prod_price = "53", prod_discount = "1", user=current_user)

@views.route('/cart')
@login_required
def cart():
    return render_template("Cart.html", user=current_user)

@views.route('/order')
def order():
    return render_template("Order.html", user=current_user)
