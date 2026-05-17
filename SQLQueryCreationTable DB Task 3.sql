use DBTask
GO

insert into Supplier values 
('cairo','btech'),
('giza','amazon'),
('mansoura','meta'),
('cairo','2b'),
('giza','nividia'),
('alexandria','cisco'),
('cairo','ibm')

insert into Customer values
('mansoura','jana'),
('cairo','elsaied'),
('aswan','mohammed'),
('alexandria','logy'),
('mansoura','dalia'),
('cairo','mohammed'),
('cairo','samir')

insert into Employee values
('omar'),
('amira'),
('tarek'),
('salma'),
('laila'),
('mahmoud'),
('hassan')

insert into Category values
('mobile devices'),
('electronics'),
('home appliances'),
('computers'),
('accessories')

insert into Item values
('laptop', 15000.00, 1,4),
('smartphone', 8000.00, 3,1),
('mouse', 250.00, 4,5),
('fan', 1200.00, 6,3),
('tv screen', 62000.00, 1, 2),
('tablet', 5500.00, 2, 1), 
('Headphones', 600.00,3, 5)

insert into Orders values
('2026-04-15', 5, 1),
('2026-04-10', 4, 2),
('2026-04-20', 1, 3),
('2026-03-20', 7, 5),
('2026-01-15', 6, 7),
('2026-04-18', 4, 4),
('2026-04-19', 2, 3)

insert into Supply  values
(1,1),
(2,1),
(3,2),
(4,3),
(5,1),
(6,2),
(7,3)

insert into Contain values
(1,1,1),
(3,1,2),
(2,2,1),
(7,3,3),
(6,4,1),
(5,5,1),
(4,6,2),
(1,7,1);

