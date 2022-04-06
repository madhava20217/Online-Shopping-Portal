create view Delivery_Guy as 
(select Delivery.Order_ID, Delivery.Employee_ID, Customer.House_number as Customer_House_No, Customer.Locality as Customer_Locality, 
Customer.City as Customer_City, Customer.pincode as Customer_PinCode, Warehouse.Plot_number as Warehouse_Address,
 Warehouse.City as Warehouse_City, Warehouse.pincode as Warehouse_PinCode from Delivery, Customer, Warehouse where 
 (Customer.customer_ID = Delivery.Customer_ID and Delivery.Warehouse_ID = Warehouse.Warehouse_ID));

-- Views for customer : cart, complaint, order

-- Customer_order:
-- product, order_product, order, transaction, 
-- products they bought, name, order_id
--, delivery address, transaction date/time, transaction_status, 
-- cost of product, 


create view Customer_Order as
(select Product.Product_name as Product_Name, order_products.quantity as Quantity, 
from Order, order_products, Transaction, Product

where Customer_ID);

create view Customer_Complaint as

create view Customer_Cart as

create view Customer_account as 

create view Suppliers as 
(select product,quantity from Supplies where Vendor_ID);

create view Service_Emp as
(select );

create view Warehouse_Worker as 
(select 
 from order_products, 
 where ):
