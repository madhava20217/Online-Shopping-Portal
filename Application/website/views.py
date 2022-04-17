#TODO: product site: product rating average and take details 
#from sql queries
#TODO: make a page for showing previous orders of the customer


from flask import Blueprint, render_template, flash, request, flash, redirect, url_for
from flask_login import current_user, login_required, login_user, logout_user
import mysql.connector
import random
from .User import User
from . import myDB
from datetime import datetime

views = Blueprint('views', __name__)

global prod_id
@views.route('/')
def home1():
    print(current_user)
    print(current_user.get_id())
    temp = []
    try:
        temp = myDB.get_all_products
    except Exception as e:
        print(e)

    return render_template("Home1.html", all_prod = temp, user=current_user)


@views.route('/product/<pid>', methods=['GET','POST'])
def product(pid):
    temp=[]
    no_add_OOS = False          #boolean for out of stock state
    if request.method == 'POST':
        quantity = int(request.form.get('quantity'))
        print("*"*500)
        print(request.form)
        cursor = getcursor()
        try:
            choose_warehouse = "select Warehouse_ID,Stocks from Stores where Product_ID = %s and Stocks > 0"
            cursor.execute(choose_warehouse,[pid])
            warehouse_avaialable_stock = iter(cursor.fetchall())
            warehouse_stock_list = list(warehouse_avaialable_stock)
            max_stock_warehouse_id = -1
            final_quantity_to_be_given = -1
            max_stock_available_at_warehouse = -1
            # print(warehouse_stock_list)
            #print(type(quantity))
            if(range(len(warehouse_stock_list)) == 0):
                flash('Product is out of stock', category='error')
            else:
                for i in range(len(warehouse_stock_list)):
                    if(max_stock_available_at_warehouse < warehouse_stock_list[i][1]):
                        max_stock_available_at_warehouse =  warehouse_stock_list[i][1]
                    if(warehouse_stock_list[i][1] > quantity):
                        final_quantity_to_be_given = quantity
                        max_stock_warehouse_id = warehouse_stock_list[i][0]
                        break
                    else:
                        if(final_quantity_to_be_given < warehouse_stock_list[i][1]):
                            final_quantity_to_be_given = warehouse_stock_list[i][1]
                            max_stock_warehouse_id = warehouse_stock_list[i][0]
                quantity = final_quantity_to_be_given
                #Check if that product is already present
                if (myDB.current_customer[7] == current_user.get_id()):
                    customer_id = myDB.current_customer
                else:
                    customer_id = myDB.get_Customer(current_user.get_id())

                #customer exists
                if (len(customer_id) != 0):
                    check_if_product_exists_in_cart = "select * from Shopping_Cart where exists(select * from Shopping_Cart where customer_ID = %s and Product_ID = %s)"
                    cursor.execute(check_if_product_exists_in_cart,[customer_id[0][0],pid])
                    product_present = False

                    #checking if product exists in cart (for incrementing the value)
                    if len(list(iter(cursor.fetchall()))) != 0:
                            product_present = True
                    
                    #Product isn't present in the cart, so we need to add it to cart
                    if(product_present == False):

                        insert_product = "Insert into Shopping_Cart values(%s,%s,%s)"
                        cursor.execute(insert_product,[customer_id[0][0],pid, quantity])
                    
                    #Product is present in the cart, we can simply increment the value (till the permissible stock levels)
                    if(product_present == True):
                        get_quantity_of_product_aready_ordered = "select quantity from Shopping_Cart where Product_ID = %s and Customer_id = %s"
                        cursor.execute(get_quantity_of_product_aready_ordered,[pid,customer_id[0][0]])
                        quantity_iterator1 = iter(cursor.fetchall())
                        quantity_id_only_1 = list(quantity_iterator1)
                        already_in_cart_quantity = quantity_id_only_1[0][0]
                        quantity_of_product_that_can_be_ordered = max_stock_available_at_warehouse - already_in_cart_quantity
                        if(quantity_of_product_that_can_be_ordered >= quantity):
                            # flash("Error submitting your complain! Please try again later", category="error")
                            pass
                        else:
                            if(quantity_of_product_that_can_be_ordered == 0):
                                flash("Product out of stock!", category = "error")
                                no_add_OOS = True
                            quantity = quantity_of_product_that_can_be_ordered
                        increase_product_quantity = "Update Shopping_Cart set quantity = quantity + %s where customer_ID = %s and Product_ID = %s"
                        cursor.execute(increase_product_quantity,[quantity,customer_id[0][0],pid])
                    if(not no_add_OOS):
                        flash("Product added to cart, quantity " + str(quantity), category = "success")
                    db_commit()
                else:
                    flash('Login to add to your cart', category='error')
                    return redirect(url_for('auth.login'))
        except Exception as e:
            flash('Failed to add to Cart!', category='error')
            print("Exception caught", e)
        cursor.close()

    prod_id = pid
    query = "select product_name, price, discount_percentage from all_products where product_id = %s"
    cursor2.execute(query, [prod_id])
    temp = list(iter(cursor2.fetchall()))

    if (len(temp) == 0):
        return None
    return render_template("Product.html", prod_name = temp[0][0], prod_price = temp[0][1], prod_discount = temp[0][2], user=current_user)


@views.route('/cart', methods=['GET', 'POST'])
@login_required
def cart():

    if (myDB.current_customer[7] == current_user.get_id()):
        Customer_id = myDB.current_customer
    else:
        Customer_id = myDB.get_Customer(current_user.get_id())

    prod_list = []
    final_list = []
    if len(Customer_id) != 0:

        query2 = "select * from Shopping_Cart where customer_ID = %s"
        cursor2.execute(query2, [Customer_id[0][0]])
        prod_list = list(iter(cursor2.fetchall()))


        for prod in prod_list:
            query3 = "select * from Product where Product_ID = %s"

            cursor3.execute(query3, [prod[1]])
            prod_details = list(iter(cursor3.fetchall()))

            final_list.append((prod, prod_details))

    # Structure of final_list:
    # [((customer_id, product_id, quantity), [(product_id, price, name, discount, gst)]),.....]
    if request.method == 'POST':

        customer_id =  final_list[0][0][0]
        if(request.form.get('form') == "checkout"):
            total_cost = 0
            get_order_id = "select max(order_id) from Orders"
            cursor.execute(get_order_id)
            coupon_code = None
            order_id_iterator = iter(cursor.fetchall())
            order_id_list = list(order_id_iterator)
            order_id = order_id_list[0][0] + 1
            insert_values_into_order = "insert into Orders select %s,sum(price * quantity),avg(GST_percentage),avg(Discount_Percentage) from Product natural join Shopping_cart where Customer_id = %s"
            cursor.execute(insert_values_into_order,[order_id,customer_id])
            extract_product_ids = "select product_id from Shopping_Cart where Customer_id = %s"
            cursor.execute(extract_product_ids,[customer_id])
            products_iterator = iter(cursor.fetchall())
            product_id_list = list(products_iterator)
            extract_quantity = "select quantity from Shopping_Cart where Customer_id = %s"
            cursor.execute(extract_quantity,[customer_id])
            quantity_iterator = iter(cursor.fetchall())
            quantity_id_list = list(quantity_iterator)

            
            delete_from_shopping_cart = "delete from Shopping_cart where Customer_id = %s"
            cursor.execute(delete_from_shopping_cart,[customer_id])
            db_commit()
            flag = 0
            for i in range(len(quantity_id_list)):
                product = product_id_list[i][0]
                quantity = quantity_id_list[i][0]
                choose_warehouse = "select Warehouse_ID,Stocks from Stores where Product_ID = %s and Stocks > 0"     #chooses maximally stocked warehouse
                cursor.execute(choose_warehouse,[product])
                warehouse_avaialable_stock = iter(cursor.fetchall())
                warehouse_stock_list = list(warehouse_avaialable_stock)
                max_stock_warehouse_id = -1    #may not be required
                final_quantity_to_be_given = -1
                max_stock_available_at_warehouse = -1
                # print(warehouse_stock_list)
                #print(type(quantity))
                # the case when the product is out of stock
                print("*"*150)
                print("/n" "Value of warehouse list is" + "/n")
                print(warehouse_stock_list)
                if(len(warehouse_stock_list) == 0):
                    flash('Product is out of stock', category='alert')
                    break
                else:
                    flag = 1
                    for i in range(len(warehouse_stock_list)):
                        if(max_stock_available_at_warehouse < warehouse_stock_list[i][1]):
                            max_stock_available_at_warehouse =  warehouse_stock_list[i][1]
                        if(warehouse_stock_list[i][1] > quantity):
                            final_quantity_to_be_given = quantity
                            max_stock_warehouse_id = warehouse_stock_list[i][0]
                            break
                        else:
                            if(final_quantity_to_be_given < warehouse_stock_list[i][1]):
                                final_quantity_to_be_given = warehouse_stock_list[i][1]
                                max_stock_warehouse_id = warehouse_stock_list[i][0]
                    if(final_quantity_to_be_given !=-1):
                        decrement_product = "update Stores SET Stocks = Stocks - %s where  Product_ID = %s and Warehouse_ID = %s"
                        cursor.execute(decrement_product,[final_quantity_to_be_given,product,max_stock_warehouse_id])
                    quantity = final_quantity_to_be_given
                    stock_avaialable = final_quantity_to_be_given
                   
                    
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
                        
                    insert_product = "Insert into Shopping_Cart values(%s,%s,%s)"
                    cursor.execute(insert_product,[customer_id,product, quantity])
                    mydb.commit()

            if(flag == 0):
                delete_values_in_order = "delete from Orders where order_ID = %s"
                cursor.execute(delete_values_in_order,[order_id])
            else:
                update_values_in_order = "UPDATE Orders SET Total_Price = (SELECT sum(price * quantity) from Product natural join Shopping_cart where Customer_id = %s) where order_id = %s"
                cursor.execute(update_values_in_order,[customer_id,order_id])
                
                update_values_in_order = "UPDATE Orders SET Taxes = (select avg(GST_percentage) from Product natural join Shopping_cart where Customer_id = %s) where order_id = %s"
                cursor.execute(update_values_in_order,[customer_id,order_id])
            
                update_values_in_order = "UPDATE Orders SET Total_Discount_Percentage = (select avg(Discount_Percentage) from Product natural join Shopping_cart where Customer_id = %s) where order_id = %s"
                cursor.execute(update_values_in_order,[customer_id,order_id])
                
                
                #adding details into transaction
                transaction_add = "insert into transaction values (%s, %s, %s, %s, %s, %s)"
                cursor.execute(transaction_add, [order_id, "test", 1, datetime.now(), customer_id, coupon_code])
            
                #adding details into delivery
                delivery_add = "insert into delivery values (%s, %s, %s, %s, %s);"
                cursor.execute(delivery_add, [order_id, None, customer_id,max_stock_warehouse_id, None])

            #deleting items from shopping cart
            delete_from_shopping_cart = "delete from Shopping_cart where Customer_id = %s"
            cursor.execute(delete_from_shopping_cart,[customer_id])
        
        else:
            #deleting items from shopping cart
            delete_from_shopping_cart = "delete from Shopping_cart where Customer_id = %s"
            cursor.execute(delete_from_shopping_cart,[customer_id])
            mydb.commit()
            cursor.close()
            return redirect(url_for('views.cart'))
        mydb.commit()
        cursor.close()
        return redirect(url_for('views.order'))
    return render_template("Cart.html", user=current_user, prod_list=final_list)

@views.route('/order')
@login_required
def order():
    orders_list = []

    try:
        query1 = "select Order_ID, Product_Name, Quantity, Delivery_address, Transaction_Time, Delivery_Date, Total_Price from Customer_Order where Customer_ID = %s ORDER BY Transaction_time DESC"
        if (myDB.current_customer[7] == current_user.get_id()):
            customer_id = myDB.current_customer
        else:
            customer_id = myDB.get_Customer(current_user.get_id())

        if len(customer_id) != 0:
            cursor.execute(query1,[customer_id[0][0]])
            orders_list = list(iter(cursor.fetchall()))
    except Exception as e:
        print("Exception caught", e)

    return render_template("Order.html", user=current_user, orders_list = orders_list)



@views.route('/complaint/<order_id>', methods=['GET', 'POST'])
@login_required
def complaint(order_id):
    if (request.method == 'POST'):
        user_complaint = request.form.get('input_complain')

        try:
            query2 = "select * from Transaction where Customer_ID = %s and Order_ID = %s"

            if (myDB.current_customer[7] == current_user.get_id()):
                cust_id = myDB.current_customer
            else:
                cust_id = myDB.get_Customer(current_user.get_id())

            cursor.execute(query2, [cust_id[0], order_id])
            valid_order = list(iter(cursor.fetchall()))

            if (len(valid_order) != 0):
                service_emp_id = random.randint(21, 51)
                date_of_create = datetime.now()
                complaint_info = [cust_id[0], order_id, service_emp_id, date_of_create, user_complaint, 'N']
                myDB.add_Complaint(complaint_info)
                flash("We have recieved your Complaint. Thank you for your valuable feedback.", category="success")
            else:
                flash("Error submitting your complaint! Please try again later", category="error")

            return redirect(url_for('views.order'))

        except Exception as e:
            print("Exception caught", e)
            flash("Error submitting your complain! Please try again later", category="error")
            return redirect(url_for('views.order'))
        
    return render_template("Complaint.html", user=current_user)