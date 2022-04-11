/*
Problem 1.5 Find the names of all the subscribers who subscribe to at least three services.
*/

SELECT
	subscribers.name
FROM
	subscribers
	JOIN facilities ON facilities.portid = subscribers.portid
	JOIN ( SELECT portid FROM service_subscribers GROUP BY portid HAVING count( DISTINCT service ) >= 3 ) t ON t.portid = subscribers.portid;
/*
Test Output:

name
--------------
Michael Jordan
Joe Carter
Homer Simpson
Vince Carter
Chris Pronger
Frank Thomas
Steve Sampras
Matt Stajan

*/