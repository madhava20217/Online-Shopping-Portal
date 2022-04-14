#TODO: product site: product rating average and take details 
#from sql queries
#TODO: make a page for showing previous orders of the customer

from flask import Blueprint, render_template, flash, request, flash, redirect, url_for
from flask_login import current_user, login_required, login_user, logout_user
import mysql.connector
from .User import User
from . import connect_db, getcursor, db_commit, mydb

views = Blueprint('views', __name__)

global prod_id
@views.route('/')
def home1():
    temp = []
    try:
        mydb
    except NameError as e:
        connect_db()

    cursor = getcursor()
    query = "select product_name, price, discount_percentage, product_id from all_products"
    cursor.execute(query)
    temp = list(iter(cursor.fetchall()))
    cursor.close()

    return render_template("Home1.html", all_prod = temp, user=current_user)
'''
@views.route('/2')
def home2():
    return render_template("Home2.html")

@views.route('/3')
def home3():
    return render_template("Home3.html")

@views.route('/4')
def home4():
    return render_template("Home4.html")

@views.route('/5')
def home5():
    return render_template("Home5.html")
'''

@views.route('/product/<pid>', methods=['GET','POST'])
def product(pid):
    temp=[]
    if request.method == 'POST':
        #TODO here
        quantity = request.form.get('quantity')
        print("*"*500)
        print(request.form)
        cursor = getcursor()
        try:
            #Check if that product is already present
            query2 = "select Customer_ID from Customer where email_address = %s"
            cursor.execute(query2, [current_user.get_id()])
            customer_id = list(iter(cursor.fetchall()))
            if len(customer_id) != 0:
                check_if_product_exists_in_cart = "select * from Shopping_Cart where exists(select * from Shopping_Cart where customer_ID = %s and Product_ID = %s)"
                cursor.execute(check_if_product_exists_in_cart,[customer_id[0][0],pid])
                product_present = False
                if len(list(iter(cursor.fetchall()))) != 0:
                        product_present = True
                # print(product_present)
                if(product_present == False):
                    insert_product = "Insert into Shopping_Cart values(%s,%s,%s)"
                    cursor.execute(insert_product,[customer_id[0][0],pid, quantity])
                    # cursor_ret(cursor)
                if(product_present == True):
                    increase_product_quantity = "Update Shopping_Cart set quantity = quantity + %s where customer_ID = %s and Product_ID = %s"
                    cursor.execute(increase_product_quantity,[quantity,customer_id[0][0],pid])
                flash("Product added to cart, quantity " + quantity, category = "success")
                db_commit()
            else:
                flash('Login to add to your cart', category='alert')
                return redirect(url_for('auth.login'))
        except Exception as e:
            flash('Failed to add to Cart!', category='error')
            print("Exception caught", e)
        cursor.close()


    try:
        mydb
    except NameError as e:
        connect_db()

    cursor2 = getcursor()
    prod_id = pid
    query = "select product_name, price, discount_percentage from all_products where product_id = %s"
    cursor2.execute(query, [prod_id])
    temp = list(iter(cursor2.fetchall()))
    cursor2.close()
    if (len(temp) == 0):
        return None
    return render_template("Product.html", prod_name = temp[0][0], prod_price = temp[0][1], prod_discount = temp[0][2], user=current_user)


@views.route('/cart', methods=['GET', 'POST'])
@login_required
def cart():
    try:
        mydb
    except NameError as e:
        connect_db()

    print(current_user)

    cursor = getcursor()
    query = "select * from Customer where email_address = %s"
    cursor.execute(query, [current_user.get_id()])
    Customer_id = list(iter(cursor.fetchall()))
    cursor.close()
    prod_list = []
    final_list = []
    if len(Customer_id) != 0:
        cursor2 = getcursor()
        query2 = "select * from Shopping_Cart where customer_ID = %s"
        cursor2.execute(query2, [Customer_id[0][0]])
        prod_list = list(iter(cursor2.fetchall()))
        cursor2.close()

        for prod in prod_list:
            query3 = "select * from Product where Product_ID = %s"
            cursor3 = getcursor()
            cursor3.execute(query3, [prod[1]])
            prod_details = list(iter(cursor3.fetchall()))
            cursor3.close()
            final_list.append((prod, prod_details))

    # Structure of final_list:
    # [((customer_id, product_id, quantity), [(product_id, price, name, discount, gst)]),.....]
    if request.method == 'POST':
        cursor = getcursor()
        customer_id =  final_list[0][0][0]
        get_order_id = "select max(ordr_id) rom "
        insert_values_into_order = "insert into Orders select %s,sum(price),avg(GST_percentage),avg(Discount_Percentage) from Product natural join Shopping_cart where Customer_id = %s"
        cursor.execute(insert_values_into_order,[order_id,customer_id])
        extract_product_ids = "select product_id from Shopping_Cart where Customer_id = %s"
        cursor.execute(extract_product_ids,[customer_id])
        products_iterator = iter(cursor.fetchall())
        product_id_list = list(products_iterator)

        extract_quantity = "select quantity from Shopping_Cart where Customer_id = %s"
        cursor.execute(extract_quantity,[customer_id])
        quantity_iterator = iter(cursor.fetchall())
        quantity_id_list = list(quantity_iterator)

        for i in range(len(quantity_id_list)):
            product = product_id_list[i][0]
            quantity = quantity_id_list[i][0]
            check_if_product_aready_ordered = "select * from order_products where exists(select * from order_products where order_id = %s and Product_ID = %s)"
            cursor.execute(check_if_product_aready_ordered,[order_id,product])
            product_ordered = False
            if len(list(iter(cursor.fetchall()))) != 0:
                    product_ordered = True
            # print(product_present)
            if(product_ordered == False):
                insert_product = "Insert into order_products values(%s,%s,%s)"
                cursor.execute(insert_product,[order_id,product,quantity])
                # cursor_ret(cursor)
            if(product_ordered == True):
                increase_product_quantity = "Update order_products set quantity = quantity + %s where order_id = %s and Product_ID = %s"
                cursor.execute(increase_product_quantity,[order_id,product,quantity])
            order_id +=1
            mydb.commit()

    return render_template("Cart.html", user=current_user, prod_list=final_list)

@views.route('/order')
@login_required
def order():
    try:
        mydb
    except NameError as e:
        connect_db()

    #current_user.get_id() returns a string which is the email address of the logged in user
    #print(current_user.get_id())   #debugging
    orders_list = []
    cursor = getcursor()
    try:
        query1 = "select Order_ID, Product_Name, Quantity, Delivery_address, Transaction_Time, Delivery_Date, Total_Price from Customer_Order where Customer_ID = %s"
        query2 = "select Customer_ID from Customer where email_address = %s"
        # print("CURRENT USER's TYPE",type(current_user.get_id()))  #debugging
        cursor.execute(query2, [current_user.get_id()])
        customer_id = list(iter(cursor.fetchall()))
        if len(customer_id) != 0:
            cursor.execute(query1,[customer_id[0][0]])
            orders_list = list(iter(cursor.fetchall()))
    except Exception as e:
        print("Exception caught", e)


    cursor.close()
    # #trying to pass edited order list to display like grofers
    # order_dict = {}
    # for order in orders_list:
    #     if(order[0] in order_dict.keys()):
    #         order_dict[order[0]].append(order[1:])
    #     else:
    #         order_dict[order[0]] = [order[1:]]
    print("ORDERS LIST", orders_list)     #debugging

    return render_template("Order.html", user=current_user, orders_list = orders_list)



