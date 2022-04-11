/*
Problem 1.6 Produce a table that lists the most popular service (or services). That is, give the name of the service that has the most subscribers.
*/

SELECT
	services.service
FROM
	services
	JOIN service_subscribers ON services.scode = service_subscribers.service
GROUP BY
	services.service
HAVING
	count( service_subscribers.portid ) = ( SELECT max( sub_count ) FROM ( SELECT count( portid ) AS sub_count FROM service_subscribers GROUP BY service ) );

/*
Test Output:

service
--------------
Message Answer
*/