
create table sex_dim
as
select distinct "SEX" as SexId,
case when "SEX" ='U' then 'Unknown'
when "SEX"='M' then 'Male' when "SEX"='F' then 'Female' end as SexDesc
from vaers_data;


create table age_group_dim
as
select distinct
case when "AGE_YRS"<=6 then '(0,6]'
when "AGE_YRS">6 and "AGE_YRS"<=17 then '(6,17]'
when "AGE_YRS">17 and "AGE_YRS"<=35 then '(17,35]'
when "AGE_YRS">35 and "AGE_YRS"<=60 then '(35,60]'
when "AGE_YRS">60 then '(60,)'
else 'unknown age' end as age_range,
case when "AGE_YRS"<=6 then 'child' when "AGE_YRS">6 and "AGE_YRS"<=17 then 'teenager'
when "AGE_YRS">17 and "AGE_YRS"<=35 then 'youth'
when "AGE_YRS">35 and "AGE_YRS"<=60 then 'middle-aged'
when "AGE_YRS">60 then 'elderly'
else 'unknown age' end as age_group_desc
from vaers_data;


create table symptom_dim
as
select distinct "SYMPTOM1" as symptom_name
from vaers_symptoms where "SYMPTOM1" is not null

union
select distinct "SYMPTOM2" as symptom_name
from vaers_symptoms  where "SYMPTOM2" is not null

union
select distinct "SYMPTOM3" as symptom_name
from vaers_symptoms  where "SYMPTOM3" is not null

union
select distinct "SYMPTOM4" as symptom_name
from vaers_symptoms  where "SYMPTOM4" is not null
union
select distinct "SYMPTOM5" as symptom_name
from vaers_symptoms  where "SYMPTOM5" is not null
;


create table vax_dim
as
select distinct "VAX_TYPE" as VaxType,"VAX_NAME" as VaxName, "VAX_MANU" as VaxManu,
"VAX_DOSE_SERIES" as VaxDoseSeries, "VAX_LOT" as VaxLot
from vaers_vax;




=====

create table sex_dim
as
select distinct "SEX" as SexId,
case when "SEX" ='U' then 'Unknown'
when "SEX"='M' then 'Male' when "SEX"='F' then 'Female' end as SexDesc
from vaers_data;

drop table if exists age_group_dim;
create table age_group_dim
(
AgeGroupId serial primary key,
AgeRange text,
AgeGroupDesc text
);

insert into age_group_dim(AgeRange,AgeGroupDesc)
select distinct
case when "AGE_YRS"<=6 then '(0,6]'
when "AGE_YRS">6 and "AGE_YRS"<=17 then '(6,17]'
when "AGE_YRS">17 and "AGE_YRS"<=35 then '(17,35]'
when "AGE_YRS">35 and "AGE_YRS"<=60 then '(35,60]'
when "AGE_YRS">60 then '(60,)'
else 'unknown age' end as age_range,
case when "AGE_YRS"<=6 then 'child' when "AGE_YRS">6 and "AGE_YRS"<=17 then 'teenager'
when "AGE_YRS">17 and "AGE_YRS"<=35 then 'youth'
when "AGE_YRS">35 and "AGE_YRS"<=60 then 'middle-aged'
when "AGE_YRS">60 then 'elderly'
else 'unknown age' end as age_group_desc
from vaers_data;


create table symptom_dim(
SymptomId serial primary key,
SymptomName text
);

insert into symptom_dim(SymptomName)
select distinct "SYMPTOM1" as symptom_name
from vaers_symptoms where "SYMPTOM1" is not null

union
select distinct "SYMPTOM2" as symptom_name
from vaers_symptoms  where "SYMPTOM2" is not null

union
select distinct "SYMPTOM3" as symptom_name
from vaers_symptoms  where "SYMPTOM3" is not null

union
select distinct "SYMPTOM4" as symptom_name
from vaers_symptoms  where "SYMPTOM4" is not null
union
select distinct "SYMPTOM5" as symptom_name
from vaers_symptoms  where "SYMPTOM5" is not null
;


create table vax_dim(
VaxId serial primary key,
VaxType text,
VaxName text,
VaxManu text
);

insert into vax_dim (
VaxType,
VaxName,
VaxManu
)
select distinct "VAX_TYPE" as VaxType,"VAX_NAME" as VaxName, "VAX_MANU" as VaxManu
from vaers_vax;



create table time_dim
as

select distinct to_char("RECVDATE",'YYYY-MM-DD') as TimeID,extract(year from "RECVDATE") as Year, extract(month from "RECVDATE") as Month,
extract(day from "RECVDATE") as Day
from vaers_data where "RECVDATE" is not null
union
select distinct to_char("VAX_DATE",'YYYY-MM-DD') as TimeID,extract(year from "VAX_DATE") as Year, extract(month from "VAX_DATE") as Month,
extract(day from "VAX_DATE") as Day
from vaers_data where "VAX_DATE" is not null

union
select distinct to_char("ONSET_DATE",'YYYY-MM-DD') as TimeID,extract(year from "ONSET_DATE") as Year, extract(month from "ONSET_DATE") as Month,
extract(day from "ONSET_DATE") as Day
from vaers_data where "ONSET_DATE" is not null

union
select distinct to_char("TODAYS_DATE",'YYYY-MM-DD') as TimeID,extract(year from "TODAYS_DATE") as Year, extract(month from "TODAYS_DATE") as Month,
extract(day from "TODAYS_DATE") as Day
from vaers_data where "TODAYS_DATE" is not null
;

create table address_dim
as
select distinct case when "STATE" is not null then "STATE" else 'U' end as StateId,
case when "STATE" is not null then "STATE" else 'Unknown' end as State
from vaers_data;


--create table vaers_dim
--as
--select distinct "DIED", "RECOVD","L_THREAT","DISABLE"
--from vaers_data;

create table vaers_dim
(
VearsStateId serial primary key,
Died text,
Recovered text,
LifeThreat text,
Disable text
);

insert into vaers_dim(Died, Recovered,LifeThreat, Disable)
select distinct "DIED", "RECOVD","L_THREAT","DISABLE"
from vaers_data;



create table vaers_fact
as
select to_char("ONSET_DATE",'YYYY-MM-DD') as TimeId,
sd.symptomid,
vd."SEX" as SexId,
case when "AGE_YRS"<=6 then 'CH'
when "AGE_YRS">6 and "AGE_YRS"<=17 then 'TE'
when "AGE_YRS">17 and "AGE_YRS"<=35 then 'YO'
when "AGE_YRS">35 and "AGE_YRS"<=60 then 'MI'
when "AGE_YRS">60 then 'EL'
else 'UN' end as agegroupid,
vad.vaxid,
vd."STATE" as StateId,
vasd.VearsStateId,
count(vd."VAERS_ID") as totalnumber,
min(vd."NUMDAYS") as MinOnsetDay,
max(vd."NUMDAYS") as MaxOnsetDay

from vaers_data vd
join vaers_symptoms vs on vd."VAERS_ID"=vs."VAERS_ID"
join symptom_dim sd on sd.symptomname=vs."SYMPTOM1" or sd.symptomname=vs."SYMPTOM2" or sd.symptomname=vs."SYMPTOM3"
or sd.symptomname=vs."SYMPTOM4" or sd.symptomname=vs."SYMPTOM5"
join vaers_vax vv on vv."VAERS_ID"=vd."VAERS_ID"
join vax_dim vad on vad.vaxtype=vv."VAX_TYPE"
join vaers_dim vasd on vasd.died=vd."DIED" and vasd."disable"=vd."DISABLE" and vasd.lifethreat=vd."L_THREAT"
and vasd.recovered=vd."RECOVD"
group by
to_char("ONSET_DATE",'YYYY-MM-DD') ,
sd.symptomid,
vd."SEX",
case when "AGE_YRS"<=6 then 'CH'
when "AGE_YRS">6 and "AGE_YRS"<=17 then 'TE'
when "AGE_YRS">17 and "AGE_YRS"<=35 then 'YO'
when "AGE_YRS">35 and "AGE_YRS"<=60 then 'MI'
when "AGE_YRS">60 then 'EL'
else 'UN' end,
vad.vaxid,
vd."STATE",
vasd.vearsstateid;

select agd.agegroupdesc, sd.symptomname,  sum(vf.totalnumber) as total_number
from vaers_fact vf
join symptom_dim sd on sd.symptomid=vf.symptomid
join age_group_dim agd on agd.agegroupid=vf.agegroupid
join vax_dim vd on vd.vaxid=vf.vaxid
where vd.vaxtype='COVID19'
group by agd.agegroupdesc, sd.symptomname
order by total_number desc limit 5;


select 'most' as vaers, vaxmanu,symptomname, total_number
from
(
select vd.vaxmanu, sd.symptomname,  sum(vf.totalnumber) as total_number, dense_rank() over(order by sum(vf.totalnumber) desc) as rank
from vaers_fact vf
join symptom_dim sd on sd.symptomid=vf.symptomid
join vax_dim vd on vd.vaxid=vf.vaxid
where vd.vaxtype='COVID19'
group by vd.vaxmanu, sd.symptomname
) t1 where rank=1
union
select 'least' as vaers, vaxmanu, symptomname, total_number
from
(
select vd.vaxmanu, sd.symptomname,  sum(vf.totalnumber) as total_number,dense_rank() over(order by sum(vf.totalnumber)) as rank
from vaers_fact vf
join symptom_dim sd on sd.symptomid=vf.symptomid
join vax_dim vd on vd.vaxid=vf.vaxid
where vd.vaxtype='COVID19'
group by vd.vaxmanu, sd.symptomname
) t2
where rank=1 order by total_number desc;



select t2.state, round(t1.died_number *100/t2.total_number,2) ||'%' as died_percent
from
(

select ad.state, sum(vf.totalnumber) as died_number
from vaers_fact vf
join address_dim ad on ad.stateid=vf.stateid
join vaers_dim vd on vd.vearsstateid=vf.vearsstateid
join vax_dim vad on vad.vaxid=vf.vaxid
where vd.died='Y' and vad.vaxtype='COVID19'
group by ad.state
) t1 join
(
select ad.state,  sum(vf.totalnumber) as total_number
from vaers_fact vf
join address_dim ad on ad.stateid=vf.stateid
join vax_dim vad on vad.vaxid=vf.vaxid
where vad.vaxtype='COVID19'
group by ad.state
) t2 on t1.state=t2.state;


select t2.agegroupdesc, t2.sexdesc, round(t1.recovered_number *100/t2.total_number,2) ||'%' as died_percent
from
(
select agd.agegroupdesc,sd.sexdesc, sum(vf.totalnumber) as recovered_number
from vaers_fact vf
join age_group_dim agd on agd.agegroupid=vf.agegroupid
join sex_dim sd on sd.sexid=vf.sexid
join vaers_dim vd on vd.vearsstateid=vf.vearsstateid
join vax_dim vad on vad.vaxid=vf.vaxid
where vd.recovered='Y' and vad.vaxtype='COVID19'
group by agd.agegroupdesc,sd.sexdesc
) t1
join
(
select agd.agegroupdesc,sd.sexdesc, sum(vf.totalnumber) as total_number
from vaers_fact vf
join age_group_dim agd on agd.agegroupid=vf.agegroupid
join sex_dim sd on sd.sexid=vf.sexid
join vaers_dim vd on vd.vearsstateid=vf.vearsstateid
join vax_dim vad on vad.vaxid=vf.vaxid
where vad.vaxtype='COVID19'
group by agd.agegroupdesc,sd.sexdesc
) t2 on t1.agegroupdesc=t2.agegroupdesc and t1.sexdesc=t2.sexdesc
