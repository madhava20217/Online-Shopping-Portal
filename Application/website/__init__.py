from flask import Flask, render_template, request





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
    return app

    
