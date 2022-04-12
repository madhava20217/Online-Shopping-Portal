from flask_login import UserMixin

# User Class
class User(UserMixin):
    def __init__(self, user_email, user_passwd, active=True):
        # self.user_id = user_tuple[0]
        self.user_email = user_email
        self.user_password = user_passwd

    def is_active(self):
        return True

    def is_authenticated(self):
        return True

    def is_anonymous(self):
        return False

    def get_id(self):
        return self.user_email