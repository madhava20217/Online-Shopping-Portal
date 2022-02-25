#script for creating database and tables

drop database online_shopping;
create DATABASE online_shopping;

use online_shopping;

create table Customer(customer_ID numeric(10,0) primary key,
                    First_name varchar(20) not null,
                    Last_name varchar(20) not null,
                    House_number numeric(10,0),
                    Locality varchar(30),
                    City varchar(15),
                    State varchar(20),
                    Pin_code numeric(6,0),
                    email_address varchar(50) not null,
                    Password varchar(20) not null,
                    );
                
create table Product(Product_ID numeric(10) primary key,
                    Price numeric(20) Not null,
                    Photos varchar(20) null,
                    Category varchar(9),
                    Rating varchar(10),
                    Discount_Percentage varchar(4,0), 
                    GST varchar(13));
create table Vendor(Vendor_id numeric(10,0) primary key,
                    first_name varchar(20) not null,
                    last_name varchar(20) not null, 
                    Plot_number numeric(10,0),
                    City varchar(20),
                    State varchar(20),
                    pincode numeric(10,0));
create table numeric(10) Warehouse();
create table Employee(Employee_ID numeric(10) primary key,
                      age int(4) not null ,
 First_Name varchar(20) not null,
 Last_Name varchar(20), 
 Salary numeric(20) not null, 
 Gender varchar(4), 
 Department varchar(10), Performance varchar(10), Position varchar(10) not null, Date_of_joining date not null, Email_address varchar(50),Residental_address varchar(30),Pincode varchar(6,0) ,);



create table Order(
    Order_ID numeric(10,0) primary key, 
    Total_Price numeric(10,2), 
    Category varchar(20), 
    Discount_Percentage numeric(4,2)
    );


create table Delivery_Partner(
    Employee_ID numeric(10,0) primary key, 
    Vehicle_ID varchar(10), 
    Vehicle_Type varchar(10)
    );


create table Coupon(
    Coupon_Code varchar(10) primary key, 
    Discount_Percentage numeric(4,2)
    );



create table Warehouse_Worker(
    foreign key (Employee_ID) references Employee,
    foreign key Warehouse_ID references Warehouse);


create table Service_Employee(
    foreign key (Employee_ID) references Employee
);


create table Shopping_Cart(
    foreign key (Customer_ID) references Customer,
    foreign key (Product_ID) references Product,
    Quantity numeric(4,0)
);


create table Transaction(Order_ID primary key, Payment Method, Transaction Status, Timestamp, Customer_ID, Coupon_Code)


create table Delivery(Order_ID primary key, Employee_ID, Customer_ID, Warehouse_ID)


create table Supplies([Vendor_ID, Product_ID])


create table Stores([Warehouse_ID, Product_ID], Stocks)
