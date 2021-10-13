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
TO_DATE()

TO_CHAR()
