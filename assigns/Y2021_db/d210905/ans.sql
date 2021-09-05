select concat(YEAR(date), '-',MONTH(date)) as yearmonth, count(distinct uid) as active_users
from grammarly_data_exercise
group by concat(YEAR(date), '-',MONTH(date));

select '2016-02-04' as date, concat(tt.retain_users/tt2.total0204*100,'%') as retain_percent
from
(
select count(*) as retain_users
from
(
select *
from grammarly_data_exercise
where isFirst='Y' and date='2016-02-04'
) t1
join
(
select distinct date, uid
from grammarly_data_exercise
where isFirst='N' and date='2016-02-04'
) t2 where t1.date=t2.date and t1.uid=t2.uid
) tt
,
(
select count(*) as total0204
from grammarly_data_exercise
where isFirst='Y' and date='2016-02-04'
) tt2

union

select '2016-02-10' as date, concat(tt.retain_users/tt2.total0210*100,'%') as retain_percent
from
(
select count(*) as retain_users
from
(
select *
from grammarly_data_exercise
where isFirst='Y' and date='2016-02-10'
) t1
join
(
select distinct date, uid
from grammarly_data_exercise
where isFirst='N' and date='2016-02-10'
) t2 where t1.date=t2.date and t1.uid=t2.uid
) tt
,
(
select count(*) as total0210
from grammarly_data_exercise
where isFirst='Y' and date='2016-02-10'
) tt2

union

select '2016-02-14' as date, concat(tt.retain_users/tt2.total0214*100,'%') as retain_percent
from
(
select count(*) as retain_users
from
(
select *
from grammarly_data_exercise
where isFirst='Y' and date='2016-02-14'
) t1
join
(
select distinct date, uid
from grammarly_data_exercise
where isFirst='N' and date='2016-02-14'
) t2 where t1.date=t2.date and t1.uid=t2.uid
) tt
,
(
select count(*) as total0214
from grammarly_data_exercise
where isFirst='Y' and date='2016-02-14'
) tt2






select utmSource, count(distinct uid) as num_users
from grammarly_data_exercise
group by utmSource
order by num_users desc;