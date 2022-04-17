



create trigger update_cart after Update on Stores
for each row
IF NEW.stocks = 0 THEN
begin atomic
delete from Shopping_cart
    where Shopping_cart.product_id = B;
end;


delimiter $$
drop trigger if exists update_cart $$
create trigger update_cart after update on Stores
for each row
IF NEW.Stocks = 0 THEN
        delete from shopping_cart 
        where product_ID = NEW.product_id;
end$$

delimiter ;


    /*  (select T.A from (select sum(Stores.stocks) as A,product_id as B from Stores group by Stores.product_id ) as T) */