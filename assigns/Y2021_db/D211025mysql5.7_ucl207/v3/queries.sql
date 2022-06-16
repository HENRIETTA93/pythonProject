-- Q2
create or replace view DeniseTransactions
as
select count(transactions.t_id) as number_of_transactions
from  transactions
join employees
on employees.e_id=transactions.e_id
and month(transactions.date)=9
and year(transactions.date)=2021
and employees.first_name='Denise' and employees.last_name='Davies';

SELECT * FROM DeniseTransactions;

-- Q3
create or replace view PeopleInShop
as
select distinct birth_day, first_name,last_name
from employees
join transactions
on employees.e_id=transactions.e_id
where transactions.date='2021-09-07' and transactions.l_id=1
union
select distinct birth_day, first_name,last_name
from customers
join transactions
on customers.c_id=transactions.c_id
where transactions.date='2021-09-07' and transactions.l_id=1
order by birth_day;

SELECT * FROM PeopleInShop;

-- Q4
create or replace view TransactionValue
as
select t_id, sum(price_for_each* amount) as value
from Itemsintransactions
join Items on Itemsintransactions.name=Items.name
group by t_id;

SELECT * FROM TransactionValue;


-- Q5

create view q5_1
as
select name,l_id, amount, date
from itemsbroughtintoshop
union
select name,from_l_id, 0-amount,date
from movementofitems
union
select name, to_l_id as l_id, amount, date
from movementofitems
union
select name,  l_id, 0-amount, t.date
from transactions t join itemsintransactions i on t.t_id=i.t_id
order by name, l_id, date;

create view q5_2
as
select distinct name, l_id, t.date
from q5_1,
(
select distinct date from itemsbroughtintoshop
union
select distinct date from transactions
union
select distinct date from movementofitems
) t
order by name,l_id, t.date;

create or replace view q5_3
as
select q5_2.name, q5_2.l_id, ifnull(q5_1.amount,0) as amount, q5_2.date
from q5_1
right join q5_2
on q5_1.name=q5_2.name and q5_1.l_id=q5_2.l_id
and q5_1.date=q5_2.date
;

create view ItemsOnDateAndLocation
as
select
distinct name, l_id, date,
(
select sum(amount) from q5_3 a1
where a2.date>=a1.date
and a2.name=a1.name
and a2.l_id=a1.l_id
) amount
from q5_3 a2
where (
select sum(amount) from q5_3 a1
where a2.date>=a1.date
and a2.name=a1.name
and a2.l_id=a1.l_id
) !=0;

-- Q6

create view FeasibleLocations
as
select t1.l_id, if(t1.total=t2.partial, 1,0) as feasible
from
(
select l_id, count(*) as total
from
ItemsOnDateAndLocation
group by l_id
) t1
join
(

select l_id, count(*) as partial
from
ItemsOnDateAndLocation
where amount>0
group by l_id
) t2 on t1.l_id=t2.l_id;

------
--- draft---
create view q5_1
as
select name,l_id, amount, date
from itemsbroughtintoshop
union
select name,from_l_id, 0-amount,date
from movementofitems
union
select name, to_l_id as l_id, amount, date
from movementofitems
union
select name,  l_id, 0-amount, t.date
from transactions t join itemsintransactions i on t.t_id=i.t_id;