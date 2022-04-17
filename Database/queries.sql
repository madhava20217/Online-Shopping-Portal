use online_shopping;

commit work;

update Employee set salary = case 
            when (performance > 7) then  salary + 50000  
            when  (3 <performance < 7) then salary + 30000 
            else salary +  10000 
            end;
select customer_id,first_name,last_name 
    from Customer 
    where first_name like "%N%" and house_number between 4000 and 10000 
    order by last_name DESC;

select category,count(*)
    from order_products,Product 
    where order_products.Product_id = Product.Product_id 
    group by category 
    having count(*) > 1;

alter table Vendor add(Vendor_out_of_business boolean default False);

select distinct Employee_ID
        	from Employee 
        	where Salary > some (select Salary from Employee where Department= "Marketing" );

delete from Stores where stocks = 0;

select first_name 
    from Vendor
    where city in (select city from Customer where city not like "%C" )
    union
    select  first_name 
    from Vendor as V inner join Supplies as S on V.vendor_id = S.vendor_id 
    where quantity > 900;



select vendor.Vendor_id, vendor.first_name, vendor.last_name
from vendor
where vendor.Vendor_id in
    (
        select distinct v.vendor_id
        from supplies v, (
            select p.product_id as pid, avg(pr.rating) as rat
            from product p natural join product_rating pr
            group by p.Product_ID) as T
        where v.Product_ID = t.pid and t.rat < 3
        );



create view Delivery_Guy as 
(select Delivery.Order_ID, Delivery.Employee_ID, Customer.House_number as Customer_House_No, Customer.Locality as Customer_Locality, 
Customer.City as Customer_City, Customer.pincode as Customer_PinCode, Warehouse.Plot_number as Warehouse_Address,
 Warehouse.City as Warehouse_City, Warehouse.pincode as Warehouse_PinCode from Delivery, Customer, Warehouse where 
 (Customer.customer_ID = Delivery.Customer_ID and Delivery.Warehouse_ID = Warehouse.Warehouse_ID));


select * from orders where MOD(order_id, 5) = 0;

rollback work;