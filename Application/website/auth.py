from flask import Blueprint

auth = Blueprint('auth', __name__)

@auth.route('/login')
def login():
    return "<h1>LOGIN</h1>"
    
@auth.route('/signup')
def signup():
    return "<h1>signup</h1>"