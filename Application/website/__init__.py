from cmath import log
from flask import Flask, render_template, request
from flask_login import LoginManager, login_user, UserMixin, AnonymousUserMixin
from .User import User
from .integration import MyDBConnector
import mysql.connector

# #defining global variable for database login measures
# global mydb
# mydb = mysql.connector.connect(host = "localhost",
# 								user = "root",
# 								password = "Jga@10000",
# 								database = "online_shopping")


# def connect_db():
# 	''' function to initialise connection to online shopping database in mydb'''
# 	mydb = mysql.connector.connect(host = "localhost",
# 								user = "root",
# 								password = "Jga@10000",
# 								database = "online_shopping")

# 	return mydb


# def getcursor():
# 	'''function to get cursor object from database connection instance'''
# 	return mydb.cursor(buffered = True)

# def db_commit():
# 	mydb.commit();

myDB = MyDBConnector()

def create_app():
	'''creates and returns an app object
	Parameters: no parameters
	Returns: app object made from flask with blueprints 
			from .views and .auth'''
	app = Flask(__name__)


	app.config['SECRET_KEY']='1234'

	from .views import views
	from .auth import auth

	app.register_blueprint(views, url_prefix='/')
	app.register_blueprint(auth, url_prefix='/')

	login_manager = LoginManager()
	login_manager.login_view = 'auth.login'
	login_manager.init_app(app)

	@login_manager.user_loader
	def load_user(useremail):		
		#if length isn't 0, we found the customer!
		temp = myDB.get_Customer(useremail)
		if len(temp) != 0:
			return User(temp[0][7], temp[0][8])
		else:
			return None

	return app
