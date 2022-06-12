
create database task1;

use task1;


create table Unit(
code char(6) primary key,
name varchar(20) not null,
descritpion text
);

create table Tutor(
staffID int primary key auto_increment,
firstName varchar(20) not null,
lastName varchar(20) not null
) auto_increment=1000000;

create table Student(
ID int primary key auto_increment,
firstName varchar(20) not null,
lastName varchar(20) not null,
phoneNr varchar(12),
gender varchar(20) check ( gender in ('female', 'male','other') )
) auto_increment=1000000;


create table TaughtBy(
staffID int,
unitCode char(6),
semestr varchar(20) check(semestr in ('semester 1','semester 2','summer')),
primary key(staffID,unitCode, semestr),
foreign key (staffID) references Tutor(staffID),
foreign key (unitCode) references Unit(code)
);

create table TuteGroup(
groupCode varchar(10),
staffID int,
date date,
room varchar(20) default 'room 1',
primary key (groupCode),
foreign key (staffID) references Tutor(staffID)
);

create table TuteEnrollment(
stuID int,
unitCode char(6),
tuteCode varchar(10),
primary key(stuID, unitCode),
foreign key (stuID) references Student(ID),
foreign key (unitCode) references Unit(code),
foreign key (tuteCode) references TuteGroup(groupCode)
);