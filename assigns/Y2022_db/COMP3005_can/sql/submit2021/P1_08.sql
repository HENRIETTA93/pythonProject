/*
Problem 1.8 Write an SQL query that would find if the line with phone number (613) 712-0024 is currently available to take a call because its channel is IDLE. Rev 1: That is, select the portid, directory number, and channel state of line (613) 712-0024.
*/


select l.portid,'('||l.areacode||')'||l.officecode||'-'||l.stationcode as directory_number, c.state
from lines l join facilities f on l.portid=f.portid
join channels c on c.portid=f.portid
where l.areacode=613 and l.officecode=712 and stationcode='0024';






/*
Test Output:

portid      directory_number  state
----------  ----------------  ----------
24          (613)712-0024     BUSY
*/