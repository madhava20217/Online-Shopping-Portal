#script for creating database and tables

-- tables created:
-- 1) Customer
-- 2) Customer Phone
-- 3) Product
-- 4) Product_rating
-- 5) Product_photos
-- 6) Vendor
-- 7) Vendor_Phone
-- 8) Warehouse
-- 9) Warehouse_Phone
-- 10) Employee
-- 11) Orders
-- 12) Delivery Partner
-- 13) Coupon
-- 14) Warehouse_Worker
-- 15) Service_employee
-- 16) Transaction
-- 17) Delivery
-- 18) Stores
-- 19) Supplies
-- 20) Shopping_cart
-- 21) Complains
-- 22) Order_products

 

drop database online_shopping;
create DATABASE online_shopping;

use online_shopping;

create table Customer(customer_ID numeric(10,0) primary key,
                    First_name varchar(20) not null,
                    Last_name varchar(20) not null,
                    House_number numeric(10,0),
                    Locality varchar(30),
                    City varchar(20),
                    State varchar(20),
                    Pin_code numeric(6,0),
                    email_address varchar(50) unique not null,
                    password varchar(20) not null
                    );
create table Customer_phone(Customer_ID numeric(10,0),
                            Phone_number numeric(10,0) not null,
                            foreign key (Customer_id) references Customer(customer_id),
                            primary key(Phone_number,Customer_id)
                            );
create table Product(Product_ID numeric(10) primary key,
                    Price numeric(14, 2),
                    Category varchar(15),
                    Discount_Percentage numeric(5,2), 
                    GST_percentage numeric(4, 2)
                    );

create table product_rating(
                    Product_ID numeric(10,0),
                    Rating numeric(1,0),
                    foreign key (product_id) references product(product_id),
                    primary key (product_id, rating)
);

create table product_photo(
                    Product_ID numeric(10,0),
                    Photos_url varchar(100),
                    foreign key (product_id) references product(product_id),
                    primary key (product_id, Photos_url)
);


create table Vendor(Vendor_id numeric(10,0) primary key,
                    first_name varchar(20) not null,
                    last_name varchar(20) not null, 
                    Plot_number numeric(10,0),
                    City varchar(20),
                    State varchar(20),
                    pincode numeric(6,0));
create table Vendor_phone(Vendor_ID numeric(10,0),
                            Phone_number numeric(10,0) not null,
                            foreign key (Vendor_ID) references Vendor(Vendor_ID),
                            primary key(Phone_number,Vendor_ID)
                        );
create table Warehouse(Warehouse_ID numeric(10,0) primary key,
                    Plot_number numeric(10,0),
                    City varchar(20),
                    State varchar(20),
                    pincode numeric(6,0)
                );

create table Warehouse_phone(Warehouse_ID numeric(10,0),
                            Phone_number numeric(10,0) not null,
                            foreign key (Warehouse_ID) references Warehouse(Warehouse_ID),
                            primary key(Phone_number,Warehouse_ID)
                        );
                

create table Employee(Employee_ID numeric(10,0) primary key,
                    age int(4) not null ,
                    First_Name varchar(20) not null,
                    Last_Name varchar(20), 
                    Salary numeric(20) not null, 
                    Gender varchar(4), 
                    Department varchar(10),
                    Performance varchar(10), 
                    Position varchar(10) not null,
                    Date_of_joining date not null, 
                    Email_address varchar(50) unique not null,
                    House_No numeric(10,0),
                    Locality varchar(30),
                    City varchar(20),
                    State varchar(20),
                    Pincode numeric(6,0)
                );


create table orders(
    order_ID numeric(10,0) primary key, 
    Total_Price numeric(14,2),
    Taxes numeric(10,2),
    Discount_Percentage numeric(5,2)
    );

create table Delivery_Partner(
    Employee_ID numeric(10,0) primary key, 
    Vehicle_ID varchar(10), 
    Vehicle_Type varchar(10),
    foreign key (Employee_id) references Employee(employee_id)
    );

create table Coupon(
    Coupon_Code varchar(10) primary key, 
    Discount_Percentage numeric(5,2)
    );



create table Warehouse_Worker(
    Employee_ID numeric(10,0) primary key,
    Warehouse_ID numeric(10,0),
    foreign key (Employee_ID) references Employee(Employee_ID),
    foreign key (Warehouse_ID) references Warehouse(Warehouse_ID)
    );


create table Service_Employee(
    Employee_ID numeric(10,0) primary key,
    foreign key (Employee_ID) references Employee(Employee_ID)
);


create table Transaction(
    Order_ID numeric(10,0) primary key, 
    Payment_Method varchar(20), 
    Transaction_Status boolean, 
    transaction_time Timestamp, 
    Customer_ID numeric(10,0), 
    Coupon_Code varchar(10),

    foreign key (Customer_ID) REFERENCES Customer(Customer_ID),
    foreign key (Coupon_Code) REFERENCES Coupon(Coupon_Code)
    
);


create table Delivery(
    Order_ID numeric(10,0) primary key,
    Employee_ID numeric(10,0), 
    Customer_ID numeric(10,0), 
    Warehouse_ID numeric(10,0),

    FOREIGN KEY (Order_ID) REFERENCES orders(Order_ID),
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Warehouse_ID) REFERENCES Warehouse(Warehouse_ID)
);




create table Stores(
	Warehouse_ID numeric(10,0),
    Product_ID numeric(10,0),
    Stocks numeric(10,0),

    primary key (Warehouse_ID, Product_ID),
    foreign key (Warehouse_ID) references Warehouse(Warehouse_ID),
    foreign key (Product_ID) references Product(Product_ID)
);



create table Supplies(
	Vendor_ID numeric(10,0),
    Product_ID numeric(10,0),

    primary key (Vendor_ID, Product_ID),
    foreign key (Vendor_ID) references Vendor(Vendor_ID),
    foreign key (Product_ID) references Product(Product_ID)
);


create table Shopping_Cart(
	customer_ID numeric(10,0),
    Product_ID numeric(10, 0),
    quantity numeric(3,0),

    primary key (customer_ID, Product_ID),
    foreign key (customer_ID) references Customer(Customer_ID),
    foreign key (Product_ID) references Product(Product_ID)
);

create table complains(
    complaint_number numeric(10,0) primary key,
    customer_ID numeric(10, 0),
    order_id numeric(10,0),
    service_employee_id numeric(10,0), 
    foreign key (customer_id) references Customer(customer_ID),
    foreign key (order_id) references orders(Order_ID),
    foreign key (service_employee_id) references Service_Employee(Employee_ID)
    );

create table order_products(
    order_id numeric(10,0),
    product_id numeric(10,0),

    foreign key (order_id) references Orders(order_id),
    foreign key (product_id) references Product(product_id),

    primary key (order_id, product_id)
);

