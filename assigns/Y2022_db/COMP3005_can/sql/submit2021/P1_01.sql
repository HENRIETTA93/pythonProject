/*
Problem 1.1 Produce a table consisting of the names and addresses of the subscribers and their phone numbers.

*/

select s.name, s.address, l.areacode||l.officecode||l.stationcode as phone
from subscribers s join facilities f on s.portid=f.portid
join lines l on l.portid=f.portid;

/*
Test Output:
name         address       phone
-----------  ------------  ----------
Mats Sundin  45 Elgin St.  6131340001
Jason Allis  46 Elgin St.  6131360002
Eric Lindro  48 Elgin St.  6131560003
Bryan MacCa  23 MacLeod S  6132200004
Steve Nash   1129 Otterso  6132210005
Michael Jor  1223 Carling  6132220006
Roger Cleme  14 Hopewell   6132230007
Jack Morris  23 Prince of  6132260008
Roberto Alo  55 Moodie Dr  6132270009
Joe Carter   18 Summerset  6132290010
Wayne Grekz  45 Merviale.  6133100011
George Bell  46 Colon By   6133220012
Eric Staal   423 Riversid  6133330013
Roy Hallada  23 Ogilvie R  6133340014
Mario Lemie  1129 Bank Dr  6133890015
Patrick Roy  1223 Greenba  6134570016
Martin Brod  14 Baseline   6134890017
Homer Simps  123 Prince o  6135230018
Bart Simpso  155 Moodie D  6135680019
Joe Johnson  21 Sussex Dr  6135780020
Vince Carte  45 Hunt Club  6136230021
Ed Belfour   46 Fisher St  6136450022
Bobby Orr    48 Prince Ed  6136570023
Bobby Hull   23 Wellingto  6137120024
Gordie Howe  1129 Preston  6137280025
Larry Bird   1223 Warden   6137980026
Mark Messie  14 Finch Ave  4162190027
Wade Redden  23 Steeles A  4163310028
Sidney Cros  55 Sheppard   4163330029
Peter Forsb  1 Kennedy Dr  4163340030
Paul Kariya  45 Midland.   4167560031
Rob Blake    12 19th Ave.  7052210032
Chris Prong  48 16th Ave.  9053470033
Gary Robert  23 John St.   9056570034
Alex Mogily  1129 14th Av  9058190035
Scott Gomez  1223 Montrea  8192230036
Frank Thoma  14 Hull Ave.  8192270037
Barry Bonds  23 Hood Rd.   7052210038
Hank Aaron   55 Denison A  8192230039
Babe Ruth    1 Old Kenned  8192270040
Ted William  45 Birchmoun  9053470041
Chris Bosh   46 Queens Av  9056570042
Steve Sampr  448 St Clare  9058190043
Kobe Bryan   23 Bayview S  4162190044
Kevin Garne  59 Mike Myer  4163310045
Larry Brown  99 Blue Jays  4163330046
Brooke Shie  69 College A  4163340047
Matt Stajan  50 LakeShore  4167560048
Tie Domi     89 Spidina R  7052210049
Tevor Kidd   30 McCowan A  8192270050
*/