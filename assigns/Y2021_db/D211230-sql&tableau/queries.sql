
-- import data from excel

-- check if there are duplicated rows

SELECT "Organization Name",
"Organization Name URL",
"Headquarters Location",
"Industries",
"Last Funding Type",
"Last Funding Date",
"Last Funding Amount",
"Last Funding Amount Currency",
"Last Funding Amount Currency (in USD)",
"Number of Employees",
"Total Funding Amount",
"Total Funding Amount Currency",
"Total Funding Amount Currency (in USD)",
"Number of Funding Rounds",
"Acquisition Status",
"Acquired by",
"Acquired by URL",
"Number of Acquisitions",
"Acquisition Price Currency (in USD)",
"Number of Founders",
"Acquisition Price",
"Price Currency",
"Company Type",
"Founded Date",
"Twitter",
"Facebook",
"LinkedIn",
"Funding Status",
"Acquisition Type",
"Announced Date",
"Estimated Revenue Range", count(1) FROM dataset
group by
"Organization Name",
"Organization Name URL",
"Headquarters Location",
"Industries",
"Last Funding Type",
"Last Funding Date",
"Last Funding Amount",
"Last Funding Amount Currency",
"Last Funding Amount Currency (in USD)",
"Number of Employees",
"Total Funding Amount",
"Total Funding Amount Currency",
"Total Funding Amount Currency (in USD)",
"Number of Funding Rounds",
"Acquisition Status",
"Acquired by",
"Acquired by URL",
"Number of Acquisitions",
"Acquisition Price Currency (in USD)",
"Number of Founders",
"Acquisition Price",
"Price Currency",
"Company Type",
"Founded Date",
"Twitter",
"Facebook",
"LinkedIn",
"Funding Status",
"Acquisition Type",
"Announced Date",
"Estimated Revenue Range";

-- cleaning dataset
delete from dataset
where "Company Type" is null
or "Number of Employees" is null
or "Number of Founders" is null
or "Number of Funding Rounds" is null
or "Total Funding Amount Currency (in USD)" is null;



 -- step2: here I define "For Profit" of company type is success.

select distinct "Company Type" from dataset;
/*

Non-profit
For Profit
*/

-- step3: queries about number of employees, number of founders, number of founding rounds and total funding amount which is more relates to startup's success.

select "Company Type", "Number of Employees", count(*)
from dataset
where "Company Type" is not null and "Number of Employees" is not null
group by "Company Type", "Number of Employees"
;


select "Company Type", "Number of Founders", count(*)
from dataset
where "Company Type" is not null and "Number of Founders" is not null
group by "Company Type", "Number of Founders"
;

select "Company Type", "Number of Funding Rounds", count(*)
from dataset
where "Company Type" is not null and "Number of Funding Rounds" is not null
group by "Company Type", "Number of Funding Rounds"
;



select "Company Type",
case when "Total Funding Amount Currency (in USD)"<10000 then 'less than 10000'
when "Total Funding Amount Currency (in USD)">10000 and "Total Funding Amount Currency (in USD)"<100000 then 'between 10000 to 10000'
when "Total Funding Amount Currency (in USD)">=100000 and "Total Funding Amount Currency (in USD)"<1000000 then 'between 100000 to 1000000'
else 'more than 1000000' end as "Total Founding Amount", count(*)
from dataset
where "Company Type" is not null and "Total Funding Amount Currency (in USD)" is not null
group by "Company Type",
case when "Total Funding Amount Currency (in USD)"<10000 then 'less than 10000'
when "Total Funding Amount Currency (in USD)">10000 and "Total Funding Amount Currency (in USD)"<100000 then 'between 10000 to 10000'
when "Total Funding Amount Currency (in USD)">=100000 and "Total Funding Amount Currency (in USD)"<1000000 then 'between 100000 to 1000000'
else 'more than 1000000' end
;

/*
from the query result and data visualization, it can know when number of employees is 11-50, which is the most success startups.
from the query result and data visualization, it can know when number of founders is 2, which is the most success startups.
from the query result and data visualization, it can know when number of founding rounds is 2, which is the most success startups.
from the query result and data visualization, it can know when total funding amount is more than 1000000, which is the most success startups.
*/