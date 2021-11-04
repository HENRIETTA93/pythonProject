select
case when product like '%android%' then 'Android'
when product like '%ios%' then 'ios' end as product,
count(device_id) as device_count
from dwd_mail_users_login
where year(event_time)=2021
and (app_version='7.7.0' or app_version='7.7.1')
and uid like '%126.com'
group by case when product like '%android%' then 'Android'
when product like '%ios%' then 'ios' end;


-- 2、查询2021年10月登录天数大于3天，且在9月没有登录过的新设备明细
select t.*
from dwd_mail_users_login t
join
(
select device_id
from dwd_mail_users_login
where year(event_time)=2021 and month(event_time)=10
and is_new_device_id=1
group by device_id
having  count(distinct day(event_time))>=3
) t1 on t1.device_id=t.device_id
join
(
select device_id
from dwd_mail_users_login
where year(event_time)=2021 and month(event_time)=10
and is_new_device_id=1
group by device_id
having  count(distinct day(event_time))=0
) t2 on t1.device_id=t2.device_id;


-- 3、查询2021年10月有登录且没有发生过发信事件（key = send_email）的设备, 并统计这些设备在10月有发生过收信事件（key=receive_email）的天数

select tt.device_id, count(distinct day(tt.event_time)) as receive_days
from
(
select t1.device_id
from
(
select device_id
from dwd_mail_users_login
where year(event_time)=2021 and month(event_time)=10
group by device_id
having count(event_time)>0
) t1
join
(
select device_id
from dwd_key_all
where `key`='send_email'
and year(event_time)=2021 and month(event_time)=10
group by device_id
having count(event_time)=0
) t2 on t1.device_id=t2.device_id
) t join
dwd_key_all tt on t.device_id=tt.device_id
where year(tt.event_time)=2021 and month(tt.event_time)=10
group by tt.device_id
having  count(distinct day(tt.event_time))>0;


-- 4、查询2021年9月使用安卓且app版本为7.7.0以上的登录设备在第3天的留存率和次月留存率
