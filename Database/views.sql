-- TODO: management role / views

-- ************* VIEWS *************
delimiter ;
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

        Product.Product_ID as Product_ID,
        
        Product.Product_name as Product_Name,

        order_products.quantity as Quantity,
    
        (order_products.quantity * Product.price * (100-Product.discount_percentage) * (100 +Product.GST_Percentage) / 10000 ) as Total_Price,
     
        CONCAT(Customer.House_number, " ", Customer.Locality, " ", Customer.City, " ", Customer.pincode) as Delivery_address, 
     
        Transaction.transaction_time as Transaction_Time,

        Del.Delivery_date as Delivery_Date


    from Orders, order_products, Transaction, Product, Customer, 
    delivery as Del

    where Orders.Order_ID = order_products.Order_ID 
        and order_products.Product_ID = Product.Product_ID 
        and Orders.Order_ID = Transaction.Order_ID 
        and Transaction.Customer_ID = Customer.Customer_ID
        and Del.order_id = Orders.order_id
);
commit;

-- Customer's complaints tracking
create view Customer_Complaints as (
    select customer.customer_ID,
    CONCAT(customer.first_name, " ", customer.last_name) as customer_name, 
    complains.service_employee_ID as Employee_ID,
    
    CONCAT(employee.first_name , " ", employee.last_name) as employee_name,
    employee.department as Employee_Department,
    employee.position as Employee_Position,
    
    complains.order_ID as Order_ID,
    complains.date_of_creation as Date_of_Complaint_Creation,
    complains.Details as Complaint_Details,
    complains.resolved as Resolution_Status

    from employee, complains natural join customer
    where complains.service_employee_id =  employee.employee_id
);
create view Most_valuable_customer as(
select customer_id,rank() over (order by total_order_cost desc) as customer_rank from 
(select Customer_id,sum(Total_Price) as total_order_cost from Transaction natural join Orders
 group by Customer_id) as T order by customer_rank);

create view Average_cost_of_orders_for_each_day as
(
    select date(transaction_time),avg(Total_price) over
    (order by date(transaction_time) rows unbounded preceding) as average_cost
    from Transaction natural join Orders where Transaction_Status = 1
);
select * from customer_complaints;

commit;
-- Customer's cart view
create view Customer_Cart as
(
    select 
        shopping_cart.customer_ID as Customer_ID,
        shopping_cart.Product_ID as Product_ID,
        product.Product_name as Product_Name,
        shopping_cart.quantity as Quantity,
        ROUND((product.price * (100-product.discount_percentage)*(100+product.GST_percentage)/10000), 2) 
            as Price_Per_Unit_Discount_and_Tax_Inclusive


    from shopping_cart natural join product
);

select * from customer_cart;

-- all products view
/* product, product rating, product photo, stores */

create view all_products as 
(select
    product.product_id as product_id,

    product.product_name as Product_name,

    product.price as Price,

    product.GST_Percentage as GST_Percentage,
    
    product.Discount_Percentage as Discount_Percentage,

    (
        select SUM(stores.stocks) 
        from stores
        where stores.product_id = product.product_id
    ) as Total_Available_Stock

    from product,Stores 
    where
        product.product_id = stores.product_id
);

-- View for suppliers, should have details of products they supply
create view Suppliers as 
(select 
    Vendor.vendor_ID as vendor_ID,
    (CONCAT(vendor.first_name, " ", vendor.last_name)) as Vendor_Name,
    (CONCAT(vendor.plot_number, " ", vendor.city, " ", vendor.pincode)) as Vendor_Address,
    Product.product_ID as Product_ID,
    product.product_Name as Product_Name,
    product.price as Unit_price,
    product.GST_percentage as GST_Percentage,
    Supplies.quantity as Quantity_Supplied

    from Vendor, Supplies, Product
    where 
        Vendor.vendor_id = supplies.vendor_id and
        Supplies.product_id = Product.product_id    
    );

select * from Suppliers;

-- service employee requires customer's complaints and their details
/* create view Service_Emp as
(select 
    employee.employee_ID as Employee_ID,
    

from service_employee, 
    
); */

create view Warehouse_Worker_view as 
(select 
    Warehouse_ID,Product_id,Stocks
    from Stores natural join Warehouse_Worker 
    );



-- ************* GRANTS *************
-- grant roles
DROP ROLE IF EXISTS Customer_role;
CREATE ROLE Customer_role ;
DROP ROLE IF EXISTS Suppliers_role;
CREATE ROLE Suppliers_role ;
DROP ROLE IF EXISTS Deliver_Guy_role;
CREATE ROLE Deliver_Guy_role ;
DROP ROLE IF EXISTS Warehouse_Worker_role;
CREATE ROLE Warehouse_Worker_role ;
DROP ROLE IF EXISTS Service_Emp_role;
CREATE ROLE Service_Emp_role ;
DROP ROLE IF EXISTS Manager_role;
CREATE ROLE Manager_role;


grant Service_Emp_role to Manager_role;

grant select on Average_cost_of_orders_for_each_day to Manager_role;
grant select on Customer_Complaints to Service_Emp_role;
grant select on Most_valuable_customer to Manager_role;
grant select on Customer_Order to Service_Emp_role;

grant select on Delivery_Guy to Deliver_Guy_role;

grant select on Warehouse_Worker_view to Warehouse_Worker_role;

grant select on Suppliers to Suppliers_role;

grant select on all_products to Customer_role;