#TODO: Clean up mysql connector imports and files

from flask import Blueprint, render_template, request

auth = Blueprint('auth', __name__)

@auth.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form.get('email')
        password = request.form.get('password1')

        ## query to find user by email
        # user = User.query.filter_by(email = email).first()
        # if user:
            ## if user email exists in the database
            # if check_password_hash(user.password, password):
            #     flash("Logged in successfully!", category='success')
            #     login_user(user, remember=True)
            #     return redirect(url_for('views.home'))
            # else:
                ## incorrect password
        # else:
            ## email doesn't exist
    return render_template("Login.html")
    
@auth.route('/signup', methods=['GET', 'POST'])
def signup():
    
    return render_template("Signup.html")