/*
Problem 1.4 Find the names and address of all subscribers who subscribe to all of the available services. (Note the result for the current data might be empty but your query should work if the TA's add more data to the databse.)
*/

SELECT
	subscribers.name,
	subscribers.address
FROM
	facilities
	JOIN subscribers ON facilities.portid = subscribers.portid
WHERE
	facilities.portid IN ( SELECT portid FROM service_subscribers GROUP BY portid HAVING count( service_subscribers.service ) = ( SELECT count( services.scode ) FROM services ) );

/*
Test Output:
*/