-- Question 1

drop table if exists work;
drop table if exists contract;
drop table if exists staff;
drop table if exists ownership;
drop table if exists artwork;
drop table if exists location;
drop table if exists owner;
drop table if exists technique;
drop table if exists expertise;



create table location(
location_id char(10) primary key,
room varchar(20) not null,
floor int not null
);

create table artwork(
artwork_id int primary key,
location_id char(10),
title varchar(50) not null,
type varchar(20),
status char(5),
foreign key (location_id) references location(location_id) on delete set null on update cascade
);

create table owner(
owner_id int primary key,
first_name varchar(20),
last_name varchar(20),
email varchar(30),
phone char(12)
);

create table ownership(
artwork_id int,
owner_id int,
primary key(artwork_id, owner_id),
foreign key (artwork_id) references artwork(artwork_id) on delete cascade,
foreign key (owner_id) references owner(owner_id) on delete cascade
);

create table technique(
technique_id int primary key,
name varchar(20) not null,
description varchar(200)
);

create table expertise(
expertise_id char(10) primary key,
expertise_name varchar(20) not null,
expertise_description varchar(100)
);

create table staff(
staff_id char(10) primary key,
expertise_id char(10),
first_name varchar(20) not null,
last_name varchar(20) not null,
supervisor_id char(10),
foreign key (expertise_id) references expertise(expertise_id) on delete set null,
foreign key (supervisor_id) references staff(staff_id) on delete set null
);

create table contract(
contract_id int primary key,
artwork_id int,
start_date date not null,
end_date date,
estimated_hours int,
billing_owner_id int,
foreign key (artwork_id) references artwork(artwork_id) on delete cascade,
foreign key (billing_owner_id) references owner(owner_id) on delete set null
);
create table work(
work_id int primary key,
contract_id int,
technique_id int,
staff_id char(10),
hours int,
notes text,
foreign key (contract_id) references contract(contract_id) on delete set null,
foreign key (technique_id) references technique(technique_id) on delete cascade,
foreign key (staff_id) references staff(staff_id) on delete set null
);



-- Question 2.1
insert into location values('LOC100001', 'Room1', 2);

insert into artwork values(1, 'LOC100001', 'ART 1', 'painting', 'Y');

insert into owner values (100, 'Linsay','Dole', 'linsay001@gmail.com',232212);

insert into ownership values (1,100);

insert into technique values (10001,'TECH 1', 'TECH 1');

insert into expertise values ('E0001', 'EXPERTISE 1', 'EXPERTISE 1');

insert into staff values ('STF1000010', 'E0001', 'John', 'Smith', null);
insert into staff values ('STF1000002', 'E0001', 'David', 'Smith', 'STF1000010');

insert into contract values (1, 1,'2021-11-12', '2021-11-18', 40, 100);
insert into contract values (2, 1,'2021-11-18', null, 40, 100);

insert into work values (1001, 1, 10001, 'STF1000002', 20, 'notes');
insert into work values (1002, 2, 10001, 'STF1000002', 20, 'notes');

select * from location;
select * from artwork;
select * from owner;
select * from ownership;
select * from technique;
select * from expertise;
select * from staff;
select * from contract;
select * from work;

-- Question 2.2
update location set location_id='LOC100002' where location_id='LOC100001';
/*
the update result is:
Query OK, 1 row affected
because the attribute 'location_id' of table artwork references table location and the foreign key constraint is
"on delete set null on update cascade" which means if I change the value of the parent table, the child table's value
will be changed together.
*/

-- Question 2.3

delete from expertise where expertise_id='E0001';
/*
the update result is:
Query OK, 1 row affected

and the child table "staff":
select * from staff;
+------------+--------------+------------+-----------+---------------+
| staff_id   | expertise_id | first_name | last_name | supervisor_id |
+------------+--------------+------------+-----------+---------------+
| STF1000002 | NULL         | David      | Smith     | STF1000010    |
| STF1000010 | NULL         | John       | Smith     | NULL          |
+------------+--------------+------------+-----------+---------------+
as the result above, the child table's column expertise_id has been set null value.
because the foreign key constraint of staff table is "on delete set null"
so the parent table's value can be deleted.

*/
-- Question 2.4

alter table contract add column hourly_rate decimal default 50.00;
-- Question 2.5

update contract set hourly_rate=80.00;


-- Question 2.6
select contract_id as "Contract Number", hourly_rate*estimated_hours as "Estimated Contract Cost"
from contract;
/*
+-----------------+-------------------------+
| Contract Number | Estimated Contract Cost |
+-----------------+-------------------------+
|               1 |                    3200 |
|               2 |                    3200 |
+-----------------+-------------------------+

*/

-- Question 2.7

select contract_id as "Contract Number", datediff(end_date, start_date) as "Number of days"
from contract
where end_date is not null;

/*
+-----------------+----------------+
| Contract Number | Number of days |
+-----------------+----------------+
|               1 |              6 |
+-----------------+----------------+

*/

-- Question 2.8
select contract_id as "Contract Number", ifnull(datediff(end_date, start_date), 'Still in progress') as "Number of days"
from contract;
/*
+-----------------+-------------------+
| Contract Number | Number of days    |
+-----------------+-------------------+
|               1 | 6                 |
|               2 | Still in progress |
+-----------------+-------------------+

*/


-- Question 2.9
select count(contract_id) as "# Contracts Completed In Last 30 Days"
from contract
where datediff(end_date,start_date)<30;

/*
+---------------------------------------+
| # Contracts Completed In Last 30 Days |
+---------------------------------------+
|                                     1 |
+---------------------------------------+
1 row in set (0.00 sec)
*/
-- Question 2.10
select billing_owner_id as "Billing Owner ID", count(contract_id) as"# Contracts",
 sum(hourly_rate*estimated_hours) as "Estimated Total Contracts Cost"
from contract
group by billing_owner_id;

/*

+------------------+-------------+--------------------------------+
| Billing Owner ID | # Contracts | Estimated Total Contracts Cost |
+------------------+-------------+--------------------------------+
|              100 |           2 |                           6400 |
+------------------+-------------+--------------------------------+
*/

