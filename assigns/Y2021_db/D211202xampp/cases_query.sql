-- case 1
select distinct scb.station_id,
cs2.phone_number
from citizen_sims cs
join sim_conn_bs scb on scb.sim_id=cs.sim_id
join viral_tests vt on vt.sim_id=cs.sim_id
join sim_conn_bs scb2 on scb.station_id=scb2.station_id
join citizen_sims cs2 on cs2.sim_id=scb2.sim_id and scb2.sim_id!=scb.sim_id
where vt.report_time='2021-10-09 19:30:00' and cs.phone_number='233636'
and vt.sample_result='positive';

-- case 3
select h.hsptal_id, h.hsptal_name, avg(timestampdiff(hour,vt.sample_test_time,vt.report_time)) as avg_report_gen_time
from viral_tests vt join hospitals h on h.hsptal_id=vt.hsptal_id
group by h.hsptal_id, h.hsptal_name;

-- Use case 4: List the phone numbers of all citizens who did two viral tests with the time window
--from 2021-10-03 00:00 to 2021-10-05 00:00. The two viral tests must have a gap time of at least
--24 hours (at least 24 hours apart).




select cs.phone_number
from citizen_sims cs join viral_tests vt on vt.sim_id=cs.sim_id
where sample_test_time between '2021-10-03 00:00' and '2021-10-05 00:00'
group by cs.phone_number
having count(vt.test_id)>=2;


/*
Use case 5: List the high-risk, mid-risk and low-risk districts using one query. High-risk districts
should be listed first, followed by mid-risk districts and then low-risk districts. Example:
district_name	risk_level
Centre Lukewarm Hillside	high
Lenny town	high
Glow Sand district	mid
Raspberry town	low
Bunny Tail district	low

*/


select d.district_name, d.risk_level
from districts d join base_stations bs on d.district_id=bs.district_id
where d.risk_level='high'
union
select d.district_name, d.risk_level
from districts d join base_stations bs on d.district_id=bs.district_id
where d.risk_level='mid'
union
select d.district_name, d.risk_level
from districts d join base_stations bs on d.district_id=bs.district_id
where d.risk_level='low';

/*
Use case 6: List all positive cases found in the district called “Centre Lukewarm Hillside” on 2021-10-04.
The result should include the names and phone numbers of people tested to be positive.
*/
select cs.citizen_name, cs.phone_number
from districts d join base_stations bs on bs.district_id=d.district_id
join sim_conn_bs scb on scb.station_id=bs.station_id
join viral_tests vt on vt.sim_id=scb.sim_id
join citizen_sims cs on cs.sim_id=vt.sim_id
where d.district_name='Centre Lukewarm Hillside'
and vt.sample_result='positive'
and vt.report_time like '2021-10-04%';

/*
Use case 7: Calculate the increase in new positive cases in the district called “Centre Lukewarm Hillside”
on 2021-10-05 compared to 2021-10-04. The result should show a single number indicating the increment.
If there are fewer new positive cases than yesterday, this number should be negative.
*/

select t2.positive_num-t1.positive_num as increment
from
(
select d.district_id, d.district_name, count(distinct cs.sim_id) as positive_num
from districts d join base_stations bs on bs.district_id=d.district_id
join sim_conn_bs scb on scb.station_id=bs.station_id
join viral_tests vt on vt.sim_id=scb.sim_id
join citizen_sims cs on cs.sim_id=vt.sim_id
where d.district_name='Centre Lukewarm Hillside'
and vt.sample_result='positive'
and vt.report_time like '2021-10-04%'
group by d.district_id, d.district_name
) t1
join
(

select d.district_id, d.district_name, count(distinct cs.sim_id) as positive_num
from districts d join base_stations bs on bs.district_id=d.district_id
join sim_conn_bs scb on scb.station_id=bs.station_id
join viral_tests vt on vt.sim_id=scb.sim_id
join citizen_sims cs on cs.sim_id=vt.sim_id
where d.district_name='Centre Lukewarm Hillside'
and vt.sample_result='positive'
and vt.report_time like '2021-10-05%'
group by d.district_id, d.district_name
) t2 on t1.district_id=t2.district_id and t1.district_name=t2.district_name
;

select t1.district_id, t1.district_name, t2.positive_num-t1.positive_num as increment
from
(
select d.district_id, d.district_name, count(distinct cs.sim_id) as positive_num
from districts d join base_stations bs on bs.district_id=d.district_id
join sim_conn_bs scb on scb.station_id=bs.station_id
join viral_tests vt on vt.sim_id=scb.sim_id
join citizen_sims cs on cs.sim_id=vt.sim_id
where d.district_name='Centre Lukewarm Hillside'
and vt.sample_result='positive'
and vt.report_time like '2021-10-04%'
group by d.district_id, d.district_name
) t1
join
(

select d.district_id, d.district_name, count(distinct cs.sim_id) as positive_num
from districts d join base_stations bs on bs.district_id=d.district_id
join sim_conn_bs scb on scb.station_id=bs.station_id
join viral_tests vt on vt.sim_id=scb.sim_id
join citizen_sims cs on cs.sim_id=vt.sim_id
where d.district_name='Centre Lukewarm Hillside'
and vt.sample_result='positive'
and vt.report_time like '2021-10-05%'
group by d.district_id, d.district_name
) t2 on t1.district_id=t2.district_id and t1.district_name=t2.district_name
;


/*
Use case 8: Assume that the spread rate of a virus is calculated by dividing the total number of people that
were in the same district as the positive case with 48 hours (calculated in use case 1) by the total number of
people among them that later confirmed to be infected in 14 days. Again, assume that a person called Mark
(telephone number is 233636) was tested to be positive at 19:30 on 09-Oct-2021 and he is the only person in
the country that has coughid-19. Please write a query that calculates the spread rate of the virus.
*/



select t2.positive_14_numbers/t1.total_48_numbers as infection_rate
from
(
select count(scb1.sim_id) as total_48_numbers
from
(
select scb.station_id, vt.report_time as from_time, date_add(vt.report_time, interval 48 hour) as to_time
from citizen_sims cs
join sim_conn_bs scb on scb.sim_id=cs.sim_id
join viral_tests vt on vt.sim_id=cs.sim_id
where vt.report_time='2021-10-09 19:30:00' and cs.phone_number='233636'
and vt.sample_result='positive'
) t
join sim_conn_bs scb1 on scb1.station_id=t.station_id
where scb1.conn_time between t.from_time and t.to_time
) t1,
(
select count(distinct scb1.sim_id) as positive_14_numbers
from
(
select scb.station_id, cs.sim_id, vt.report_time as from_time, date_add(vt.report_time, interval 14 day) as to_time
from citizen_sims cs
join sim_conn_bs scb on scb.sim_id=cs.sim_id
join viral_tests vt on vt.sim_id=cs.sim_id
where vt.report_time='2021-10-09 19:30:00' and cs.phone_number='233636'
and vt.sample_result='positive'
) t
join sim_conn_bs scb1 on scb1.station_id=t.station_id
join viral_tests vt1 on vt1.sim_id=scb1.sim_id and vt1.sim_id!=t.sim_id
where vt1.report_time between t.from_time and t.to_time
and vt1.sample_result='positive'
) t2;



-- case 1

select d.doctor_id, d.doctor_name, count(vt.test_id)
from doctors d left join viral_tests vt on d.doctor_id=vt.doctor
group by d.doctor_id, d.doctor_name;

-- case 2
select vt.sample_result,
case when cs.age<20 then 'youth'
when cs.age>=20 and cs.age<35 then 'young'
when cs.age>=35 and cs.age<60 then 'middle'
else 'old'
end as age_range, count(distinct cs.sim_id)
from viral_tests vt join citizen_sims cs  on vt.sim_id=cs.sim_id
group by
vt.sample_result,
case when cs.age<20 then 'youth'
when cs.age>=20 and cs.age<35 then 'young'
when cs.age>=35 and cs.age<60 then 'middle'
else 'old'
end;

-- case 3
select hsptal_id,hsptal_name
from hospitals
where hsptal_id not in (select distinct hsptal_id from viral_tests);

-- case 4
select citizen_name, age, sex
from citizen_sims
where sim_id not in (select distinct sim_id from sim_conn_bs);
-- case 5
select d.district_name
from districts d join base_stations bs on bs.district_id=d.district_id
join sim_conn_bs scb on scb.station_id=bs.station_id
join viral_tests vt on vt.sim_id=scb.sim_id
where vt.sample_result='positive'
group by d.district_name
order by count(vt.test_id) desc limit 1;

-- case 6

select cs.citizen_name
from citizen_sims cs
join viral_tests vt on cs.sim_id=vt.sim_id
group by cs.citizen_name
order by count(vt.test_id) desc limit 1;
-- case 7

select *
from
(
select
t1.sim_id, t1.doctor, t1.report_time,
(
select t2.report_time
from viral_tests t2
where t1.sim_id=t2.sim_id and t1.doctor=t2.doctor and t1.test_id!=t2.test_id and t1.report_time<t2.report_time
) as again_report_time
from viral_tests t1
) t where again_report_time is not null;
-- case 8
select cs.citizen_name
from citizen_sims cs join viral_tests vt on vt.sim_id=cs.sim_id
where vt.sample_result='negative' and cs.sim_id in (select distinct sim_id from viral_tests where sample_result='positive')
group by cs.citizen_name
having count(vt.test_id)>=2;

-- case 9
select cs.sim_id,month(vt.report_time) as test_month, count(vt.test_id) as test_times
from viral_tests vt join citizen_sims cs on cs.sim_id=vt.sim_id
join sim_conn_bs scb on scb.sim_id=cs.sim_id
where year(vt.report_time)=2021
group by cs.sim_id, month(vt.report_time)
having count(vt.test_id)>=2;


-- case 10
select cs.sex, vt.sample_result, count(distinct cs.sim_id)
from viral_tests vt join citizen_sims cs on vt.sim_id=cs.sim_id
group by cs.sex, vt.sample_result;