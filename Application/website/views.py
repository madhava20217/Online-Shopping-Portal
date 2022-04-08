from flask import Blueprint, render_template

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

@views.route('/cart')
def signup():
    return render_template("Cart.html")
