/*
Problem 1.8 Write an SQL query that would find if the line with phone number (613) 712-0024 is currently available to take a call because its channel is IDLE. That is, select the portid, directory number, and channel state of line (613) 712-0024.
*/
SELECT
	lines.portid,
	'(' || lines.areacode || ') ' || lines.officecode || '-' || lines.stationcode AS directory_number,
	channels.state
FROM
	facilities
	JOIN lines ON lines.portid = facilities.portid
	JOIN channels ON channels.portid = lines.portid
WHERE
	lines.areacode = '613'
	AND lines.officecode = '712'
	AND lines.stationcode = '0024';

/*
Test Output:

portid  directory_number  state
------  ----------------  -----
24      (613) 712-0024    BUSY
*/