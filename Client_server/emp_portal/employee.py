from flask_login import UserMixin
from .db import get_employee

# Employee Class
class Employee(UserMixin):
    def __init__(self, employee_id, employee_email,employee_type, active=True):
        self.employee_id = employee_id
        self.employee_email = employee_email
        self.employee_type = employee_type

    def is_active(self):
        return True

    def is_authenticated(self):
        return True

    def is_anonymous(self):
        return False

    def get_id(self):
        return self.employee_id

    def emp_type(self):
        return self.employee_type
        