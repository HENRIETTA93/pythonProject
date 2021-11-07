
drop table if exists invoice;
drop table if exists order_items;
drop table if exists orders;
drop table if exists customer;
drop table if exists employee;
drop table if exists product;
drop table if exists supplier;
drop table if exists store_shelf;
drop table if exists stores;


create table stores(
    code char(10) primary key,
    address varchar(100) not null,
    city varchar(50)
);

create table store_shelf(
    storeCode char(10),
    shelfID char(10),
    location varchar(50),
    primary key (storecode,shelfID),
    foreign key (storecode) references stores(code)
);



create table supplier(
    name varchar(20) primary key,
    phone varchar(11) not null,
    address text
);

create table product(
    productID char(10) primary key ,
    name varchar(40),
    price decimal,
    storeCode char(10),
    shelfID char(10),
    supplier varchar(20),
    foreign key (storecode, shelfID) references store_shelf(storecode, shelfID),
    foreign key (supplier) references supplier(name)
);


create table employee(
    empID char(10) primary key,
    firstName varchar(20) not null,
    lastName varchar(20) not null,
    phone varchar(11),
    address text
);

create table customer (
    custID char(10) primary key ,
    firstName varchar(20) not null,
    lastName varchar(20) not null,
    address text,
    phone varchar(11),
    email varchar(30),
    dob date,
    marriedOrNot boolean,
    annualIncome int,
    subscription boolean,
    frequency varchar(20),
    satisfaction varchar(20),
    mobilePay boolean,
    spendingScore int
);

create table orders(
    orderID varchar(20) primary key,
    custID char(10) not null,
    empID char(10),
    orderDate date,
    foreign key (custID) references customer(custID),
    foreign key (empID) references employee(empID)
);

create table order_items(
     orderID varchar(20),
     productID char(10),
     qty int,
     primary key (orderID,productID),
     foreign key (orderID) references orders(orderID),
     foreign key (productID) references product(productID)
);

create table invoice(
    invoiceId varchar(25) primary key,
    orderID varchar(20),
    invoiceDate date,
    empID char(10),
    foreign key (orderID) references orders(orderID),
    foreign key (empID) references employee(empID)
);





