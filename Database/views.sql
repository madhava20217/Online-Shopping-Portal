--TODO: change the table name of Del when delivery table is fixed (added delivery-date attribute)


create view Delivery_Guy as 
(select Delivery.Order_ID, Delivery.Employee_ID, Customer.House_number as Customer_House_No, Customer.Locality as Customer_Locality, 
Customer.City as Customer_City, Customer.pincode as Customer_PinCode, Warehouse.Plot_number as Warehouse_Address,
 Warehouse.City as Warehouse_City, Warehouse.pincode as Warehouse_PinCode from Delivery, Customer, Warehouse where 
 (Customer.customer_ID = Delivery.Customer_ID and Delivery.Warehouse_ID = Warehouse.Warehouse_ID));

-- Views for customer : cart, complaint, order

-- Customer_order:
-- product, order_product, order, transaction, customer
-- products they bought, name, order_id
-- delivery address, transaction date/time, 
-- cost of product, 

-- customer: primary key is customer_id
-- Transaction table: primary key is order_id
-- product: primary key is product_id
-- order_product: order_id, product_id
-- transaction: order_id, customer, coupon



create view Customer_Order as
(
    select 
        customer.customer_id as Customer_ID, 
        
        CONCAT(customer.first_name, " ", customer.last_name) as customer_name, 

        Orders.Order_ID as Order_ID, 
        
        Product.Product_name as Product_Name,

        order_products.quantity as Quantity,
    
        Orders.Total_Price as Total_Price,
     
        CONCAT(Customer.House_number, " ", Customer.Locality, " ", Customer.City, " ", Customer.pincode) as Delivery_address, 
     
        Transaction.transaction_time as Transaction_Time,

        Del.Delivery_date as Delivery_Status


    from Orders, order_products, Transaction, Product, Customer, delivered_orders as Del

    where Orders.Order_ID = order_products.Order_ID 
        and order_products.Product_ID = Product.Product_ID 
        and Orders.Order_ID = Transaction.Order_ID 
        and Transaction.Customer_ID = Customer.Customer_ID
        and Del.order_id = Orders.order_id
);

drop view customer_order;

select * from customer_order;


-- Customer's complaints tracking
create view Customer_Complaint as


-- Customer's cart view
create view Customer_Cart as

-- Customer's account view
create view Customer_account as 


-- View for suppliers
create view Suppliers as 
(select product,quantity from Supplies where Vendor_ID);

create view Service_Emp as
(select );

create view Warehouse_Worker as 
(select 
 from order_products, 
 where ):
