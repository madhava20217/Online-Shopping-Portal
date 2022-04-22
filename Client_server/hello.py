from emp_portal import create_app
from flask import Flask


if __name__ == "__main__":
    create_app().run(debug = True)