from flask_login import UserMixin

# Vendor Class
class Vendor(UserMixin):
    def __init__(self, vendor_id, vendor_email, active=True):
        self.vendor_id = vendor_id
        self.vendor_email = vendor_email

    def is_active(self):
        return True

    def is_authenticated(self):
        return True

    def is_anonymous(self):
        return False

    def get_id(self):
        return self.vendor_id
    
    def get_email(self):
        return self.vendor_email