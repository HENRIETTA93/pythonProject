create table TableA(
cust_id int primary key,
name varchar(50)
);

create table TableB(
cust_id int,
tran_id int primary key,
time date,
amount int
);

INSERT INTO tablea (cust_id, name) VALUES (1, 'Steve Jobs');
INSERT INTO tablea (cust_id, name) VALUES (2, 'Bill Gates');


INSERT INTO tableb (cust_id, tran_id, time, amount) VALUES (1, 1, '2017-12-31 23:59:59', 500);
INSERT INTO tableb (cust_id, tran_id, time, amount) VALUES (2, 2, '2018-01-31 20:40:00', 150);
INSERT INTO tableb (cust_id, tran_id, time, amount) VALUES (2, 3, '2018-01-31 21:41:44', 900);
INSERT INTO tableb (cust_id, tran_id, time, amount) VALUES (2, 4, '2018-02-20 00:00:00', 200);
INSERT INTO tableb (cust_id, tran_id, time, amount) VALUES (2, 5, '2018-02-21 00:00:00', 300);
INSERT INTO tableb (cust_id, tran_id, time, amount) VALUES (2, 6, '2018-02-22 00:00:00', 400);


select tt.cust_id, count(tt.tran_id) as trans_num
from
(
select cust_id, tran_id, time, amount,
(
select max(time)
from TableB b where b.time<t.time
) as pre_time
from TableB t
) tt join
TableB tb on tt.pre_time=tb.time and tb.cust_id=tt.cust_id
join
(
select cust_id, min(time) as first_time
from TableB
group by cust_id
) tc on tc.cust_id=tt.cust_id and tt.time!=tc.first_time and tt.pre_time!=tc.first_time
where tt.amount+tb.amount>1000
group by tt.cust_id;



select t1.*
from TableB t1
join
(
select cust_id, tran_id, rank() over( partition by cust_id order by time) as rank
from TableB
) t2 on t2.cust_id=t1.cust_id and t2.tran_id=t1.tran_id where t2.rank=3;