#script for creating database and tables

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
                    email_address varchar(50) not null,
                    password varchar(20) not null
                    );
                
create table Product(Product_ID numeric(10) primary key,
                    Price numeric(20) Not null,
                    Photos varchar(20) null,
                    Category varchar(9),
                    Rating varchar(10),
                    Discount_Percentage numeric(5,2), 
                    GST varchar(13)
                    );
create table Vendor(Vendor_id numeric(10,0) primary key,
                    first_name varchar(20) not null,
                    last_name varchar(20) not null, 
                    Plot_number numeric(10,0),
                    City varchar(20),
                    State varchar(20),
                    pincode numeric(10,0));
create table Warehouse(Warehouse_ID numeric(10,0) primary key,
                    Plot_number numeric(10,0),
                    City varchar(20),
                    State varchar(20),
                    pincode numeric(10,0));
create table Employee(Employee_ID numeric(10) primary key,
                    age int(4) not null ,
                    First_Name varchar(20) not null,
                    Last_Name varchar(20), 
                    Salary numeric(20) not null, 
                    Gender varchar(4), 
                    Department varchar(10),
                    Performance varchar(10), 
                    Position varchar(10) not null,
                    Date_of_joining date not null, 
                    Email_address varchar(50) not null,
                    House_No numeric(10,0),
                    Locality varchar(30),
                    City varchar(15),
                    State varchar(20),
                    Pincode numeric(6,0)
                );


create table orders(
    order_ID numeric(10,0) primary key, 
    Total_Price numeric(10,2),
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
    foreign key (Warehouse_ID) references Warehouse(Warehouse_ID));


create table Service_Employee(
    Employee_ID numeric(10,0) primary key,
    foreign key (Employee_ID) references Employee(Employee_ID)
);


create table Transaction(
    Order_ID numeric(10,0) primary key, 
    Payment_Method varchar(20), 
    Transaction Status boolean, 
    date_and_time Timestamp, 
    Customer_ID numeric(10,0), 
    Coupon_Code varchar(10),

    foreign key (Customer_ID) REFERENCES Customer(Customer_ID)
    foreign key (Coupon_Code) REFERENCES Coupon(Customer_ID)
    
);


create table Delivery(Order_ID primary key,Employee_ID, Customer_ID, Warehouse_ID);




create table Stores(
	Warehouse_ID numeric(10,0),
    Product_ID numeric(10,0),
    Stocks numeric(10,0),
    primary key (Vendor_ID, Product_ID),
    foreign key (Vendor_ID) references Vendor,
    foreign key (Product_ID) references Product
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
    Product_ID numeric(10),
    primary key (customer_ID, Product_ID),
    foreign key (customer_ID) references Customer(Customer_ID),
    foreign key (Product_ID) references Product(Product_ID),
    Quantity numeric(4,0)
);