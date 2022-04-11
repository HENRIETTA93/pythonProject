/*
Problem 1.9 Do the same as question 1.7 but this time only include trunks that have at least one 'IDLE' channel. That is, write an SQL query that will produce in one table a list of all the acceptable trunks that can be used to route a call to the 416 area code, office code 334 have at least one idle channel. This query should list the trunks in the order of preference. (The answer should list trunks routes 416,334 then 416,000 then 000,000 for example)
*/

select distinct tr.area||','|| tr.office as acceptable_trunks
from trunks t
join channels c on t.portid=c.portid
join trunk_routes tr on t.portid=tr.portid
where t.portid =
(
select portid
from trunk_routes where area=416 and office=334
)
and c.state='IDLE'
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
