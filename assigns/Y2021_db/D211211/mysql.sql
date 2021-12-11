/*
Senior Management is interested in a subset of this data, for only those PHAs that saw an increase in the $$ cost of performing an inspection in their jurisdiction. Since none of them are SQL programmers, they’ve asked your help in performing this analysis by providing a file as your final deliverable with the following columns:

Note that MR stands for “most recent”:

PHA_NAME,
MR_INSPECTION_DATE,
MR_INSPECTION_COST,
SECOND_MR_INSPECTION_DATE,
SECOND_MR_INSPECTION_COST,
CHANGE_IN_COST
PERCENT_CHANGE_IN_COST
Management has asked that you perform this function using lead or lag functions in SQL.

However, they’re concerned that the files when imported into MySQL Workbench may not properly refer to dates using the correct format. If that is the case, they’ve asked you to investigate how best to convert dates from TEXT to Date format so that the lead/lag functions work as expected.

They’ve also asked that you filter your dataset to only those PHAs that saw an increase in $$ cost, and that you only list the PHA once with no duplicates to avoid noisy data.

Naturally, this would also require you to filter out PHAs that only performed one inspection, so they’ve asked you to remove those as well.
*/




select * from public_housing_inspection_data;

select
PUBLIC_HOUSING_AGENCY_NAME,
COST_OF_INSPECTION_IN_DOLLARS,
INSPECTED_DEVELOPMENT_NAME,
INSPECTED_DEVELOPMENT_ADDRESS,
INSPECTED_DEVELOPMENT_CITY,
INSPECTED_DEVELOPMENT_STATE,
INSPECTION_DATE,
INSPECTION_SCORE
,count(
INSPECTION_ID) from public_housing_inspection_data
group by
PUBLIC_HOUSING_AGENCY_NAME,
COST_OF_INSPECTION_IN_DOLLARS,
INSPECTED_DEVELOPMENT_NAME,
INSPECTED_DEVELOPMENT_ADDRESS,
INSPECTED_DEVELOPMENT_CITY,
INSPECTED_DEVELOPMENT_STATE,
INSPECTION_DATE,
INSPECTION_SCORE
having count(INSPECTION_ID)>1;

select *
from
(
select PUBLIC_HOUSING_AGENCY_NAME as PHA_NAME, max(INSPECTION_DATE) as MR_INSPECTION_DATE  -- , COST_OF_INSPECTION_IN_DOLLARS
from
public_housing_inspection_data
group by PUBLIC_HOUSING_AGENCY_NAME
) t;


---- -======================



delete from
public_housing_inspection_data
where PUBLIC_HOUSING_AGENCY_NAME
in
(
select PUBLIC_HOUSING_AGENCY_NAME
from (
select
PUBLIC_HOUSING_AGENCY_NAME from public_housing_inspection_data
group by
PUBLIC_HOUSING_AGENCY_NAME
having count(INSPECTION_ID)=1) t);

update public_housing_inspection_data set INSPECTION_DATE=STR_TO_DATE(INSPECTION_DATE,'%m/%d/%Y');
alter table public_housing_inspection_data modify INSPECTION_DATE date;



select tt.PHA_NAME, tt.MR_INSPECTION_DATE,
p1.COST_OF_INSPECTION_IN_DOLLARS as MR_INSPECTION_COST,
tt.SECOND_MR_INSPECTION_DATE,
p2.COST_OF_INSPECTION_IN_DOLLARS as SECOND_MR_INSPECTION_COST,
p1.COST_OF_INSPECTION_IN_DOLLARS-p2.COST_OF_INSPECTION_IN_DOLLARS as CHANGE_IN_COST,
round((p1.COST_OF_INSPECTION_IN_DOLLARS-p2.COST_OF_INSPECTION_IN_DOLLARS)/p2.COST_OF_INSPECTION_IN_DOLLARS*100,2)  as PERCENT_CHANGE_IN_COST
from
(
select
t2.PHA_NAME, t2.MR_INSPECTION_DATE,
(
select max(INSPECTION_DATE)
from public_housing_inspection_data t1
where t1.INSPECTION_DATE<t2.MR_INSPECTION_DATE and t1.PUBLIC_HOUSING_AGENCY_NAME=t2.PHA_NAME
) as SECOND_MR_INSPECTION_DATE
from
(
select PUBLIC_HOUSING_AGENCY_NAME as PHA_NAME, max(INSPECTION_DATE) as MR_INSPECTION_DATE
from
public_housing_inspection_data
group by PUBLIC_HOUSING_AGENCY_NAME
) t2
) tt
join public_housing_inspection_data p1
on tt.MR_INSPECTION_DATE=p1.INSPECTION_DATE and tt.PHA_NAME=p1.PUBLIC_HOUSING_AGENCY_NAME
join public_housing_inspection_data p2
on tt.SECOND_MR_INSPECTION_DATE=p2.INSPECTION_DATE and tt.PHA_NAME=p2.PUBLIC_HOUSING_AGENCY_NAME;