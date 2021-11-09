SELECT * FROM `appointmentdata`

/*
Appointment Data Questions:

Background:  Some time ago, for our evening clinic (visits after 5:30pm) we explored the idea of providing telephone visits as an alternative to a face-to-face visit to patients to improve service.  We felt that this would be a more convenient alternative for the patient to get their medical needs met without having to come in.  Attached is about 6 months worth of visits, which includes the telephone encounters.  After we implemented the program, we wanted to use the visit data to determine how to staff for the evening appointments and evaluate the effectiveness of the program.

Please use this data to determine the effectiveness of the program by answering the following business questions:

* How many physicians would you need to staff the after-hours (appointments after 5:30pm) telephone clinic?  Assume, that 1 physician can see 4 telephone visits per hour.

* How effective are the Telephone Appointments during after-hours (appointments after 5:30pm)? An effective telephone appointment is one where there are no follow-up appointments to the call within the following 7 days

* Based on the available data, what suggestions would you have to improve the effectiveness of the telephone appointments (reduce the number of telephone appointments needing a follow-up appointment within 7 days)?

*/

-- firstly, 确认最后电话访问的时间
select max(appointment_time) from appointmentdata;

-- 根据上述时间确定每天，下班后，每一小时内的电话访问数量，然后统计需要的医生数量，取最大值方可满足要求

select appointment_date, case when appointment_time>= '17:30:00' and appointment_time<'18:30:00' then '17:30~18:30'
when appointment_time>= '18:30:00' and appointment_time<'19:30:00' then '18:30~19:30'
when appointment_time>= '19:30:00' and appointment_time<'20:30:00' then '19:30~20:30'
when appointment_time>= '20:30:00' and appointment_time<'21:30:00' then '20:30~21:30'
end as appointment_time_range,
count(patient_id) as telephone_visits_number, round(count(patient_id)/4) as telephone_doctors_need
from appointmentdata
where appointment_time>='17:30:00' and appointment_type='Telephone Visit'
group by
appointment_date, case when appointment_time>= '17:30:00' and appointment_time<'18:30:00' then '17:30~18:30'
when appointment_time>= '18:30:00' and appointment_time<'19:30:00' then '18:30~19:30'
when appointment_time>= '19:30:00' and appointment_time<'20:30:00' then '19:30~20:30'
when appointment_time>= '20:30:00' and appointment_time<'21:30:00' then '20:30~21:30'
end
order by telephone_visits_number desc;


select appointment_date, case when appointment_time>= '17:30:00' and appointment_time<'18:30:00' then '17:30~18:30'
when appointment_time>= '18:30:00' and appointment_time<'19:30:00' then '18:30~19:30'
when appointment_time>= '19:30:00' and appointment_time<'20:30:00' then '19:30~20:30'
when appointment_time>= '20:30:00' and appointment_time<'21:30:00' then '20:30~21:30'
end as appointment_time_range,
count(patient_id) as telephone_visits_number, round(count(patient_id)/4) as telephone_doctors_need
from appointmentdata
where appointment_time>='17:30:00' and appointment_type='Telephone Visit'
group by
appointment_date, case when appointment_time>= '17:30:00' and appointment_time<'18:30:00' then '17:30~18:30'
when appointment_time>= '18:30:00' and appointment_time<'19:30:00' then '18:30~19:30'
when appointment_time>= '19:30:00' and appointment_time<'20:30:00' then '19:30~20:30'
when appointment_time>= '20:30:00' and appointment_time<'21:30:00' then '20:30~21:30'
end
order by appointment_date, appointment_time_range;

-- Q2 步骤
-- 查询出在下班后预约的patient，预约日期，预约时间；以及在七天内继续电话预约的日期和时间
select distinct t1.patient_id, t1.appointment_date, t1.appointment_time,
t2.appointment_date as appointment_again_date, t2.appointment_time as appointment_again_time
from
(
select patient_id, appointment_date, appointment_time
from appointmentdata
where appointment_type='Telephone Visit'
and appointment_time>='17:30:00'
) t1
join
(
select patient_id, appointment_date, appointment_time
from appointmentdata
where appointment_type='Telephone Visit'
) t2
on t1.patient_id= t2.patient_id
where t2.appointment_date=t1.appointment_date and t2.appointment_time>t1.appointment_time
or
t2.appointment_date>t1.appointment_date
and t2.appointment_date<date_add(t1.appointment_date,interval 7 day)
;

-- 下班后电话预约人数统计
select count(patient_id) as telephone_count_after_work
from appointmentdata
where appointment_type='Telephone Visit'
and appointment_time>='17:30:00'
group by patient_id, appointment_date;

-- 使用上述查询作为subquery, 统计下班后预约并后续7天内继续预约的人数
-- group by patient_id,appointment_date目的是 消除一个patient可能在7天之内预约多次，按提议只能算1次
select patient_id, appointment_date, count(patient_id) as telephone_again_count
from
(
select distinct t1.patient_id, t1.appointment_date, t1.appointment_time,
t2.appointment_date as appointment_again_date, t2.appointment_time as appointment_again_time
from
(
select patient_id, appointment_date, appointment_time
from appointmentdata
where appointment_type='Telephone Visit'
and appointment_time>='17:30:00'
) t1
join
(
select patient_id, appointment_date, appointment_time
from appointmentdata
where appointment_type='Telephone Visit'
) t2
on t1.patient_id= t2.patient_id
where t2.appointment_date=t1.appointment_date and t2.appointment_time>t1.appointment_time
or
t2.appointment_date>t1.appointment_date
and t2.appointment_date<date_add(t1.appointment_date,interval 7 day)
) t
group by patient_id, appointment_date;

-- 所有预约在下班后的patient的数量，如果一个patient在不同日期预约算两次
select count(telephone_count_after_work)
from
(
select count(patient_id) as telephone_count_after_work
from appointmentdata
where appointment_type='Telephone Visit'
and appointment_time>='17:30:00'
group by patient_id, appointment_date
) tt;

-- Q2 final

select count(tt1.patient_id) as telephone_again_count,
(select count(telephone_count_after_work)
from
(
select count(patient_id) as telephone_count_after_work
from appointmentdata
where appointment_type='Telephone Visit'
and appointment_time>='17:30:00'
group by patient_id, appointment_date
) tt) as total_telephone_after_work_count
,
count(tt1.patient_id)/(select count(telephone_count_after_work)
from
(
select count(patient_id) as telephone_count_after_work
from appointmentdata
where appointment_type='Telephone Visit'
and appointment_time>='17:30:00'
group by patient_id, appointment_date
) tt) as telephone_again_percent
from
(
select patient_id, appointment_date, count(patient_id) as telephone_again_count
from
(
select distinct t1.patient_id, t1.appointment_date, t1.appointment_time,
t2.appointment_date as appointment_again_date, t2.appointment_time as appointment_again_time
from
(
select patient_id, appointment_date, appointment_time
from appointmentdata
where appointment_type='Telephone Visit'
and appointment_time>='17:30:00'
) t1
join
(
select patient_id, appointment_date, appointment_time
from appointmentdata
where appointment_type='Telephone Visit'
) t2
on t1.patient_id= t2.patient_id
where t2.appointment_date=t1.appointment_date and t2.appointment_time>t1.appointment_time
or
t2.appointment_date>t1.appointment_date
and t2.appointment_date<date_add(t1.appointment_date,interval 7 day)
) t
group by patient_id, appointment_date
) tt1;

-- Q3
-- 分析
-- 查询出第一次预约后没有checkin的人数为43人
-- 查询出第二次预约没有checkin的人数为32 人，根据Q2的165人进行了复约， 提出为了降低复约人数，建议如果初次预约不赴约者排期将延后到一月之后

select
sum(case when checkin_date is null then 1 else 0 end) as first_notshow_appointment,
sum(case when checkin_again_date is null then 1 else 0 end) as notshow_appointment_again
from
(
select distinct t1.patient_id, t1.appointment_date, t1.appointment_time,
t2.appointment_date as appointment_again_date, t2.appointment_time as appointment_again_time,
t1.checkin_date, t1.checkin_time,
t2.checkin_date as checkin_again_date, t2.checkin_time as checkin_again_time
from
(
select patient_id, appointment_date, appointment_time, checkin_date, checkin_time
from appointmentdata
where appointment_type='Telephone Visit'
and appointment_time>='17:30:00'
) t1
join
(
select patient_id, appointment_date, appointment_time, checkin_date, checkin_time
from appointmentdata
where appointment_type='Telephone Visit'
) t2
on t1.patient_id= t2.patient_id
where (t2.appointment_date=t1.appointment_date and t2.appointment_time>t1.appointment_time
or
t2.appointment_date>t1.appointment_date
and t2.appointment_date<date_add(t1.appointment_date,interval 7 day)
)
) tt;


