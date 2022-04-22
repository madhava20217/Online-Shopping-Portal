from flask_login import UserMixin, login_user, LoginManager, login_required, logout_user, current_user

class User(UserMixin):
    def __init__(self, id, username, label):
        '''constructor for user
        arguments:
        1) ID: primary key in database
        2) username: email address in database
        3) password: password entered
        4) label: boolean for True being vendor, False being employee 
        '''
        self.id = id
        self.username = username
        self.label = label

    def is_active(self):
        return True

    def is_authenticated(self):
        return True

    def is_anonymous(self):
        return True

    def get_id(self):
        return self.id

    def get_username(self):
        return self.username

    def get_role(self):
        return self.label

    def __repr__(self):
        return f"User('{self.id}', '{self.email}', '{self.label}')"