
drop table if exists  OrderShirts;
drop table if exists  Orders;
drop table if exists  Paypal;
drop table if exists  CreditCard;
drop table if exists  BankAccount;
drop table if exists  PayAccount;
drop table if exists  Customer;
drop table if exists  TShirt;
drop table if exists  Extras;

create table Extras(
    ExtrasID int primary key,
    ExtrasMaterial varchar(50) not null,
    ExtrasFont varchar(50) not null,
    ExtrasColour varchar(20) not null,
    ExtrasText varchar(100) not null
);



create table TShirt(
    TShirtID int primary key,
    Type varchar(30) not null,
    Size char(5) not null,
    SleeveType varchar(30) not null,
    Colour varchar(30) not null,
    Material varchar(50) not null,
    ExtrasID int,
    Price int,
    foreign key (ExtrasID) references Extras(ExtrasID)
);



create table Customer (
    CustomerID int primary key,
    FirstName varchar(20) not null,
    LastName varchar(20) not null,
    PhoneNumber varchar(12) not null,
    Address varchar(50) not null
);



create table PayAccount(
    PayerID varchar(20) primary key,
    CustomerID int,
    foreign key (CustomerID) references Customer(CustomerID)
);



create table CreditCard(
    PayerID varchar(20) primary key,
    CreditNumber varchar(30),
    ExpiryDate date,
    foreign key (PayerID) references PayAccount(PayerID)
);



create table BankAccount(
    PayerID varchar(20) primary key,
    BankAccount varchar(30),
    foreign key (PayerID) references PayAccount(PayerID)
);



create table Paypal(
    PayerID varchar(20) primary key,
    foreign key (PayerID) references PayAccount(PayerID)
);



create table Orders (
    OrderID int primary key ,
    OrderDate date,
    CustomerID int,
    Payway char(1),
    PayerID varchar(20),
    foreign key (CustomerID) references Customer(CustomerID),
    foreign key (PayerID) references PayAccount(PayerID)
);




create table OrderShirts(
    OrderID int,
    TShirtID int,
    Quantity int,
    primary key (OrderID,TShirtID),
    foreign key (OrderID) references Orders(OrderID),
    foreign key (TShirtID) references TShirt(TShirtID)
);

-- insert datas

insert into Extras values (1,'Ink','48 Time New Roman','Orange','YOUR DESIGN HERE');
insert into Extras values (2,'Cotton','48 Lucida Sans Typewriter','Black','Just Do it');
insert into Extras values (3,'Ink','40 TSegoe Print','Red','Beautiful');
insert into Extras values (4,'Cotton','42 Time New Roman','Blue','AMAZING');
insert into Extras values (5,'Cotton','46Script MT Bold','Orange','JUST KEEP IT');

insert into TShirt values (101,'Standard','XL','Short','White','Cotton',1,200);
insert into TShirt values (102,'Standard','XXL','Short','Red','Cotton',1,340);
insert into TShirt values (103,'Polo','XS','Short','Pink','Cotton',2,130);
insert into TShirt values (104,'Standard','M','Short','Black','Leather',null,120);
insert into TShirt values (105,'Polo','L','Short','White','Cotton',null,100);
insert into TShirt values (106,'Standard','S','Short','Blue','Cotton',5,240);


insert into Customer values (1001,'Colin','Morgan','13201032','30 St. London City');
insert into Customer values (1002,'Lucy','Smith','132301032','32 St. Austin City');
insert into Customer values (1003,'Matthew','Lee','132234032','31 St. New York City');
insert into Customer values (1004,'Linsay','Doll','132567032','12 St. Wall Street');
insert into Customer values (1005,'Mike','Ross','13523232','30 St. Long Suburb');


insert into PayAccount values ('pay1001',1001);
insert into PayAccount values ('pay1002',1002);
insert into PayAccount values ('pay1011',1001);
insert into PayAccount values ('pay1003',1003);
insert into PayAccount values ('pay1033',1003);
insert into PayAccount values ('pay1004',1004);
insert into PayAccount values ('pay1005',1005);

insert into CreditCard values ('pay1001','C23012312321312','2024-12-13');
insert into CreditCard values ('pay1002','C543534432321312','2023-02-13');
insert into CreditCard values ('pay1011','C233543532321312','2023-02-23');
insert into CreditCard values ('pay1003','C230124234233123','2025-12-03');
insert into CreditCard values ('pay1033','C657687943221312','2025-11-03');
insert into CreditCard values ('pay1004','C231233546078862','2026-11-13');
insert into CreditCard values ('pay1005','C314645678763523','2026-11-13');

insert into BankAccount values ('pay1001','B243242344657');
insert into BankAccount values ('pay1002','B4242454653443');
insert into BankAccount values ('pay1011','B4323547657681');
insert into BankAccount values ('pay1003','B9658594646689');
insert into BankAccount values ('pay1033','B3454365657243');
insert into BankAccount values ('pay1004','B3465762326876');
insert into BankAccount values ('pay1005','B8567352321323');

insert into Paypal values ('pay1001');
insert into Paypal values ('pay1002');
insert into Paypal values ('pay1011');
insert into Paypal values ('pay1003');
insert into Paypal values ('pay1033');
insert into Paypal values ('pay1004');
insert into Paypal values ('pay1005');

insert into Orders values (1,'2021-09-30',1001,'D','pay1001');
insert into Orders values (2,'2021-10-02',1001,'D','pay1001');
insert into Orders values (3,'2021-10-11',1002,'C','pay1002');
insert into Orders values (4,'2021-10-04',1003,'C','pay1003');
insert into Orders values (5,'2021-10-03',1004,'P','pay1004');

insert into OrderShirts values (1,101,2);
insert into OrderShirts values (2,102,3);
insert into OrderShirts values (3,103,1);
insert into OrderShirts values (4,104,1);
insert into OrderShirts values (5,105,2);
insert into OrderShirts values (2,101,1);