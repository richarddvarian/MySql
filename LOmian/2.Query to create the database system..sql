create database LOmian
use LOmian


create table Employee(
EmployeeID char(5) PRIMARY KEY CHECK (EmployeeID LIKE'EM[0-9][0-9][0-9]'),
EmployeeName varchar(255) check (len(EmployeeName) between 15 and 30),
EmployeeAddress varchar (255),
EmployeeGender varchar (255) check (EmployeeGender in ('Male','Female'))
)
select * from Employee


create table Supplier(
SupplierID char(5) PRIMARY KEY CHECK (SupplierID LIKE'SU[0-9][0-9][0-9]'),
SupplierName varchar (255),
SupplierAddress varchar (255),
SupplierGender varchar (255) check (SupplierGender in ('Male','Female'))
)
select * from Supplier


create table Customer(
CustomerID char(5) PRIMARY KEY CHECK (CustomerID LIKE'CU[0-9][0-9][0-9]'),
CustomerName varchar (255),
CustomerAddress varchar (255),
CustomerGender varchar (255) check (Customergender in ('Male','Female'))
)
select * from Customer


Create table Noodletype(
NoodleTypeID CHAR(5) PRIMARY KEY CHECK (NoodleTypeID LIKE'NT[0-9][0-9][0-9]'),
NoodleTypeName varchar(225)
)
select * from Noodletype


create table Noodle(
NoodleID char(5) PRIMARY KEY CHECK (NoodleID LIKE'NO[0-9][0-9][0-9]'),
NoodleTypeID CHAR(5) FOREIGN KEY REFERENCES Noodletype(NoodleTypeID),
NoodleName varchar (255) check (NoodleName like '% noodle'),
Price int check(Price >=15000),
)
select * from Noodle


create table Ingredient(
IngredientPurchasedID char(5) PRIMARY KEY CHECK (IngredientPurchasedID LIKE'IN[0-9][0-9][0-9]'),
IngredientName varchar (255),
IngredientPrice int check(IngredientPrice > 0)
)
select * from Ingredient

create table PurchaseTransactionHeader (
PurchaseTransactionID char(5) PRIMARY KEY CHECK (PurchaseTransactionID LIKE'PU[0-9][0-9][0-9]'),
EmployeeID CHAR(5) FOREIGN KEY REFERENCES Employee(EmployeeID) ,
SupplierID CHAR(5) FOREIGN KEY REFERENCES Supplier(SupplierID) ,
PurchaseTransactionDate date
)
select * from PurchaseTransactionHeader


create table PurchaseTransactionDetail (
PurchaseTransactionID char(5) FOREIGN KEY REFERENCES PurchaseTransactionHeader(PurchaseTransactionID),
IngredientPurchasedID CHAR(5) FOREIGN KEY REFERENCES Ingredient(IngredientPurchasedID) ,
QtyIngredient int
)
select * from PurchaseTransactionDetail


create table SalesTransactionHeader(
SalesTransactionID char(5) PRIMARY KEY CHECK (SalesTransactionID LIKE'TR[0-9][0-9][0-9]'),
EmployeeID CHAR(5) FOREIGN KEY REFERENCES Employee(EmployeeID),
CustomerID CHAR(5) FOREIGN KEY REFERENCES Customer(CustomerID),
SalesTransactionDate date
)
select * from SalesTransactionHeader


create table SalesTransactionDetail(
SalesTransactionID CHAR(5) FOREIGN KEY REFERENCES SalesTransactionHeader(SalesTransactionID),
NoodleID CHAR(5) FOREIGN KEY REFERENCES Noodle(NoodleID),
NoodleSold int,
QtyNoodlePurchased int
)
select * from SalesTransactionDetail

drop table Employee
drop table Customer
drop table Supplier
drop table Noodletype
drop table Noodle
drop table Ingredients
drop table PurchaseTransactionHeader
drop table PurchaseTransactionDetail
drop table SalesTransactionHeader
drop table SalesTransactionDetail

drop database LOmian