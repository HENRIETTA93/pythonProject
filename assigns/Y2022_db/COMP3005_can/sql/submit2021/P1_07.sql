/*
Problem 1.7 Write an SQL query that will produce in one table a list of all the acceptable trunks that can be used to route a call to the 416 area code, office code 334. This query should list the trunks in the order of preference. (The answer should list trunks with routes 416,334 then those with 416,000 and then those with 000,000 for example)
*/

select distinct tr.area||','|| tr.office as acceptable_trunks
from trunks t
join trunk_routes tr on t.portid=tr.portid
where t.portid in
(
select portid
from trunk_routes where area=416 and office=334
)
order by acceptable_trunks desc;


/*
Test Output:

acceptable_trunks
-----------------
613,229
613,000
416,334
416,333
416,331
416,000
*/