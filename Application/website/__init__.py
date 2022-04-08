#TODO: create class for connector / cursor

from flask import Flask, render_template, request
from flaskext.mysql import MySQL





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

    #SQL connection preparation
    app.config['MYSQL_DATABASE_DB'] = 'online_shopping'
    app.config['MYSQL_DATABASE_HOST'] = 'localhost'
    app.config['MYSQL_DATABASE_USER'] = 'root'
    app.config['MYSQL_DATABASE_PASSWORD'] = 'Madhava2207'

    mysql = MySQL()

    mysql.init_app(app)

    #declaring global variable for sql queries / cursor
    global db_connection = mysql.connect()

    return app

'''Returns a cursor to the database pointed to db_connection'''
def get_cursor():
    return db_connection.cursor()

    
