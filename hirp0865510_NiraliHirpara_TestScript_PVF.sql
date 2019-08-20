create database hirp0865510;
show databases;
use hirp0865510;


CREATE TABLE CUSTOMER(Customer_Id INT(2) PRIMARY KEY NOT NULL,name VARCHAR(20),email VARCHAR(30),gender CHAR(1),contact_number int(12));
describe CUSTOMER;
CREATE TABLE ZIP_CODE(Zip_Id INT(2) PRIMARY KEY NOT NULL,area VARCHAR(20),city VARCHAR(10),province VARCHAR(10),country VARCHAR(15));
describe ZIP_CODE;
CREATE TABLE ADDRESS(Address_Id INT(2) PRIMARY KEY NOT NULL,street_number int(10),street_name VARCHAR(30),city VARCHAR(10),province VARCHAR(12),country VARCHAR(10),Zip_Id int(2),FOREIGN KEY(zip_id)references ZIP_CODE(zip_id),Customer_Id int(2),FOREIGN KEY(Customer_Id) references CUSTOMER(Customer_Id));
describe ADDRESS;
CREATE TABLE PAYMENT(Payment_Id INT(2) PRIMARY KEY NOT NULL,payment_method VARCHAR(10),amount INT(5),Customer_Id int(2),FOREIGN KEY(Customer_Id) references CUSTOMER(Customer_Id));
describe PAYMENT;
CREATE TABLE SHIPMENT(Shipment_Id INT(2) PRIMARY KEY NOT NULL,Address_Id int(2),FOREIGN KEY(Address_Id) references ADDRESS(Address_Id),Customer_Id int(2),FOREIGN KEY(Customer_Id) references CUSTOMER(Customer_Id));
describe SHIPMENT;
CREATE TABLE SUPPLIER(Supplier_Id INT(2) PRIMARY KEY NOT NULL,name VARCHAR(15),contact_details VARCHAR(20));
describe SUPPLIER;
CREATE TABLE PRODUCT(Product_Id INT(2) PRIMARY KEY NOT NULL,name VARCHAR(10),amount int(5),Supplier_Id int(2),FOREIGN KEY(Supplier_Id) references SUPPLIER(Supplier_Id));
describe PRODUCT;
CREATE TABLE CATEGORY(Category_Id INT(2) PRIMARY KEY NOT NULL,Product_Id int(2),FOREIGN KEY(Product_Id) references PRODUCT(Product_Id),type VARCHAR(20),amount INT(4));
describe CATEGORY;
CREATE TABLE ORDERS(Order_Id INT(2),Product_Id int(2),FOREIGN KEY(Product_Id) references PRODUCT(Product_Id),Customer_Id int(2),FOREIGN KEY(Customer_Id) references CUSTOMER(Customer_Id),order_amount INT(4),quantity int(3),order_date DateTime);
describe ORDERS;

insert into CUSTOMER (Customer_Id,name,email, gender, contact_number)
values(1,'Nirali', 'nirali_hir@gmail.com', 'F', 0001112222);
insert into CUSTOMER (Customer_Id,name,email, gender, contact_number)
values(2,'Shruti', 'shruti_shah@yahoo.com', 'F', 1112223333);
insert into CUSTOMER (Customer_Id,name,email, gender, contact_number)
values(3,'Shivam', 'shivam_patel@gmail.com', 'M', 0009991111);
insert into CUSTOMER (Customer_Id,name,email, gender, contact_number)
values(4,'Reyansh', 'reyansh_patel@yahoo.com', 'M', 1110001111);
select * from CUSTOMER;

insert into ZIP_CODE (Zip_Id,area, city, province, country)
values(11,'Dundas', 'London', 'Ontario','Canada');
insert into ZIP_CODE (Zip_Id,area, city, province, country)
values(22,'Richmond','Windsor','Ontario','Canada');
insert into ZIP_CODE (Zip_Id,area, city, province, country)
values(33,'Wonderland','Kitchener','Ontario','Canada');
insert into ZIP_CODE (Zip_Id,area, city, province, country)
values(44,'Wellington','Montreal','Quebec','Canada');
select * from ZIP_CODE;

insert into ADDRESS(Address_Id,street_number,street_name,city,province,country,Zip_Id,Customer_Id)
values(1,700,'King Street','London', 'Ontario','Canada','11',1);
insert into ADDRESS(Address_Id,street_number,street_name,city,province,country,Zip_Id,Customer_Id)
values(2,850,'Richmond Street','Windsor','Ontario','Canada','22',2);
insert into ADDRESS(Address_Id,street_number,street_name,city,province,country,Zip_Id,Customer_Id)
values(3,3456,'East of Wonderland','Kitchener','Ontario','Canada','33',3);
insert into ADDRESS(Address_Id,street_number,street_name,city,province,country,Zip_Id,Customer_Id)
values(4,7000,'North of Wellington','Montreal','Quebec','Canada','44',4);
select * from ADDRESS;

insert into PAYMENT(Payment_Id,payment_method,amount,Customer_Id)
values(10,'COD',30000,1);
insert into PAYMENT(Payment_Id,payment_method,amount,Customer_Id)
values(20,'Credit',2500,2);
insert into PAYMENT(Payment_Id,payment_method,amount,Customer_Id)
values(30,'Debit',85005,3);
insert into PAYMENT(Payment_Id,payment_method,amount,Customer_Id)
values(40,'Credit',99032,4);
select * from PAYMENT;

insert into SHIPMENT(Shipment_Id,Address_Id,Customer_Id)
values(1,1,1);
insert into SHIPMENT(Shipment_Id,Address_Id,Customer_Id)
values(2,2,2);
insert into SHIPMENT(Shipment_Id,Address_Id,Customer_Id)
values(3,3,3);
insert into SHIPMENT(Shipment_Id,Address_Id,Customer_Id)
values(4,4,4);
select * from SHIPMENT;

insert into SUPPLIER(Supplier_Id,name,contact_details)
values(51,'ZeoClay','zeoclay@gmail.com');
insert into SUPPLIER(Supplier_Id,name,contact_details)
values(52,'Surya','surya@gmail.com');
insert into SUPPLIER(Supplier_Id,name,contact_details)
values(53,'Minechem','minechem@gmail.com');
insert into SUPPLIER(Supplier_Id,name,contact_details)
values(54,'KGKScience','kgk.sci@gmail.com');
select * from SUPPLIER;


insert into PRODUCT(Product_Id,name,amount,Supplier_Id)
values(91,'Sofa',200,51);
insert into PRODUCT(Product_Id,name,amount,Supplier_Id)
values(92,'Single Bed',500,52);
insert into PRODUCT(Product_Id,name,amount,Supplier_Id)
values(93,'Mirror',50,53);
insert into PRODUCT(Product_Id,name,amount,Supplier_Id)
values(94,'King Bed',850,54);

insert into CATEGORY(Category_Id,Product_Id,type,amount)
values(61,91,'Living Room',1000);
insert into CATEGORY(Category_Id,Product_Id,type,amount)
values(62,92,'Bed',2000);
insert into CATEGORY(Category_Id,Product_Id,type,amount)
values(63,93,'Accessories',3000);
insert into CATEGORY(Category_Id,Product_Id,type,amount)
values(64,94,'Bed',4000);
select * from CATEGORY;

insert into ORDERS(Order_Id,Product_Id,Customer_Id,order_amount,quantity,order_date)
values(01,91,1,2300,2,'2018-04-15');
insert into ORDERS(Order_Id,Product_Id,Customer_Id,order_amount,quantity,order_date)
values(02,92,2,500,1,'2018-02-20');
insert into ORDERS(Order_Id,Product_Id,Customer_Id,order_amount,quantity,order_date)
values(03,93,3,100,4,'2018-01-31');
insert into ORDERS(Order_Id,Product_Id,Customer_Id,order_amount,quantity,order_date)
values(04,94,4,3000,1,'2018-03-07');
select * from ORDERS;

show columns from ADDRESS;
select * from CATEGORY where amount > 2000;
select * from PRODUCT where name = 'Mirror';
select * from CUSTOMER where gender = 'F' AND contact_number = '0001112222';
SELECT * FROM CATEGORY WHERE Product_Id != '91' AND type = 'Bed' order by amount;
SELECT * FROM CATEGORY WHERE type like "B%" AND Category_Id < '65';
SELECT * FROM SUPPLIER WHERE name RLIKE "^S";
select DISTINCT type from CATEGORY;
SELECT Customer_Id,Zip_Id,province FROM Address ORDER BY Zip_Id DESC;
SELECT COUNT(*) FROM Customer;
describe ORDERS;
SELECT * FROM ORDERS;
alter table ORDERS change quantity quantity_ordered int(3);
describe ORDERS;
SELECT * FROM ORDERS;
UPDATE ORDERS SET Order_Id = '05' where order_amount = 30000;
select * from ORDERS;





