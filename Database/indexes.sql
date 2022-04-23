
-- sql automatically creates index for primary keys so indexes for primary keys not made. All primary keys would need to be indexed 
-- create index for email and password Customer

-- create index for Price Product
-- create index for customer_id and product_id
-- create index for Customer_id and Order_id from Complains
-- create index city for vendor
-- create index city for Warehouse
-- create index department and performance for Employee
-- Create index total_price for Orders
-- Create index Discount_Percentage fro Coupon
-- create index stock for stores

create index email_password_index_customer on Customer(email_address, password);

create index email_password_index_vendor on Vendor(email_address, password);
create index stock_index on stores(stock);

create index quantity_index on Shopping_Cart(quantity);

create index order_products on Shopping_Cart(products);

create index store_product_id on Stores(product_id);

create index Customer_transaction on Transaction(Customer_id);

create index Complains_employee on Complains(service_employee_id);

create index Supply_product on Supply(product_id);


/* create index Price_index on Product(Price); */
/* 
create index Rating_index on product_rating(Rating); */

/* create index Customer_id_Order_id_index on Complains(Customer_id,Order_id);

create index city_vendor_index on Vendor(city);

create index city_warehouse_index on Warehouse(city);

create index department_performance_index on Employee(department,performance);

Create index total_price_index on Orders(total_price); */

