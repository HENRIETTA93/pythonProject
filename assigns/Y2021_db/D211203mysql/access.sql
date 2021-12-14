
4. corona death - death - foot note-> 死亡数量较多的地区是one more。 -> 整体上有很多地区都无法确认，整体的死亡率太少，无法确认
5.state - corona death -> 大有名气的几个城市选址 -> 因新冠疫情死亡的大城市因新冠疫情死亡较多

7.state - death-> county 分为不同类型，用state来拯救总死亡人数
8.state - death-> 按西部、北部、东部、南部地区划分state，按地区位置寻找新冠病毒死亡人数
9.urban rural code - death
10. 签署州，rural code-> 哪个地区更发达的城市更多
11. location - death-> 地区死亡人数哪个地区更多

15. 连接地区，rural code-> 确认西部，北部，南部，东部各地区的发展程度->
8. 确认与地区死亡人数相关的医疗体系确立程度，规制是否完善

一个11. location - death-> 地区死亡人数哪个地区更多这个嘛

-- 4 第四题是统计死亡人数最多的城市
select place.[State]
from place, death
where place.[FIPS County Code]=death.[FIPS County Code]
group by place.[State]
having sum(death.[Deaths involving COVID-19]) = (select max(total_covids) from (select place.[State], sum(death.[Deaths involving COVID-19]) as total_covids
from place , death where place.[FIPS County Code]=death.[FIPS County Code]
group by place.[State]) t);



-- 1. 这步是分组统计出每个county 的总的死亡人数是多少
select place.[County name], sum(death.[Deaths involving COVID-19]) as total_covids
from place , death where place.[FIPS County Code]=death.[FIPS County Code]
group by place.[County name]


-- 2 这步是查出最多的死亡人数
select max(total_covids) from (select place.[County name], sum(death.[Deaths involving COVID-19]) as total_covids
from place , death where place.[FIPS County Code]=death.[FIPS County Code]
group by place.[County name]
) t

-- 3. 整个sql 是分组查出county 的死亡人数等于最多的死亡人数的county

select place.[County name]
from place, death
where place.[FIPS County Code]=death.[FIPS County Code]
group by place.[County name]
having sum(death.[Deaths involving COVID-19]) = (select max(total_covids) from (select place.[County name], sum(death.[Deaths involving COVID-19]) as total_covids
from place , death where place.[FIPS County Code]=death.[FIPS County Code]
group by place.[County name]
) t);
-- 5
select place.[State], sum(death.[Deaths involving COVID-19])
from place , death where place.[FIPS County Code]=death.[FIPS County Code]
group by place.[State];


-- 7
select place.State,place.[County name], sum(death.[Deaths from All Causes])
from place, death where place.[FIPS County Code]=death.[FIPS County Code]
group by place.State,place.[County name];


-- 9
select place.[Urban Rural Code], sum(death.[Deaths involving COVID-19]),sum(death.[Deaths from All Causes])
from place , death where place.[FIPS County Code]=death.[FIPS County Code]
group by place.[Urban Rural Code];


-- 8.state - death-> 按西部、北部、东部、南部地区划分state，按地区位置寻找新冠病毒死亡人数
select place.[Location],place.[State], sum(death.[Deaths involving COVID-19])
from place , death where place.[FIPS County Code]=death.[FIPS County Code]
group by place.[Location],place.[State];




--10. 签署州，rural code-> 哪个地区更发达的城市更多
select place.[State], place.[Urban Rural Code], count(place.[FIPS County Code])
from place
group by place.[State],place.[Urban Rural Code];

--11. location - death-> 地区死亡人数哪个地区更多
select place.[Location],sum(death.[Deaths from All Causes])
from place , death where place.[FIPS County Code]=death.[FIPS County Code]
group by place.[Location];

--15. 连接地区，rural code-> 确认西部，北部，南部，东部各地区的发展程度->
select place.[Location], place.[Urban Rural Code], count(place.[FIPS County Code])
from place
group by place.[Location],place.[Urban Rural Code];


select sum(death.[Deaths involving COVID-19])
from place , death where place.[FIPS County Code]=death.[FIPS County Code]
and place.[County name]='Seoul';


select place.[State], place.[County name]
from place , death, period where place.[FIPS County Code]=death.[FIPS County Code]
and period.ID=death.ID and period.[Date as of]='11/17/2021'
group by place.[State], place.[County name]
having sum(death.[Deaths involving COVID-19])>
(
select sum(death.[Deaths involving COVID-19])
from place , death, period where place.[FIPS County Code]=death.[FIPS County Code]
and period.ID=death.ID and period.[Date as of]='11/17/2021'
and place.[County name]='Seoul County');


-- 这步查出 county 是首尔的，且在2021年11月17日的死亡人数
select sum(death.[Deaths involving COVID-19])
from place , death, period where place.[FIPS County Code]=death.[FIPS County Code]
and period.ID=death.ID and period.[Date as of]='11/17/2021'
and place.[County name]='Seoul County'

-- 整个sql 对state，county 分组查 将满足在2021年11月17日的死亡人数比首尔多的 筛选出来
select place.[State], place.[County name]
from place , death, period where place.[FIPS County Code]=death.[FIPS County Code]
and period.ID=death.ID and period.[Date as of]='11/17/2021'
group by place.[State], place.[County name]
having sum(death.[Deaths involving COVID-19])>
(
select sum(death.[Deaths involving COVID-19])
from place , death, period where place.[FIPS County Code]=death.[FIPS County Code]
and period.ID=death.ID and period.[Date as of]='11/17/2021'
and place.[County name]='Seoul County');