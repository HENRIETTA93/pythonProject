-- Q1
create table customers (
birth_day date,
first_name varchar(20) not null,
last_name varchar(20) not null,
c_id int primary key
);

create table employees (
birth_day date,
first_name varchar(20) not null,
last_name varchar(20) not null,
e_id int primary key
);

create table locations (
address varchar(20) not null,
l_id int primary key
);

create table transactions (
e_id int,
c_id int,
l_id int,
date date,
t_id int primary key,
constraint fk_e_id foreign key (e_id) references employees(e_id),
constraint fk_c_id foreign key (c_id) references customers(c_id),
constraint fk_l_id foreign key (l_id) references locations(l_id)
);

create table items (
price_for_each int,
name varchar(20) primary key
);

create table itemsbroughtintoshop(
name varchar(20),
l_id int,
amount int,
date date,
primary key (name,l_id, amount,date),
constraint fk_name_item foreign key (name) references items(name),
constraint fk_l_id_shop foreign key (l_id) references locations(l_id)
);

create table movementofitems (
name varchar(20),
from_l_id int,
to_l_id int,
amount int,
date date,
primary key (name,from_l_id, to_l_id,amount, date),
constraint fk_name_mv_item foreign key (name) references items(name),
constraint fk_l_id_mv1 foreign key(from_l_id) references locations(l_id),
constraint fk_l_id_mv2 foreign key(to_l_id) references locations(l_id)
);
create table ItemsInTransactions(
name varchar(20),
t_id int,
amount int,
primary key(name, t_id),
constraint fk_name_tr foreign key (name) references items(name),
constraint fk_tid_tr foreign key (t_id) references transactions(t_id)
);


-- Q2
create or replace view DeniseTransactions
as
select count(distinct t.t_id) as number_of_transactions
from employees e
join transactions t
on e.e_id=t.e_id
and year(t.date)=2021 and month(t.date)=9
and e.first_name='Denise' and e.last_name='Davies';

 SELECT * FROM DeniseTransactions;

-- Q3
create or replace view PeopleInShop
as
select distinct c.birth_day, c.first_name,c.last_name
from customers c
join transactions t
on c.c_id=t.c_id
where t.date='2021-09-07' and t.l_id=1
union
select distinct e.birth_day, e.first_name,e.last_name
from employees e
join transactions t
on e.e_id=t.e_id
where t.date='2021-09-07' and t.l_id=1
order by birth_day;

 SELECT * FROM PeopleInShop;

-- Q4
create or replace view TransactionValue
as
select t1.t_id, sum(t2.price_for_each* t1.amount) as value
from Itemsintransactions t1
join Items t2
on t1.name=t2.name
group by t1.t_id;

SELECT * FROM TransactionValue;


-- Q5
create or replace view vw1
as
select t.name, t.l_id, t.from_l_id, t.to_l_id, t.amount, t.date
from
(
select name,l_id, 0 as from_l_id, 0 as to_l_id, amount, date
from itemsbroughtintoshop
union

select name,0 as l_id,0 as  from_l_id, to_l_id, amount, date
from movementofitems
union

select name,0 as l_id, from_l_id, 0 as to_l_id, 0-amount,date
from movementofitems

union
select name, 0 as l_id, l_id as from_l_id , 0 as to_l_id, 0-amount, t.date
from transactions t join
itemsintransactions i on t.t_id=i.t_id

) t
;

create or replace view vw2
as
select name, l_id, amount, date
from vw1
where l_id!=0
union
select name, from_l_id as l_id, amount, date
from vw1
where from_l_id!=0
union
select name, to_l_id as l_id, amount, date
from vw1
where to_l_id!=0
order by name, l_id,date;

create or replace view vw3
as
select distinct name, l_id, t.date from vw2,
(
select distinct date from itemsbroughtintoshop
union
select distinct date from movementofitems
union
select distinct date from transactions
order by date
) t;

create or replace view vw4
as
select vw3.name, vw3.l_id, ifnull(vw2.amount,0) amount, vw3.date
from
vw3 left join
vw2 on vw3.date=vw2.date
and vw3.l_id=vw2.l_id
and vw3.name=vw2.name
;

create view
ItemsOnDateAndLocation
as
select *
from
(
select
t1.name, t1.l_id,
t1.date,
(
select sum(amount)
from vw4 v4
where v4.name=t1.name and v4.l_id=t1.l_id and t1.date>=v4.date
) as amount
from vw4 t1
) t
where amount!=0;

select * from ItemsOnDateAndLocation;

-- Q6



create view FeasibleLocations
as
select l_id, if(count=total_count, 1, 0) as feasible
from
(
select t.l_id, sum(count1) as count, count(t.l_id) as total_count
from
(
select l_id, if(amount>0,1,0) as count1
from ItemsOnDateAndLocation
) t
join ItemsOnDateAndLocation t2 on t.l_id=t2.l_id
group by t.l_id
) tt;
SELECT * FROM FeasibleLocations;
