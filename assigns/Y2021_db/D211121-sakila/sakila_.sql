-- 1
create table phone (
phone_id int not null,
country_code int not null,
phone_number int not null,
phone_type varchar(12),
primary key (phone_id),
constraint ck_phone_type check (phone_type like '%Home%' or phone_type like '%Mobile%' or phone_type like '%Other%')
);


alter table address
drop column phone;

alter table customer add column phone_id int;

alter table store add column phone_id int;

alter table staff add column phone_id int;

alter table customer
add constraint fk_customer_phone foreign key (phone_id) references phone(phone_id) on delete set null on update cascade;

alter table store
add  constraint fk_store_phone foreign key (phone_id) references phone(phone_id) on delete set null on  update cascade;

alter table staff
add  constraint fk_staff_phone foreign key (phone_id) references phone(phone_id) on delete set null on  update cascade;




-- 2
create table person(
person_id smallint unsigned not null,
first_name varchar(20) not null,
last_name varchar(20) not null,
email varchar(20) not null,
active varchar(20),
last_update timestamp not null,
primary key (person_id)
);


alter table payment drop foreign key fk_payment_customer;
alter table payment drop foreign key fk_payment_staff;

alter table rental
	drop foreign key fk_rental_customer,
	drop foreign key fk_rental_staff;

alter table store
	drop foreign key fk_store_staff;

drop table customer, staff;

create table staff(
person_id smallint unsigned not null,
picture blob not null,
username varchar(20) not null,
password varchar(20) not null,
primary key (person_id),
foreign key (person_id) references person(person_id) on delete cascade on update cascade
);

create table customer(
person_id smallint unsigned not null,
create_date timestamp not null,
primary key (person_id),
foreign key (person_id) references person(person_id) on delete cascade on update cascade
);

alter table person add column address_id smallint unsigned not null;

alter table person
 add constraint belongs_to foreign key (address_id) references address(address_id);


alter table staff add column store_id tinyint unsigned not null;
alter table staff
	add constraint works_at foreign key (store_id) references store(store_id);

