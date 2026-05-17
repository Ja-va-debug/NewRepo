use DBTask
go
Alter table Employee
add  PRIMARY KEY(empID)
Alter table Orders
add  PRIMARY KEY(orderID)
Alter table Customer
add  PRIMARY KEY(customerID)
Alter table Item
add  PRIMARY KEY(itemID)
Alter table Supplier
add  PRIMARY KEY(supplierID)
Alter table Item
add constraint fk_employee foreign key(empID) references Employee(empID)
Alter table Orders
add constraint fk_emp foreign key(empID) references Employee(empID)
Alter table Orders
add constraint fk_customer foreign key(customerID) references Customer(customerID)
alter table Supply
add primary key(supplierID, itemID)
alter table Contain
add primary key(orderID, itemID)
Alter table Supply
add foreign key(itemID) references Item(itemID)
Alter table Supply
add foreign key(supplierID) references Supplier(supplierID)
Alter table Contain
add foreign key(itemID) references Item(itemID)
Alter table Contain
add foreign key(orderID) references Orders(orderID)


Create table Category
(
    categoryID int identity(1,1) primary key,
    name varchar(50) not null
)

alter table Item 
add categoryID int not null
alter table Item 
add foreign key (categoryID) references Category(categoryID)

ALTER TABLE Contain
ADD quantity INT NOT NULL DEFAULT 1;
