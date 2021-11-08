##################################################
### Put your queries in this file and resubmit ###
##################################################

### PART 1 Cleaning Data ###

# 1.) Run messydata.sql. Check if there are any duplicate columns with the same name. 
# Remove any duplicate columns using Alter Table.
alter table dataset drop column concode;
alter table dataset drop column CountryCode;

# 2.) Convert the single table into Relational Tables.

	create table Cities
	as
	select distinct ID, name_city, District, Population, Code as CountryCode
	from dataset;

	create table Countries
	as
	select distinct Code,Code2, name_country, Continent, Region, SurfaceArea,
	IndepYear, population_country, LifeExpectancy, GNP, GNPOld, LocalName, GovernmentForm,
	HeadOfState, Capital
	from dataset;

	create table Languages
	as
	select distinct Code as CountryCode, Language, IsOfficial, Percentage
	from dataset;

# 3.) Add unique primary keys in each table.


	alter table Cities
	add constraint cities_pk primary key (ID);

	alter table Countries
	add constraint countries_pk primary key (Code);

	alter table Languages
	add constraint languages_pk primary key (CountryCode, Language);

# 4.) Add foreign keys to each table.

	alter table Cities
	add constraint cities_countrycode_fk foreign key (CountryCode) references Countries(Code);

	alter table Countries
	add constraint countries_capital_fk foreign key (Capital) references Cities(ID);

	alter table Languages
	add constraint languages_countrycode_fk foreign key (CountryCode) references Countries(Code);

# 5.) Reverse engineer a schema and create relations in the editor. Export and upload


### Part 2 Procedures, Views and Functions ###

# 1.) Create a procedure that, given a three didgit country code, returns the percent 
# change in GDPin the string format "3.14%". If there is a NULL value return "Not Enough Data".
# Call the function with an example.

# 2.) Create a function that uses the above procedure. Select a table with the associated percent 
# change in GDP as a new column for each country code

# 3.) Save the table from Question 2 as a view.

# 4.) Expanding on the view from 3, add another column that is the average population 
# of the cities within a country.

# 5.) Full join all of your tables and return cities that that start with the first 
# letter of your first name and end with the last letter of your last name.


# 1.) Create a procedure that, given a three didgit country code, returns the percent
# change in GDPin the string format "3.14%". If there is a NULL value return "Not Enough Data".
# Call the function with an example.
drop procedure if exists pro_gdp_percent;
delimiter ||
create procedure pro_gdp_percent(in c_code varchar(3), out GDP_change varchar(20))
begin
set GDP_change=(select concat(round((GNP-GNPOld)/GNPOld*100,2),'%') from Countries where Code=c_code);
if GDP_change is null then
set GDP_change='Not Enough Data';
select GDP_change;
end if;
end||
delimiter ;
## call the procedure with example
set @gdp_change=null;
call pro_gdp_percent('CHN', @gdp_change);
select @gdp_change;


# 2.) Create a function that uses the above procedure. Select a table with the associated percent
# change in GDP as a new column for each country code


delimiter ||
create function fn_gdp_percent(c_code varchar(3))
returns varchar(20)
begin
declare gdp_change varchar(20);
select concat(round((GNP-GNPOld)/GNPOld*100,2),'%') into gdp_change from Countries where Code=c_code;
return gdp_change;
end||
delimiter ;

-- alter table Countries drop column GDP_change;
alter table Countries add column GDP_change varchar(20);

set @code='CHN';
update Countries set GDP_change=(select fn_gdp_percent(@code)) where Code=@code;

set @code='ABW';
update Countries set GDP_change=(select fn_gdp_percent(@code)) where Code=@code;
-- so on

# 3.) Save the table from Question 2 as a view.


create view vw_gdp_change
as
select Code,GDP_change
from Countries;




# 4.) Expanding on the view from 3, add another column that is the average population
# of the cities within a country.

create view vw_4
as
select Code, GDP_change, population_country/count(Cities.ID) as avg_population
from Countries join Cities on Cities.CountryCode=Countries.Code
group by Code;

# 5.) Full join all of your tables and return cities that that start with the first
# letter of your first name and end with the last letter of your last name.

	select Cities.*
	from Cities join Countries on Cities.CountryCode=Countries.Code
  join Languages on Languages.CountryCode=Countries.Code
	where lower(Cities.name_city) like 'g%' and lower(Cities.name_city) like '%u';

