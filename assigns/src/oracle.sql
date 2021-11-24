# https://livesql.oracle.com/apex/
/**
aaagogool@gmail.com
Aaa-123456
https://livesql.oracle.com/
*/

-- 修改表结构语法
alter table table_name add (column_name varchar2(10));

ALTER TABLE table_name MODIFY column_name VARCHAR2(100);

ALTER TABLE table_name DROP COLUMN column_name;
-- 删除表
DROP TABLE table_name cascade constraints;


-- 常用日期函数

-- 获取当前日期
select sysdate from dual;


select TO_NUMBER(TO_DATE('2018-6-5','yyyy-mm-dd hh24:mi:ss')- TO_DATE('2018-5-31','yyyy-mm-dd hh24:mi:ss'))
AS 相差天数 from dual;

--Oracle中两个日期相差小时数--
select TO_NUMBER((TO_DATE('2018-6-5','yyyy-mm-dd hh24:mi:ss')- TO_DATE('2018-5-31','yyyy-mm-dd hh24:mi:ss'))*24)
AS 相差小时数 from dual;

--Oracle中两个日期相差分钟数--
select TO_NUMBER((TO_DATE('2018-6-5','yyyy-mm-dd hh24:mi:ss')- TO_DATE('2018-5-31','yyyy-mm-dd hh24:mi:ss'))*24*60)
AS 相差分钟数 from dual;

--Oracle中两个日期相差秒数--
select TO_NUMBER((TO_DATE('2018-6-5','yyyy-mm-dd hh24:mi:ss')- TO_DATE('2018-5-31','yyyy-mm-dd hh24:mi:ss'))*24*60*60)
AS 相差秒数 from dual;
--oracle两个日期的相差月数--
--1）月份都是最后一天，A日期 > B日期 ,返回整数 ---
select months_between(TO_DATE('2018-6-30','yyyy-mm-dd hh24:mi:ss'),TO_DATE('2018-5-31','yyyy-mm-dd hh24:mi:ss'))
As 相差月份1 from dual;

--2）月份都是最后一天，B日期 > A日期 ,返回负数 ---
select months_between(TO_DATE('2018-4-30','yyyy-mm-dd hh24:mi:ss'),TO_DATE('2018-5-31','yyyy-mm-dd hh24:mi:ss'))
As 相差月份2 from dual;

--3）月份天数不一样，A日期 > B日期 ,返回带小数的数字---
select months_between(TO_DATE('2018-6-25','yyyy-mm-dd hh24:mi:ss'),TO_DATE('2018-5-31','yyyy-mm-dd hh24:mi:ss'))
As 相差月份3 from dual;

--oracle两个日期的相差年份--
select ((months_between(TO_DATE('2018-5-31','yyyy-mm-dd hh24:mi:ss'),TO_DATE('2016-9-30','yyyy-mm-dd hh24:mi:ss')))/12)
As 相差年份 from dual;

TO_DATE()

TO_CHAR()



create sequence SEQ_LOG_ID
minvalue 1  --增长最小值
maxvalue 9999999999  --增长最大值,也可以设置NOMAXvalue -- 不设置最大值
start with 101  --从101开始计数
increment by 1  --自增步长为1
cache 50  --设置缓存cache个序列，如果系统down掉了或者其它情况将会导致序列不连续，也可以设置为---NOCACHE防止跳号
cycle;  --循环,当达到最大值时,不是从start with设置的值开始循环。而是从1开始循环

---PL/SQL---
/**
PL/SQL is block-structured, where a block consists of:
DECLARE (optional)
   declarations for constants, variables and local procedures
BEGIN  (Mandatory)
    PL/SQL and SQL statements ;
   EXCEPTION (Optional)
	--Action to be performed when an error occur
END; (Mandatory)
/
Notation
“/” – executes the SQL, PL/SQL stored statement in buffer
“;” ends a SQL, PL/SQL statement
Printing strings to STDOUT in PL/SQL:
set serveroutput on
exec dbms_output.put_line(‘Hello’);
*/