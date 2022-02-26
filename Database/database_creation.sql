#script for creating database and tables

-- tables created:
-- 1) Customer          -done
-- 2) Customer Phone    -done
-- 3) Product           -done
-- 4) Product_rating    -
-- 5) Product_photos    -
-- 6) Vendor            -done
-- 7) Vendor_Phone      -done
-- 8) Warehouse         -done
-- 9) Warehouse_Phone   -done
-- 10) Employee         -done
-- 11) Orders           -done
-- 12) Delivery Partner -done
-- 13) Coupon           -done
-- 14) Warehouse_Worker -done
-- 15) Service_employee -done
-- 16) Transaction      -done
-- 17) Delivery         -done
-- 18) Stores           -
-- 19) Supplies         -
-- 20) Shopping_cart    -
-- 21) Complains        -done
-- 22) Order_products   -

 

drop database online_shopping;
create DATABASE online_shopping;

use online_shopping;

-- #done
create table Customer(
                    customer_ID numeric(30,0) primary key,
                    First_name varchar(30) not null,
                    Last_name varchar(30) not null,
                    House_number numeric(30,0) check(House_number >= 0),
                    Locality varchar(30),
                    City varchar(30),
                    pincode numeric(6,0) check(pincode >= 0),
                    email_address varchar(50) unique not null,
                    password varchar(30) not null
                    );
create table Customer_phone(Customer_ID numeric(30,0),
                            Phone_number numeric(30,0) not null,
                            foreign key (Customer_id) references Customer(customer_id),
                            primary key(Phone_number,Customer_id)
                            );

-- done
create table Product(Product_ID numeric(30) primary key,
                    Price numeric(15, 2) check(Price > 0),
                    Category varchar(50),
                    Discount_Percentage numeric(5,2) check(Discount_Percentage >= 0), 
                    GST_percentage numeric(10, 2)
                    );

create table product_rating(
                    Product_ID numeric(30,0),
                    Rating numeric(1,0) check (Rating > 0),
                    foreign key (product_id) references product(product_id),
                    primary key (product_id, rating)
                    );

create table product_photo(
                    Product_ID numeric(30,0),
                    Photos_url varchar(300),
                    foreign key (product_id) references product(product_id),
                    primary key (product_id, Photos_url)
                    );


-- #done
create table Vendor(Vendor_id numeric(30,0) primary key,
                    first_name varchar(30) not null,
                    last_name varchar(30) not null, 
                    Plot_number numeric(30,0) check (plot_number >= 0),
                    City varchar(30),
                    pincode numeric(6,0) check (pincode >= 0)
                    );
create table Vendor_phone(Vendor_ID numeric(30,0),
                            Phone_number numeric(30,0) not null,
                            foreign key (Vendor_ID) references Vendor(Vendor_ID),
                            primary key(Phone_number,Vendor_ID)
                        );

-- #done
create table Warehouse(Warehouse_ID numeric(30,0) primary key,
                    Plot_number numeric(30,0) check(plot_number >= 0),
                    City varchar(30),
                    pincode numeric(6,0) check(pincode >= 0)
                );

create table Warehouse_phone(Warehouse_ID numeric(30,0),
                            Phone_number numeric(30,0) not null,
                            foreign key (Warehouse_ID) references Warehouse(Warehouse_ID),
                            primary key(Phone_number,Warehouse_ID)
                        );

-- done
create table Employee(Employee_ID numeric(30,0) primary key,
                    age int(10) not null check(age between 18 and 300),
                    First_Name varchar(30) not null,
                    Last_Name varchar(30), 
                    Salary numeric(30) not null, 
                    Gender varchar(20), 
                    Department varchar(30),
                    Performance varchar(30), 
                    Position varchar(30) not null,
                    Date_of_joining char(30) not null, 
                    Date_of_birth char(30) not null,
                    Email_address varchar(50) unique not null,
                    House_No numeric(30,0),
                    Locality varchar(30),
                    City varchar(30),
                    Pincode numeric(6,0) check (Pincode >= 0),
                    Phone_number numeric(30,0)
                );

#done
create table Orders(
    order_ID numeric(30,0) primary key, 
    Total_Price numeric(20,2) check(Total_price > 0),
    Taxes numeric(30,2) check(Taxes >= 0),
    Total_Discount_Percentage numeric(5,2)
    );

-- done
create table Delivery_Partner(
    Employee_ID numeric(30,0) primary key, 
    Vehicle_ID varchar(30), 
    Vehicle_Type varchar(30),
    foreign key (Employee_id) references Employee(employee_id)
    );

-- #done
create table Coupon(
    Coupon_Code varchar(30) primary key, 
    Discount_Percentage numeric(5,2) check (discount_percentage >= 0)
    );



-- #done
create table Warehouse_Worker(
    Employee_ID numeric(30,0) primary key,
    Warehouse_ID numeric(30,0),
    foreign key (Employee_ID) references Employee(Employee_ID),
    foreign key (Warehouse_ID) references Warehouse(Warehouse_ID)
    );


-- done
create table Service_Employee(
    Employee_ID numeric(30,0) primary key,
    foreign key (Employee_ID) references Employee(Employee_ID)
    );

-- done
create table Transaction(
    Order_ID numeric(30,0) primary key, 
    Payment_Method varchar(30), 
    Transaction_Status boolean, 
    transaction_time Timestamp, 
    Customer_ID numeric(30,0), 
    Coupon_Code varchar(30),

    foreign key (Customer_ID) REFERENCES Customer(Customer_ID),
    foreign key (Coupon_Code) REFERENCES Coupon(Coupon_Code)
    
    );


create table Delivery(
    Order_ID numeric(30,0) primary key,
    Employee_ID numeric(30,0), 
    Customer_ID numeric(30,0), 
    Warehouse_ID numeric(30,0),

    FOREIGN KEY (Order_ID) REFERENCES orders(Order_ID),
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Warehouse_ID) REFERENCES Warehouse(Warehouse_ID)
    );




create table Stores(
	Warehouse_ID numeric(30,0),
    Product_ID numeric(30,0),
    Stocks numeric(30,0) check(stocks >= 0),

    primary key (Warehouse_ID, Product_ID),
    foreign key (Warehouse_ID) references Warehouse(Warehouse_ID),
    foreign key (Product_ID) references Product(Product_ID)
    );



create table Supplies(
	Vendor_ID numeric(30,0),
    Product_ID numeric(30,0),
    Quantity int,

    primary key (Vendor_ID, Product_ID),
    foreign key (Vendor_ID) references Vendor(Vendor_ID),
    foreign key (Product_ID) references Product(Product_ID)
    );


create table Shopping_Cart(
	customer_ID numeric(30,0),
    Product_ID numeric(30, 0),
    quantity int,
    primary key (customer_ID, Product_ID),
    foreign key (customer_ID) references Customer(Customer_ID),
    foreign key (Product_ID) references Product(Product_ID)
    );

-- done
create table complains(
    complaint_number numeric(30,0) primary key,
    customer_ID numeric(30, 0),
    order_id numeric(30,0),
    service_employee_id numeric(30,0), 
    foreign key (customer_id) references Customer(customer_ID),
    foreign key (order_id) references orders(Order_ID),
    foreign key (service_employee_id) references Service_Employee(Employee_ID)
    );

create table order_products(
    order_id numeric(30,0),
    product_id numeric(30,0),
    quantity numeric(3,0) check(quantity > 0),

    foreign key (order_id) references Orders(order_id),
    foreign key (product_id) references Product(product_id),

    primary key (order_id, product_id)
);

