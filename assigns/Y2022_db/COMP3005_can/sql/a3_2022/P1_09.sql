/*
Problem 1.9 Do the same as question 1.7 but this time only include trunks that have at least one 'IDLE' channel. That is, write an SQL query that will produce in one table a list of all the acceptable trunks that can be used to route a call to the 416 area code, office code 334 have at least one idle channel. This query should list the trunks in the order of preference. (The answer should list trunks routes 416,334 then 416,000 then 000,000 for example)
*/
SELECT DISTINCT
	t.portid,
	t.area,
	t.office
FROM
	(
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
		tr.office DESC
	) t
WHERE
	t.portid IN (
	SELECT
		trunks.portid
	FROM
		trunks
		JOIN facilities ON facilities.portid = trunks.portid
		JOIN channels ON channels.portid = facilities.portid
	WHERE
		channels.state = 'IDLE'
	GROUP BY
		trunks.portid
	HAVING
		count( channels.channel ) >= 1
	);

/*
Test Output:

portid  area  office
------  ----  ------
102     416   334
106     416   000
102     416   000
107     000   000
*/