from cmath import log
from flask import Flask, render_template, request
from flask_login import LoginManager, login_user, UserMixin, AnonymousUserMixin
from .User import User
import mysql.connector

#defining global variable for database login measures
global mydb
mydb = mysql.connector.connect(host = "localhost",
								user = "root",
								password = "Madhava2207",
								database = "online_shopping")


def connect_db():
	''' function to initialise connection to online shopping database in mydb'''
	mydb = mysql.connector.connect(host = "localhost",
								user = "root",
								password = "Madhava2207",
								database = "online_shopping")

	return mydb


def getcursor():
	'''function to get cursor object from database connection instance'''
	return mydb.cursor(buffered = True)

def db_commit():
	mydb.commit();

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
		try:
			mydb
		except NameError as e:
			connect_db()
		
		cursor = getcursor()
		login_query = "select email_address, password from Customer where email_address = %s"
		cursor.execute(login_query, [useremail])
		
		#if length isn't 0, we found the customer!
		temp = list(iter(cursor.fetchall()))
		cursor.close()
	
		if len(temp) != 0:
			return User(temp[0][0], temp[0][1])
		else:
			# return AnonymousUser()
			return None

	return app
