-- Task D.1 For a given country (e.g., Afghanistan), list the total number of vaccines administered in
-- each observation date recorded in the dataset from the first observation until the end of June 2021.
-- For the example of Afghanistan, each column in the expected result set will have the following
-- structure.

select l.location as Country, lv.last_observation_date as "Observation Date" , count(lv.vaccine_type) as "Administered Vaccine"
from locations l join location_vaccines lv on l.location=lv.location
group by l.location, lv.last_observation_date;


--Task D.2 Produces a result set containing cumulative number of COVID-19 doses administered by
--each country. That is, the name of each country and the cumulative number of doses administered
--in that country. Each column in the expected result set will have the following structure.

select location as Country, sum(total_vaccinations) as "Cumulative Doses"
from vaccinations_by_manufacturer
group by location;

--Task D.3 Produce a list of all countries with the type of vaccines (e.g., Oxford/AstraZeneca,
--Pfizer/BioNTech) administered in each country. For a country that has administered several types of
--vaccine, the result set is required to show several tuples reporting each type of vaccine in a separate
--tuple.

select location as Country, vaccine as "Vaccine Type"
from vaccinations_by_manufacturer;

--Task D.4 There are different sources of data used to produce the data set. Produce a report showing
--the total number of vaccines administered according to each data source. Order the result set by the
--total number of administered vaccines.
--Source Name Total Administered Vaccines Source URL

select lv.source_name as "Source Name", count(lv.vaccine_type) as "Total Administered Vaccines", lv.source_website as "Source URL"
from location_vaccines lv
group by lv.source_name, lv.source_website;


--Task D.5 How does various countries compare in the speed of their vaccine administration? Produce
--a report that lists all the observation dates and, for each date, list the total number of people fully
--vaccinated in each one of the 4 countries used in this assignment.

select cv.date, case when cv.location='Australia' then sum(cv.people_fully_vaccinated) end as "Australia",
case when cv.location='United States' then sum(cv.people_fully_vaccinated) end as "United States",
case when cv.location='France' then sum(cv.people_fully_vaccinated) end as "France",
case when cv.location='Israel' then sum(cv.people_fully_vaccinated) end as "Israel"
from country_vaccination cv
group by cv.date;
