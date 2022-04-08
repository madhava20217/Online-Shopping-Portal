from flask import Blueprint

views = Blueprint('views', __name__)

@views.route('/')
def home():
    return "<h1>HOME</h1>"

@views.route('/cart')
def signup():
    return "<h1>cart</h1>"