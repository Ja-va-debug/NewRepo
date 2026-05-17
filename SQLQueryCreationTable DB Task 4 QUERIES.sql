exec sp_rename itemOrderSupply, itemSupplierSupply
exec sp_rename Contain,itemOrderContain

use DBTask
go

select * from Employee
select * from Orders
select * from Item
select * from Supplier
select * from itemSupplierSupply

insert into Orders values
('2026-05-01', 1, 2), 
('2026-05-02', 3, 1),   
('2026-05-03', 1, 3),   
('2026-05-04', 2, 4), 
('2026-05-05', 5, 1)  

insert into itemOrderContain values
(1, 8,  1),  
(2, 9,  1),  
(3, 10, 2),  
(5, 11, 1),  
(4, 12, 1) 

-- 1-Display the name of Employees who sold Orders which its total price >33500
select e.name
from Employee e
join Orders o on e.empID = o.empID
join itemOrderContain oi on o.orderID = oi.orderID
join Item i on oi.itemID = i.itemID
group by e.name, o.orderID
having sum(i.Price * oi.quantity) > 33500;

-- 2-How many Items that are sold last month and its price >500 
select sum(io.quantity) as itemCount
from Item i 
join itemOrderContain io on i.itemID = io.itemID
join Orders o on o.orderID = io.orderID
where i.price> 500 and month(o.date) = month(dateadd(month, -1, getdate())) and year(o.date) = YEAR(dateadd(month, -1, getdate()))

-- 3-Display the name of Items that are supplied from the suppliers whose address is Cairo.
select i.name from Item i
join itemSupplierSupply iss on i.itemID = iss.itemID
join Supplier s on s.supplierID = iss.supplierID
where s.address in ('cairo', 'mansoura')

-- 4-Show the name of Customer s who does not bought more than three last week
select c.name from Customer c 
join Orders o on c.customerID = o.customerID
where o.date >= dateadd(week,-1,getdate())
group by c.customerID, c.name
having count(o.orderID) <=3

-- 5-Perform a report that display the name and address of the Customers who sold Items before 3 months.
select c.name, c.address from Customer c
join Orders o on c.customerID=O.customerID
where o.date< DATEADD(month, -3,GETDATE())

-- 6- Perform a report that display the ITEMS which its price is less than 300 Pound
select * from Item where price < 300

-- 7-for each Customer, display how many Orders are bought
select c.name, count(orderID) as OrderCount from Customer c
left join Orders o on o.customerID=c.customerID
group by c.customerID, c.name

-- 8-Perform a report that displays the name of Customers that bought orders last weeks
select c.name from Customer c 
join Orders o on c.customerID = o.customerID
where o.date >= dateadd(week,-1,getdate())
group by c.customerID, c.name

-- 9-Display the total number of the Items for each supplier. 
select s.name, count(iss.itemID)as suppliedCount from Supplier s
left join itemSupplierSupply iss on iss.supplierID = s.supplierID
group by s.supplierID, s.name

-- 10. Display the total number of the Items For each category  that are sold last month
select c.name, count(i.itemID) as itemCount from Category c
left join Item i on i.categoryID = c.categoryID
left join itemOrderContain io on i.itemID=io.itemID
left join Orders o on o.orderID=io.orderID
where month(o.date) = month(dateadd(month, -1, getdate())) and year(o.date) = year(dateadd(month, -1, getdate()))
group by c.categoryID,c.name