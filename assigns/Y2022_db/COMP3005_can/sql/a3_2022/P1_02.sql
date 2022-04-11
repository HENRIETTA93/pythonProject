/*
Problem 1.2 Produce a table that lists all the area code, office code combinations and the number of subscribers with that area code, office code combination.
*/

SELECT
	lines.areacode,
	lines.officecode,
	count( subscribers.name ) AS subscribers
FROM
	subscribers
	INNER JOIN facilities ON facilities.portid = subscribers.portid
	INNER JOIN lines ON lines.portid = facilities.portid
GROUP BY
	lines.areacode,
	lines.officecode;
/*
Test Output:

areacode  officecode  subscribers
--------  ----------  -----------
416       219         2
416       331         2
416       333         2
416       334         2
416       756         2
613       134         1
613       136         1
613       156         1
613       220         1
613       221         1
613       222         1
613       223         1
613       226         1
613       227         1
613       229         1
613       310         1
613       322         1
613       333         1
613       334         1
613       389         1
613       457         1
613       489         1
613       523         1
613       568         1
613       578         1
613       623         1
613       645         1
613       657         1
613       712         1
613       728         1
613       798         1
705       221         3
819       223         2
819       227         3
905       347         2
905       657         2
905       819         2
*/

