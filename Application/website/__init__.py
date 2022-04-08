from flask import Flask, render_template, request
from flask_mysqldb import MySQL

'''creates and returns an app object
    Parameters: no parameters
    Returns: app object made from flask with blueprints 
            from .views and .auth'''
def create_app():
    app = Flask(__name__)
    app.config['SECRET_KEY']='1234'

    from .views import views
    from .auth import auth

    app.register_blueprint(views, url_prefix='/')
    app.register_blueprint(auth, url_prefix='/')
    create_mysql(app)
    return app

'''Creates a mysql object given an app instance
    Parameters: app object
    Returns: mysql object'''
def create_mysql(app):
    app.config['MYSQL_DB'] = 'online_shopping'
    app.config['MYSQL_HOST'] = 'localhost'
    app.config['MYSQL_USER'] = 'root'
    app.config['MYSQL_PASSWORD'] = 'Madhava2207'

    mysql = MySQL(app)
    return mysql

'''Returns a cursor provided a mysql object
    Parameters: mysql object
    Returns: mysql connection cursor object'''
def get_cursor(mysql):
    return mysql.connection.cursor()
    



