/*
Problem 1.7 Write an SQL query that will produce in one table a list of all the acceptable trunks that can be used to route a call to the 416 area code, office code 334. This query should list the trunks in the order of preference. (The answer should list trunks with routes 416,334 then those with 416,000 and then those with 000,000 for example)
*/

SELECT
	tr.portid,
	tr.area,
	tr.office
FROM
	trunk_routes tr
WHERE
	area = 416
	AND office = 334
	OR area = 416
	AND office = '000'
	OR area = '000'
	AND office = '000'
ORDER BY
	tr.area DESC,
	tr.office DESC;
/*
Test Output:

portid  area  office
------  ----  ------
102     416   334
102     416   000
106     416   000
107     000   000
*/



