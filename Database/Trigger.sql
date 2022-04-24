DELIMITER $

--Working
create trigger passwd before insert on Employee
    for each row
    if new.password is NULL THEN
        set new.password = MD5(new.email_address);
    end if$
delimiter ;

--Working
DELIMITER $

create trigger update_cart after update on Stores
    for each row
    if new.stocks = 0 THEN
        delete from Shopping_cart where Shopping_cart.product_id = new.product_id;
    end if$
delimiter ;

--Working
DELIMITER $
create trigger scalp_customers after update on Stores
    for each row
        if new.stocks < 100 then
            update Product set Product.Total_Discount_Percentage = Product.Total_Discount_Percentage/2;
        end if$ 
delimiter ;

--Working
DELIMITER $
create trigger add_stock_warehouse after insert on Product
    for each row
        insert into Stores values (
            FLOOR(RAND()*(select max(warehouse_id) - min(warehouse_id) from warehouse)), new.product_id, 0);
delimiter ;


