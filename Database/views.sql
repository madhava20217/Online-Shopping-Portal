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

        Product.Product_ID as Product_ID,
        
        Product.Product_name as Product_Name,

        order_products.quantity as Quantity,
    
        Orders.Total_Price as Total_Price,
     
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

select * from customer_order;

commit;

-- Customer's complaints tracking
create view Customer_Complaint as (
    select customer.customer_ID,
    CONCAT(customer.first_name, " ", customer.last_name) as customer_name, 
    complains.order_ID as Order_ID,
    complains.date_of_creation as Date_of_Complaint_Creation,
    complains.Details as Complaint_Details,
    complains.resolved as Resolution_Status

    from complains natural join customer

);
select * from customer_complaint;

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

-- Customer's account view
create view Customer_account as ;

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

create view Service_Emp as
(select );

create view Warehouse_Worker as 
(select 
 from order_products, 
 where ):
