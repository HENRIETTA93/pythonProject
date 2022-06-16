create view dates
as
select distinct date from movementofitems
union
select distinct date from itemsbroughtintoshop
union
select distinct date from transactions
order by date
;

CREATE VIEW totalaccount AS(
 SELECT name,l_id,date,sortrecord.amount
    FROM (
     SELECT name,l_id,date,SUM(record.amount) as amount
     FROM (
        SELECT name,l_id,date,amount FROM itemsbroughtintoshop
        UNION ALL
        SELECT name,to_l_id,date,amount FROM movementofitems
        UNION ALL
        SELECT name,l_id,date,-amount FROM transactions t, itemsintransactions i where           t.t_id=i.t_id
        UNION ALL
        SELECT name,from_l_id,date,-amount FROM movementofitems) record
        GROUP BY name,l_id,date) sortrecord
    ORDER BY name,l_id,date
    );

create view alltmp
as
select t.name,dates.date, t.l_id
from dates, (select distinct name, l_id from totalaccount) t
;


create or replace view tmp2
as
select t1.*, case when t2.amount is null then 0 else t2.amount end as amount
from alltmp t1 left join totalaccount t2
on t1.name=t2.name
and t1.l_id=t2.l_id
and t1.date=t2.date;


select t1.name, t1.l_id, t1.date,
(
select sum(amount)
from tmp2 t2
where t1.name=t2.name and t1.l_id=t2.l_id and t1.date>=t2.date
) amount
from tmp2 t1;



select l_id, case when total_positive_count=total_count then 1 else 0 end as feaible
from
(
select l_id, sum(case when amount>=0 then 1 else 0 end) as total_positive_count, count(amount) as total_count
from q5
group by l_id
) t
