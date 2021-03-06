\COPY tablename FROM filename CSV [HEADER] [NULL '…']

-- 查询数据库的修改时间
SELECT (pg_stat_file('base/'||oid ||'/PG_VERSION')).modification, datname FROM pg_database;

-- arrary_length, regexp_split_to_arrays
select array_length(regexp_split_to_array('hhhhhhhhhh123h12h22h2h3hh3','2h'),1)-1;
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



###### trigger #####
CREATE TRIGGER TriggerName
{AFTER|BEFORE}  Event1 [OR Event2 ...]
ON TableName
[ WHEN ( Condition ) ]
FOR EACH {ROW|STATEMENT}
EXECUTE PROCEDURE FunctionName(args...);