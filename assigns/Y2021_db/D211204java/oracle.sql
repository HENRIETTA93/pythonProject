drop table department cascade constraints;
drop table job cascade constraints;
drop table employee cascade constraints;
drop table services cascade constraints;
drop table users cascade constraints;
drop table stateid cascade constraints;
drop table permit cascade constraints;
drop table registration cascade constraints;
drop table license cascade constraints;
drop table appointment cascade constraints;
drop table transactions cascade constraints;

create table department(
dept_id number(10) not null primary key,
dept_name varchar2(30)
);

create table job(
job_id number(10) primary key,
job_type varchar2(20) not null,
job_title varchar2(30) not null,
salary number(*,2) not null
);

create table employee(
employee_id number(10) primary key,
first_name varchar2(20),
last_name varchar2(20),
dept_id number(10),
job_id number(10),
foreign key (dept_id) references department(dept_id),
foreign key (job_id) references job(job_id)
);

create table services(
service_type varchar2(20) not null primary key,
dept_id number(10) not null,
service_price number(*,2) not null,
foreign key (dept_id) references department(dept_id)
);


create table users(
user_id number(10) not null primary key,
fisrt_name varchar2(20),
last_name varchar2(20)
);


create table stateid(
state_id number(10),
date_issued date,
date_expired date,
user_id number(10),
primary key (state_id,date_issued),
foreign key (user_id) references users(user_id)
);

create table registration(
registration_id number(10),
date_issued date,
date_expired date,
user_id number(10),
primary key (registration_id,date_issued),
foreign key (user_id) references users(user_id)
);

create table permit(
permit_id number(10),
date_issued date,
date_expired date,
user_id number(10),
primary key (permit_id,date_issued),
foreign key (user_id) references users(user_id)
);

create table license(
license_id number(10),
date_issued date,
date_expired date,
user_id number(10),
primary key (license_id,date_issued),
foreign key (user_id) references users(user_id)
);

create table appointment(
appoint_id number(10) primary key,
service_type varchar2(20) not null,
user_id number(10),
appointment_date date,
begin_time date,
end_time date,
foreign key (service_type) references services(service_type),
foreign key (user_id) references users(user_id)
);

create table transactions(
transaction_id number(10) primary key ,
appoint_id number(10) not null,
pay_price number(*,2)
);


insert into department values (1,'State ID Dept');
insert into department values (2,'License Dept');
insert into department values (3,'Vehilce Registration Dept');
insert into department values (4,'Permit Dept');

insert into job values (1,'supervisor','senior supervisor',6000);
insert into job values (2,'font desk','senior font desk',4000);
insert into job values (3,'security','senior security',3000);
insert into job values (4,'supervisor','junior supervisor',5000);
insert into job values (5,'font desk','junior font desk',3000);
insert into job values (6,'security','junior security',2000);

insert into employee values (1,'Colin','Morgan',1,1);
insert into employee values (2,'Lucy','Ross',1,4);
insert into employee values (3,'Dan','Stevens',1,2);
insert into employee values (4,'David','Lee',1,3);
insert into employee values (5,'July','Monash',2,1);
insert into employee values (6,'John','Smith',2,4);
insert into employee values (7,'Linsay','Dole',3,2);
insert into employee values (8,'Maple','May',3,3);

insert into services values ('State ID',1,12);
insert into services values ('License',2,25);
insert into services values ('Vehilce Registration',3,100);
insert into services values ('Permit',4,7);

insert into users values (1,'Ruby','Green');
insert into users values (2,'William','Smith');