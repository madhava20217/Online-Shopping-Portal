#create index for email and password Customer

#create index for Price Product

#create index for Rating Product_rating

/* #create index for customer_id and product_id */

#create index for Customer_id and Order_id from Complains

#create index city for vendor

#create index city for Warehouse

#create index department and performance for Employee

#Create index total_price for Orders

/* #Create index Discount_Percentage fro Coupon */ */

#create index stock for stores


create index stock_index on stores(stock)

create index email_password_index on Customer(email_address,password)

create index Price_index on Product(Price)

create index Rating_index on product_rating(Rating)

create index Customer_id_Order_id_index on Complains(Customer_id,Order_id)

create index city_vendor_index on Vendor(city)

create index city_warehouse_index on Warehouse(city)

create index department_performance_index on Employee(department,performance)

Create index total_price_index on Orders(total_price) 