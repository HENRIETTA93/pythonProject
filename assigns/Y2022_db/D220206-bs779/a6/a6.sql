
--create type PERSON_TY as (
--first_name varchar(20),
--last_name varchar(20),
--date_of_birth date
--);

create or replace type PERSON_TY as object(
first_name varchar2(20),
last_name varchar2(20),
date_of_birth date
);

create type DRIVER_TY as (
PERSON_TY PERSON_TY,
Drivers_License_ID varchar(30),
Date_Driven date
);

create or replace type DRIVER_TY as object(
Person PERSON_TY,
Drivers_License_ID varchar(30),
Date_Driven date
);



create type OWNER_TY as (
PERSON_TY PERSON_TY,
Date_Purchased date,
Date_Sold date
);

create or replace type OWNER_TY as (
Person PERSON_TY,
Date_Purchased date,
Date_Sold date
);

create type OWNERS_VA as varray(3) of OWNERS_TY;



create type DRIVERS_NT as table of DRIVER_TY;


create table AUTOMOBILE(
vehicle_identification_number  varchar2(30) primary key,
Owners OWNER_VA,
Drivers DRIVERS_NT
);

insert into AUTOMOBILE
values (101,
OWNER_VA(
OWNERS_TY(PERSON_TY('Lance','Smalltalk',null),to_date('1/29/2016','MM/DD/YYYY'),null)
),
DRIVERS_NT(
DRIVERS_TY(
PERSON_TY('Erin','Smalltalk',to_date('5/23/1965','MM/DD/YYYY')),'MA101',to_date('3/1/2018','MM/DD/YYYY')
),
DRIVERS_TY(
PERSON_TY('Joe','Smalltalk',to_date('10/7/1982','MM/DD/YYYY')),'MA204',to_date('3/15/2018','MM/DD/YYYY')
)
)
);

insert into AUTOMOBILE
values (101,
OWNER_VA(
OWNERS_TY(PERSON_TY('George','Stephanopolis',null),to_date('7/15/2014','MM/DD/YYYY'),to_date('6/17/2016','MM/DD/YYYY')),
OWNERS_TY(PERSON_TY('Max','Lucids',null),to_date('6/18/2016','MM/DD/YYYY'),null)
),
DRIVERS_NT(
DRIVERS_TY(
PERSON_TY('Julie','Goldstein',to_date('7/19/1977','MM/DD/YYYY')),'MA506',to_date('1/5/2016','MM/DD/YYYY')
),
DRIVERS_TY(
PERSON_TY('Max','Lucids',to_date('2/12/1987','MM/DD/YYYY')),'MA706',to_date('3/5/2018','MM/DD/YYYY')
)
)
);


--7.	Write a query which lists the first and last names of all drivers, along with the vehicle identification number of the car they drive and date driven.
--8.	Write a query which lists the first and last names of all owners, along with the vehicle identification number of the car, the date of purchase and sale.


select p.first_name, p.last_name, a.vehicle_identification_number, d.Date_Driven
from AUTOMOBILE a, table(a.Drivers d), table(d.Person) p;


select p.first_name, p.last_name, a.vehicle_identification_number, o.Date_Purchased,o.Date_Sold
from AUTOMOBILE a, table(a.Owners o), table(o.Person) p;