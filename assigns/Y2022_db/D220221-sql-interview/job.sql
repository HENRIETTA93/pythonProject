/*
 Navicat Premium Data Transfer

 Source Server         : local_5433_pgsql12.4
 Source Server Type    : PostgreSQL
 Source Server Version : 120004
 Source Host           : localhost:5433
 Source Catalog        : final_proj
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 120004
 File Encoding         : 65001

 Date: 21/02/2022 12:51:22
*/


-- ----------------------------
-- Table structure for job
-- ----------------------------
DROP TABLE IF EXISTS "public"."job";
CREATE TABLE "public"."job" (
  "Person ID" text COLLATE "pg_catalog"."default",
  "Person Name" text COLLATE "pg_catalog"."default",
  "Job Title" text COLLATE "pg_catalog"."default",
  "Company ID" text COLLATE "pg_catalog"."default",
  "Start Date" date,
  "End Date" date
)
;

-- ----------------------------
-- Records of job
-- ----------------------------
INSERT INTO "public"."job" VALUES ('Asdf5kjasdkfa2sd', 'Eric Aleman', 'Direct of Product ', 'peopledatalabs', '2021-01-18', NULL);
INSERT INTO "public"."job" VALUES ('d908u23nf9239g', 'Ben Eisenberg', 'Direct of Product', 'peopledatalabs', '2017-06-06', NULL);
INSERT INTO "public"."job" VALUES ('3jkbgd983jskksd', 'Varun Villait', 'Chief Product Officer', 'peopledatalabs', '2021-08-01', NULL);
INSERT INTO "public"."job" VALUES ('kj2n3r90vur2oj34', 'Victoria Boyd', 'Chief of Staff', 'peopledatalabs', '2022-01-18', NULL);
INSERT INTO "public"."job" VALUES ('3jkbgd983jskksd', 'Varun Villait', 'VP of Product', 'peopledatalabs', '2020-09-15', '2021-08-01');




--
select "Company ID", extract(year from "Start Date")||'-'||extract(month from "Start Date")||'-01' as Month,
count(distinct "Person ID") as headcount
from job
where extract(year from "Start Date")>2000
and "End Date" is null
group by "Company ID", extract(year from "Start Date")||'-'||extract(month from "Start Date")||'-01';

• Suppose your query is timing out. What might be causing this?
数据量巨大可能导致了查询超时，可以考虑在company id 和角色开始日期建立索引 提高查询效率
• What are edge cases that might cause slight inaccuracies in your query?
时间上的角色重叠可能导致轻微不准确， 这里通过计算一个person id 只计算一次来避免
-- 参考背景信息：there can also be overlap in date ranges for a single person in two roles at the company


-- query


create or replace view v1
as
with tmp as
(
select tt.month, tt1."Company ID", tt1.headcount
from
(
select t1."year"||'-'||t2.month as month
from
(
select generate_series "year" from generate_series(2000, (select extract(year from now()))::integer)
) t1
,
(
select '01-01' as month
union
select '02-01' as month
union
select '03-01' as month
union
select '04-01' as month
union
select '05-01' as month
union
select '06-01' as month
union
select '07-01' as month
union
select '08-01' as month
union
select '09-01' as month
union
select '10-01' as month
union
select '11-01' as month
union
select '12-01' as month
order by month
) t2
) tt left join
(
select "Company ID", extract(year from "Start Date")||'-'||to_char("Start Date",'MM')||'-01' as Month,
count(distinct "Person ID") as headcount
from job
where extract(year from "Start Date")>=2000
and "End Date" is null
group by "Company ID", extract(year from "Start Date")||'-'||to_char("Start Date",'MM')||'-01'
) tt1 on tt1.month=tt.month
)
select t2.month, t2."Company ID", t2.headcount,
(
select max(t1.month)
from tmp t1 where t1.month<t2.month and t1.headcount is not null
) as month2
from tmp t2;



select v1.month, v2."Company ID", v2.headcount
from v1 left join v1 v2 on v1.month2=v2.month
where to_date(v1.month,'YYYY-MM-DD')<=now();


===v3


create or replace view v1
as
with tmp as
(
select tt.month, tt1."Company ID", tt1.headcount
from
(
select t1."year"||'-'||t2.month as month
from
(
select generate_series "year" from generate_series(2000, (select extract(year from now()))::integer)
) t1
,
(
select '01-01' as month
union
select '02-01' as month
union
select '03-01' as month
union
select '04-01' as month
union
select '05-01' as month
union
select '06-01' as month
union
select '07-01' as month
union
select '08-01' as month
union
select '09-01' as month
union
select '10-01' as month
union
select '11-01' as month
union
select '12-01' as month
order by month
) t2
) tt left join
(
select "Company ID", extract(year from "Start Date")||'-'||to_char("Start Date",'MM')||'-01' as Month,
count( distinct "Person ID") as headcount
from job
where extract(year from "Start Date")>=2000
and
"End Date" is null
or "Start Date">=
 to_date(extract(year from "Start Date")||'-'||to_char("Start Date",'MM')||'-01','YYYY-MM-DD')
  and  to_date(extract(year from "Start Date")||'-'||to_char("Start Date",'MM')||'-01','YYYY-MM-DD') <="End Date"
group by "Company ID", extract(year from "Start Date")||'-'||to_char("Start Date",'MM')||'-01'
) tt1 on tt1.month=tt.month
)
select t2.month, t2."Company ID", t2.headcount,
(
select max(t1.month)
from tmp t1 where t1.month<t2.month and t1.headcount is not null
) as month2
from tmp t2;



select v1.month, v2."Company ID", v2.headcount
from v1 left join v1 v2 on v1.month2=v2.month
where to_date(v1.month,'YYYY-MM-DD')<=now();


----------updated at 20220222

create or replace view v1
as
with tmp as
(
select tt.month, tt1."Company ID", tt1.headcount
from
(
select t1."year"||'-'||t2.month as month
from
(
select generate_series "year" from generate_series(2000, (select extract(year from now()))::integer)
) t1
,
(
select '01-01' as month
union
select '02-01' as month
union
select '03-01' as month
union
select '04-01' as month
union
select '05-01' as month
union
select '06-01' as month
union
select '07-01' as month
union
select '08-01' as month
union
select '09-01' as month
union
select '10-01' as month
union
select '11-01' as month
union
select '12-01' as month
order by month
) t2
) tt left join
(
select t1."Company ID", t1.month, case when  t2.headcount  is null then t1.headcount else t1.headcount-t2.headcount end as headcount
from
(

select "Company ID", month,
-- sum(counts),
-- sum(case when "End Date" is not null then 1 else 0 end) as go_counts,
 sum(sum(counts)) over(order by month rows unbounded preceding) as headcount
from
(
select "Company ID", date_part('year',"Start Date")||'-'||to_char("Start Date",'MM')||'-01' as month, "End Date", count("Person ID") as counts
from job
-- where "End Date" is null
group by "Company ID", date_part('year',"Start Date")||'-'||to_char("Start Date",'MM')||'-01', "End Date"
) t
group by "Company ID", month

) t1
full join
(
select "Company ID", month,
-- sum(case when "End Date" is not null then 1 else 0 end) as go_counts,
 sum(sum(counts)) over(order by month rows unbounded preceding) as headcount
from
(
select "Company ID", date_part('year',"End Date")||'-'||to_char("End Date",'MM')||'-01' as month,  count("Person ID") as counts
from job
where "End Date" is not null
group by "Company ID", date_part('year',"End Date")||'-'||to_char("End Date",'MM')||'-01'
) t
group by "Company ID", month
) t2 on t1."Company ID"=t2."Company ID" and t1.month>=t2.month


) tt1 on tt1.month=tt.month
)
select t2.month, t2."Company ID", t2.headcount,
(
select max(t1.month)
from tmp t1 where t1.month<t2.month and t1.headcount is not null
) as month2
from tmp t2;

select v1.month, v2."Company ID", v2.headcount
from v1 left join v1 v2 on v1.month2=v2.month
where to_date(v1.month,'YYYY-MM-DD')<=now();