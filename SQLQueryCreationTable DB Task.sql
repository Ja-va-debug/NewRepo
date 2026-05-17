USE master
GO

CREATE DATABASE DBTask

USE DBTask
GO
create table Item
(itemID int NOT NULL identity(1,1), 
name varchar(30) not null,
price decimal(10,4) not null,
empID int not null
)

create table Supplier
(
supplierID int NOT NULL identity(1,1),
address varchar(50) not null,
name varchar(10) not null
)

alter table Item
alter column name varchar(10)

create table Customer
(
customerID int NOT NULL identity(1,1),
address varchar(60) null,
name varchar(10) not null
)

create table Employee
(
empID int NOT NULL identity(1,1),
name varchar(10) not null
)

create table Orders
(
orderID int NOT NULL identity(1,1),
date date not null,
customerID int not null,
empID int not null 

)

CREATE TABLE Supply (
    itemID INT,
    supplierID INT,
)

CREATE TABLE Contain (
    itemID INT,
    orderID INT,
)

alter table supply
alter column itemID int not null 
alter table supply
alter column supplierID int not null

alter table contain
alter column itemID int not null 
alter table contain
alter column orderID int not null


