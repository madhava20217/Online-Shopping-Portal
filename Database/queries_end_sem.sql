/* Customer Portal */
select * from Customer where email_address = %s and password = %s;
select * from customer where email_address = %s;
INSERT INTO Customer(First_name, Last_name, House_number, Locality, City, Pincode, email_address, password) values (%s, %s, %s, %s, %s, %s, %s, %s);
insert into complains (customer_ID, order_ID, service_employee_id, date_of_creation, details, resolved) values (%s,%s,%s,%s,%s,%s);
INSERT INTO Product (Price, Product_name, Discount_Percentage, GST_Percentage) values (%s,%s,%s,%s);
Insert into order_products(order_id, product_id, quantity) values (%s,%s,%s);
INSERT INTO Shopping_Cart (Customer_ID, Product_ID, Quantity) values (%s,%s,%s);
insert into Order(order_id,Total_Price, Taxes, Total_Discount_Percentage) values(%s,%s,%s);
select product_name, price, discount_percentage, product_id from all_products;
select Warehouse_ID,Stocks from Stores where Product_ID = %s and Stocks > 0;
select 1 from Shopping_Cart where customer_ID = %s and Product_ID = %s;
select quantity from Shopping_Cart where Customer_id = %s and Product_id = %s;
Update Shopping_Cart set quantity = quantity + %s where customer_ID = %s and Product_ID = %s;
select product_name, price, discount_percentage from all_products where product_id = %s;
select * from Shopping_Cart where customer_ID = %s;
select * from Product where Product_ID = %s;
select max(order_id) from Orders;
insert into Orders select %s,sum(price * quantity),avg(GST_percentage),avg(Discount_Percentage) from Product natural join Shopping_cart where Customer_id = %s;
delete from Shopping_cart where Customer_id = %s;
update Stores SET Stocks = Stocks - %s where  Product_ID = %s and Warehouse_ID = %s

select 1 from order_products where order_id = %s and Product_ID = %s;

Update order_products set quantity = quantity + %s where order_id = %s and Product_ID = %s;

delete from Orders where order_ID = %s;
UPDATE Orders SET Total_Price = (SELECT sum(price * quantity) from Product natural join Shopping_cart where Customer_id = %s) where order_id = %s;
UPDATE Orders SET Taxes = (select avg(GST_percentage) from Product natural join Shopping_cart where Customer_id = %s) where order_id = %s;

UPDATE Orders SET Total_Discount_Percentage = (select avg(Discount_Percentage) from Product natural join Shopping_cart where Customer_id = %s) where order_id = %s;

insert into transaction values (%s, %s, %s, %s, %s, %s)
select Employee_ID from Delivery_Partner;

insert into delivery values (%s, %s, %s, %s, NULL);
select Order_ID, Product_Name, Quantity, Delivery_address, Transaction_Time, Delivery_Date, Total_Price from Customer_Order where Customer_ID = %s ORDER BY Transaction_time DESC;
select * from Transaction where Order_ID = %s and Customer_ID = %s;

/* Employee Portal */
insert into vendor(first_name, last_name, plot_number, city, pincode, email_address, password) values (%s, %s, %s, %s, %s, %s, %s);
select vendor_ID from vendor where email_address = %s limit 1;
select * from vendor where email_address = %s limit 1;
select * from employee where email_address = %s limit 1;
select employee_id from delivery_partner where employee_id = %s limit 1;
select employee_id from service_employee where employee_id = %s limit 1;
select employee_id from warehouse_worker where employee_id = %s limit 1;
select email_address from vendor where vendor_ID = %s limit 1;
select email_address from Employee where employee_ID = %s limit 1;
update stores set stocks = stocks + %s where product_id = %s order by stocks ASC limit 1;
select 1 from Supplies where Product_ID = %s and Vendor_id = %s;
Update Supplies set quantity = quantity + %s where Product_ID = %s and Vendor_id = %s;
select max(product_id) from Product;
select Warehouse_ID from Stores where product_id = %s order by stocks limit 1;
Insert into Supplies (Vendor_ID, Product_ID, Quantity) values(%s,%s,%s);
select order_id, customer_address, Warehouse_address from delivery_guy where Delivery_date is null and employee_id = %s;
select Order_ID, complaint_details , date_of_complaint_creation ,complaint_number from Customer_Complaints where Employee_ID = %s and Resolution_Status = "N";
update complains set resolved = 'Y' where complaint_number = %s;
update Delivery set delivery_date = %s where order_id = %s;



/*  Advanced sql queries */

/*  Ranking */

create view Most_valuable_customer as(
select customer_id,rank() over (order by total_order_cost desc) as customer_rank from 
(select Customer_id,sum(Total_Price) as total_order_cost from Transaction natural join Orders
 group by Customer_id) as T order by customer_rank);

/*  Windowing */
create view Average_cost_of_orders_for_each_day as
(
    select date(transaction_time),avg(Total_price) over
    (order by date(transaction_time) rows unbounded preceding) as average_cost
    from Transaction natural join Orders where Transaction_Status = 1
);

