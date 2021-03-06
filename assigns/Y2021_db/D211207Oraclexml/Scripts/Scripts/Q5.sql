/*
i.	Summarize (sum, min, and count) store sales for USA and Canada in 2016 by store zip code and month without using subtotal operators. Provide query code and results.
ii.	Use the same problem in part one and generate all possible subtotals by zip code and month using the data CUBE operator. Provide query code and results in your report.
iii.	Summarize (SUM, COUNT, and MIN) store sales for USA and Canada between 2016 and 2017 by year and month. Generate partial subtotals for year and month using the ROLLUP operator. Provide query code and results in your report.
iv.	Rewrite the query in part 3, and provide a set of subtotals on year, quarter, and month. Sort the results in a convenient order.
v.	Identify differences between results containing the GROUP BY clause (but not subtotal operators) and data cube and Rollup Results from queries in 1, 2, and 3. You should compare and contrast results based on the number of rows and subtotals groups. Explain why or why not each type of subtotal is useful for supporting business-specific queries.

*/

-- 1
select STOREZIP, TIMEMONTH, sum(SALESDOLLAR), min(SALESDOLLAR), count(SALESNO)
from sssales join ssstore on sssales.storeid=ssstore.storeid
join sstimedim on sssales.TIMENO=sstimedim.TIMENO
where STORENATION in ('USA', 'Canada')
and sstimedim.TIMEYEAR=2016
group by STOREZIP, TIMEMONTH;


STOREZIP	TIMEMONTH	SUM(SALESDOLLAR)	MIN(SALESDOLLAR)	COUNT(SALESNO)
80129-5543	10	23180	5745	4
80111-0033	10	10616	5308	2
80129-5543	5	24460	6015	4
80129-5543	7	23660	5915	4
98104-2211	2	20640	5115	4
98104-2211	7	23596	5844	4
98104-2211	10	26040	6245	4
80111-0033	7	9630	4815	2
80129-5543	2	21460	5215	4
80111-0033	2	10390	5195	2
98104-2211	5	24840	6115	4
80111-0033	5	12420	6210	2
Download CSV
12 rows selected.
-- 2
select STOREZIP, TIMEMONTH, sum(SALESDOLLAR), min(SALESDOLLAR), count(SALESNO)
from sssales join ssstore on sssales.storeid=ssstore.storeid
join sstimedim on sssales.TIMENO=sstimedim.TIMENO
where STORENATION in ('USA', 'Canada')
and sstimedim.TIMEYEAR=2016
group by cube(STOREZIP, TIMEMONTH);

STOREZIP	TIMEMONTH	SUM(SALESDOLLAR)	MIN(SALESDOLLAR)	COUNT(SALESNO)
 - 	 - 	230932	4815	40
 - 	2	52490	5115	10
 - 	5	61720	6015	10
 - 	7	56886	4815	10
 - 	10	59836	5308	10
80111-0033	 - 	43056	4815	8
80111-0033	2	10390	5195	2
80111-0033	5	12420	6210	2
80111-0033	7	9630	4815	2
80111-0033	10	10616	5308	2
80129-5543	 - 	92760	5215	16
80129-5543	2	21460	5215	4
80129-5543	5	24460	6015	4
80129-5543	7	23660	5915	4
80129-5543	10	23180	5745	4
98104-2211	 - 	95116	5115	16
98104-2211	2	20640	5115	4
98104-2211	5	24840	6115	4
98104-2211	7	23596	5844	4
98104-2211	10	26040	6245	4
Download CSV
20 rows selected.
-- 3

select TIMEYEAR, TIMEMONTH, sum(SALESDOLLAR), min(SALESDOLLAR), count(SALESNO)
from sssales join ssstore on sssales.storeid=ssstore.storeid
join sstimedim on sssales.TIMENO=sstimedim.TIMENO
where STORENATION in ('USA', 'Canada')
and sstimedim.TIMEYEAR between 2016 and 2017
group by rollup(TIMEYEAR, TIMEMONTH);



TIMEYEAR	TIMEMONTH	SUM(SALESDOLLAR)	MIN(SALESDOLLAR)	COUNT(SALESNO)
2016	2	52490	5115	10
2016	5	61720	6015	10
2016	7	56886	4815	10
2016	10	59836	5308	10
2016	 - 	230932	4815	40
2017	2	74910	5055	14
2017	5	89110	6005	14
2017	7	75086	4605	14
2017	10	81288	5448	14
2017	 - 	320394	4605	56
 - 	 - 	551326	4605	96
Download CSV
11 rows selected.

-- 4
select TIMEYEAR,TIMEQUARTER, TIMEMONTH, sum(SALESDOLLAR), min(SALESDOLLAR), count(SALESNO)
from sssales join ssstore on sssales.storeid=ssstore.storeid
join sstimedim on sssales.TIMENO=sstimedim.TIMENO
where STORENATION in ('USA', 'Canada')
and sstimedim.TIMEYEAR between 2016 and 2017
group by rollup(TIMEYEAR,TIMEQUARTER, TIMEMONTH)
order by TIMEYEAR,TIMEQUARTER, TIMEMONTH;

TIMEYEAR	TIMEQUARTER	TIMEMONTH	SUM(SALESDOLLAR)	MIN(SALESDOLLAR)	COUNT(SALESNO)
2016	1	2	52490	5115	10
2016	1	 - 	52490	5115	10
2016	2	5	61720	6015	10
2016	2	 - 	61720	6015	10
2016	3	7	56886	4815	10
2016	3	 - 	56886	4815	10
2016	4	10	59836	5308	10
2016	4	 - 	59836	5308	10
2016	 - 	 - 	230932	4815	40
2017	1	2	74910	5055	14
2017	1	 - 	74910	5055	14
2017	2	5	89110	6005	14
2017	2	 - 	89110	6005	14
2017	3	7	75086	4605	14
2017	3	 - 	75086	4605	14
2017	4	10	81288	5448	14
2017	4	 - 	81288	5448	14
2017	 - 	 - 	320394	4605	56
 - 	 - 	 - 	551326	4605	96





CUSTID	CUSTNAME	CUSTPHONE	CUSTSTREET	CUSTCITY	CUSTSTATE	CUSTZIP	CUSTNATION
C0954327	Sheri Gordon	(303)123-1234	336 Hill St.	Littleton	CO	80129-5543	USA
C1010398	Jim Glussman	(303)321-9876	1432 E. Ravenna	Denver	CO	80111-0033	USA
C2388597	Beth Taylor	(206)124-9876	2396 Rafter Rd	Seattle	WA	98103-1121	USA
C3340959	Betty Wise	(206)421-1276	4334 153rd NW	Seattle	WA	98178-3311	USA
C8543321	Ron Thompson	(206)891-7664	789 122nd St.	Renton	WA	98666-1289	USA
C8574932	Wally Jones	(206)391-8564	411 Webber Ave.	Seattle	WA	98105-1093	USA
C8654390	Candy Kendall	(206)561-2264	456 Pine St.	Seattle	WA	98105-3345	USA
C9128574	Jerry Wyatt	(303)821-1234	16212 123rd Ct.	Denver	CO	80222-0022	USA
C9403348	Mike Boren	(303)821-5688	642 Crest Ave.	Englewood	CO	80113-5431	USA
C9432910	Larry Styles	(406)921-7688	9825 S. Crest Lane	Vancouver	BC	98104-2211	Canada
C9543029	Sharon Johnson	(406)921-4468	1223 Meyer Way	Surrey	BC	98222-1123	Canada
Download CSV
11 rows selected.

Result Set 3
ITEMID	ITEMNAME	ITEMBRAND	ITEMCATEGORY	ITEMUNITPRICE
I0036566	17 inch Color Monitor	ColorMeg, Inc.	Electronics	169
I0036577	19 inch Color Monitor	ColorMeg, Inc.	Electronics	319
I1114590	R3000 Color Laser Printer	Connex	Printing	699
I1412138	10 Foot Printer Cable	Ethlite	Computer Accessories	12
I1445671	8-Outlet Surge Protector	Intersafe	Computer Accessories	14.99
I1556678	CVP Ink Jet Color Printer	Connex	Printing	99
I3455443	Color Ink Jet Cartridge	Connex	Printing	38
I4200744	36-Bit Color Scanner	UV Components	Scanning	199.99
I6677900	Black Ink Jet Cartridge	Connex	Printing	25.69
I9995676	Battery Back-up System	Cybercx	Computer Accessories	89
Download CSV
10 rows selected.

Result Set 4
STOREID	DIVID	STOREMANAGER	STORESTREET	STORECITY	STORESTATE	STOREZIP	STORENATION
S0954327	D0104030	Jim Smith	436 Hill St.	Littleton	CO	80129-5543	USA
S1010398	D0104030	Mary Glussman	1832 E. Ravenna	Denver	CO	80111-0033	USA
S2388597	D0225030	Beth Woo	5496 Rafter Rd	Seattle	WA	98103-1121	USA
S8543321	D3134030	Joe Thompson	989 122nd St.	Renton	WA	98666-1289	USA
S9403348	D0225030	Mary Boren	1242 Crest Ave.	Englewood	CO	80113-5431	USA
S9432910	D0104030	Larry Smith	12825 S. Crest Lane	Vancouver	BC	98104-2211	Canada
Download CSV
6 rows selected.

Result Set 5
SALESNO	SALESUNITS	SALESDOLLAR	SALESCOST	CUSTID	ITEMID	STOREID	TIMENO
1	100	5215	4187	C0954327	I0036566	S0954327	1
2	140	6215	4887	C1010398	I0036566	S0954327	2
3	120	5915	4687	C0954327	I0036566	S0954327	3
4	110	5745	4577	C9128574	I0036566	S0954327	4
5	105	5115	4287	C1010398	I0036566	S1010398	1
6	160	6915	4587	C0954327	I0036566	S1010398	2
7	90	4915	4847	C2388597	I0036566	S1010398	3
8	110	5448	4188	C8574932	I0036566	S1010398	4
9	105	5115	4287	C0954327	I0036566	S9432910	1
10	113	6115	4787	C0954327	I0036566	S9432910	2
11	144	5954	4655	C0954327	I0036566	S9432910	3
12	159	6245	5287	C3340959	I0036566	S9432910	4
13	100	5215	4187	C0954327	I0036577	S0954327	1
14	140	6215	4887	C8574932	I0036577	S0954327	2
15	120	5915	4687	C0954327	I0036577	S0954327	3
16	110	5745	4577	C8654390	I0036577	S0954327	4
17	105	5115	4287	C0954327	I0036577	S1010398	1
18	160	6915	4587	C0954327	I0036577	S1010398	2
19	90	4915	4847	C0954327	I0036577	S1010398	3
20	110	5448	4188	C8654390	I0036577	S1010398	4
21	105	5115	4287	C9128574	I0036577	S9432910	1
22	113	6115	4787	C0954327	I0036577	S9432910	2
23	144	5954	4655	C9403348	I0036577	S9432910	3
24	159	6245	5287	C9432910	I0036577	S9432910	4
25	100	5215	4187	C0954327	I0036566	S0954327	5
26	140	6215	4887	C1010398	I0036566	S0954327	6
27	120	5915	4687	C0954327	I0036566	S0954327	7
28	110	5745	4577	C9128574	I0036566	S0954327	8
29	105	5115	4287	C1010398	I0036566	S1010398	5
30	160	6915	4587	C0954327	I0036566	S1010398	6
31	90	4915	4847	C2388597	I0036566	S1010398	7
32	110	5448	4188	C8574932	I0036566	S1010398	8
33	105	5215	4287	C0954327	I0036566	S9432910	5
34	113	6215	4487	C0954327	I0036566	S9432910	6
35	144	5854	4455	C0954327	I0036566	S9432910	7
36	159	6245	5287	C3340959	I0036566	S9432910	8
37	100	5215	4187	C0954327	I0036577	S0954327	5
38	140	6215	4887	C8574932	I0036577	S0954327	6
39	120	5915	4687	C0954327	I0036577	S0954327	7
40	110	5895	4377	C8654390	I0036577	S0954327	8
41	105	5215	4387	C0954327	I0036577	S1010398	5
42	160	6915	4687	C0954327	I0036577	S1010398	6
43	90	5915	4947	C0954327	I0036577	S1010398	7
44	110	5548	4288	C8654390	I0036577	S1010398	8
45	105	5115	4287	C9128574	I0036577	S9432910	5
46	113	6315	4987	C0954327	I0036577	S9432910	6
47	144	5954	4655	C9403348	I0036577	S9432910	7
48	159	6145	5387	C9432910	I0036577	S9432910	8
49	100	5515	4067	C0954327	I0036566	S0954327	9
50	140	6015	4677	C1010398	I0036566	S0954327	10
Download CSV
Rows 1 - 50. More rows exist.

Result Set 6
TIMENO	TIMEDAY	TIMEMONTH	TIMEQUARTER	TIMEYEAR	TIMEDAYOFWEEK	TIMEFISCALYEAR
1	1	2	1	2014	2	2014
2	1	5	2	2014	4	2014
3	3	7	3	2014	3	2014
4	4	10	4	2014	2	2014
5	1	2	1	2015	2	2015
6	1	5	2	2015	4	2015
7	3	7	3	2015	3	2015
8	4	10	4	2015	2	2015
9	1	2	1	2016	2	2016
10	1	5	2	2016	4	2016
11	3	7	3	2016	3	2016
12	4	10	4	2016	2	2016
13	1	2	1	2017	2	2017
14	1	5	2	2017	4	2017
15	3	7	3	2017	3	2017
16	4	10	4	2017	2	2017