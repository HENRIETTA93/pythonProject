drop database if exists kxo131;

create database kxo131;

use kxo131;


create table CustomerDetails(
	CustomerID int primary key not null auto_increment,
	FirstName varchar(20) not null,
	LastName varchar(20) not null,
	Email varchar(20) default null,
	Address varchar(30) default null,
	City varchar(20) default null,
	State varchar(20) default null,
	PhoneNumber varchar(20) not null,
	Birthday date default null,
  FavouriteDish varchar(100) default null
	);

Insert into CustomerDetails(FirstName, LastName, Email, Address, City, State,PhoneNumber, Birthday, FavouriteDish) values
('Colin','Chou','colinC@qq.com','Tas.01 Ring Road','Tasmania',' Tas','1312563251','2001-09-17','Chicken'),
('Jay','Chou','jaychou@gmail.com','Qld.230 Ring Road','Queensland','Qld','13888888888','2002-01-20','Rice'),
('Judy','Wang','judy@gmail.com','999 Qld Road','Queensland','Qld','13178945610','2002-09-19','Pumpkin'),
('Zara','Jack','1245@gmail.com','Tas.01 Ring Road','Tasmania',' Tas','180123456789','2001-01-11','Chicken');
Insert into CustomerDetails values
(618247,'Xuanfeng','Shen','xshen11@utas.edu.au','Tas.01 Ring Road','Tasmania',' Tas','13741258963','2001-11-19','Bread');
Insert into CustomerDetails values
(5,'Feng','Li','618248@gmail.com','Tas.01 Ring Road','Tasmania',' Tas','13741258965','2002-03-12','Spicy Food');
Insert into CustomerDetails values
(6,'alin','Li','654393@gmail.com','Tas.01 Ring Road','Tasmania',' Tas','13741258965','2002-03-22','Spicy Food');



create table Dishes(
	DishID int primary key not null auto_increment,
	Name varchar(15) default null,
	Description varchar(50) default null,
	Price int default null
	);

Insert into Dishes(DishID, Name, Description, Price) values
(1,'Chicken','Chicken',29),
(2,'Rice','Rice',15),
(3,'Pumpkin','Pumpkin',18),
(4,'Bread','Bread',12),
(5,'Spicy Food','Spicy Food',26);

create table CustomersDishes(
	CustomersDishesID  int primary key not null auto_increment,
	CustomerID int default null,
	DishID int default null,
	foreign key (CustomerID) references CustomerDetails(CustomerID),
	foreign key (DishID) references Dishes(DishID)
	);

Insert into CustomersDishes values
(1,1,2),
(2,1,3),
(3,3,3),
(4,5,1),
(5,618247,1);

create table Events(
	CustomersEventID int primary key not null auto_increment,
	CustomerID int not null,
	EventID int not null,
	foreign key (CustomerID) references CustomerDetails (CustomerID)
	);

Insert into Events values
(1,1,1001),
(2,3,1002),
(3,1,1003),
(4,4,1004),
(5,618247,1005);

create table Orders(
	OrderID int primary key not null auto_increment,
	CustomerID int default null,
	OrderDate date default null,
	foreign key (CustomerID) references CustomerDetails (CustomerID)
	);

Insert into Orders values
(1,1,'2022-03-11'),
(2,3,'2022-01-22'),
(3,1,'2022-03-29'),
(4,4,'2022-04-13'),
(5,618247,'2022-03-12');

create table OrdersDish(
	OrdersDishesID int primary key not null auto_increment,
	OrderID int default null,
	DishID int default null,
	foreign key (DishID) references DISHES (DishID),
	foreign key (OrderID) references ORDERS (OrderID)
	);

Insert into OrdersDish values
(1,1,1),
(2,2,2),
(3,2,4),
(4,4,3),
(5,4,5);

create table Reservations(
	ReservationID int primary key not null auto_increment,
	CustomerID int default null,
	Date date default null,
	PartySize varchar(15) not null,
	foreign key (CustomerID) references CustomerDetails (CustomerID)
	);

Insert into Reservations values
(1,2,'2022-02-25','4 persons'),
(2,3,'2022-04-17','6 persons'),
(3,4,'2022-05-17','2 persons'),
(4,5,'2022-06-01','4 persons'),
(5,618247,'2022-03-22','4 persons');

