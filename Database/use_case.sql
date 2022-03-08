use online_shopping;

insert into Customer (Customer_ID, first_name, last_name, House_number, Locality, City, Pincode, email_address, password) values (102, 'Shurlock', 'Sadgrove', '3978', 'Eastlawn', 'Na Muen', 872979, 'ssadgrove0@siteme3ter.com', 'LJc5AVRCdR');

select * from product;

insert into shopping_cart values (102, 1, 1);
insert into shopping_cart values (102, 7, 1);

insert into orders values (105, 500, 50, 0);

insert into transaction values (105, 'bank', true, "2021:8:13 21:30:53", 102, null);

insert into order_products values(105, 1, 1);
insert into order_products values(105, 7, 1);

delete from shopping_cart where customer_id = 102;
select * from customer where customer_id = 102;
select * from shopping_cart where customer_ID = 102;

