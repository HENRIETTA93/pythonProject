
-- 常用日期函数

--# 获取年、月、日
EXTRACT(field from interval)
date_part(text, timestamptz)

extract(year from _date)
date_part('year', _date)

select extract(year from now());
select extract(month from now());
select date_part('day', now());

--# 计算日期差
