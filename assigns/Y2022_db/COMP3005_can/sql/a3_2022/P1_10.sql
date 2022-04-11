/*
Problem 1.10 Produce a table that lists the name of all the service-subscribers that subscribe to at least all the same services as Jason Allison subscribes to but possibly others as well. Jason Allison rents the line with portID=2. (So this is the classic "subset" query.)
*/

SELECT
	subscribers.name
FROM
	subscribers
WHERE
	NOT EXISTS (
	SELECT
		services.service
	FROM
		service_subscribers
		JOIN services ON services.scode = service_subscribers.service
	WHERE
		portid = 2 EXCEPT
	SELECT
		services.service
	FROM
		service_subscribers
		JOIN services ON services.scode = service_subscribers.service
	WHERE
		portid = subscribers.portid
	);

/*
Test Output:

name
--------------
Jason Allison
Michael Jordan
Joe Carter
Homer Simpson
Matt Stajan
*/