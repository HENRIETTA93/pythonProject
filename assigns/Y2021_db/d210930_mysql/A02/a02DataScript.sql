insert into event values
(1,'The 12th International Conference on Security, Privacy and Anonymity in Computation, Communication and Storage','http://cse.stfx.ca/~cybermatics/2019/spaccs/','All accepted papers will be published by Springer LNCS (EI Indexed). Best Paper Awards will be presented to high quality
papers. Distinguished papers, after further revisions, will be be published in 10+ SCI & EI indexed special issues
(confirmed).');
insert into eventconference values
(1,'Atlanta','USA','2019-07-14');
insert into researchtopic values
('security','Security Model and Architecture'),
('Privacy','Measuring and Quantifying Privacy');
insert into covers values
(1,'security'),
(1,'Privacy');
insert into activityhappens values
(1,'Conference Date','2019-07-14');
insert into people values
(1,'Yanqing Zhang','Georgia State University'),
(2,'Jun Feng','St Francis Xavier Universit');
insert into organizes values
(1,1,'General Chairs'),
(1,2,'Program Chairs');




INSERT INTO event VALUES (2, "1st International Workshop on Internet of Autonomous Unmanned Vehicles (IAUV 2019)", "http://iauv2019.loria.fr/", 
"Autonomous unmanned vehicle networks in civil applications are considered with increasing interest. Such networks are
envisioned to consist of wireless sensors, robots and unmanned (aerial, ground, underwater) vehicles and are being
used in environmental monitoring, border surveillance, network provisioning, delivery, construction, emergency or
disaster assistance. The challenges in the design of these networks range from physical control of the vehicles,
navigation, to communication limitations. Due to diverse and interdisciplinary nature of these challenges, algorithms
and design principles proposed by networking, robotics, control theory, computer vision and artificial intelligence
research communities will need to be utilized.
IAUV aims to bring together state-of-the-art contributions on the design, specification and implementation of
architectures, algorithms and protocols for current and future applications of autonomous unmanned vehicle networks,
with a special focus o");
INSERT INTO researchtopic VALUES 
("UAV swarms", "UAV swarms"),
("Autonomous robot networks", "Autonomous robot networks"),
("Modeling and simulation", "Modeling and simulation"),
("Optimal control of networked robots", "Optimal control of networked robots"),
("Ad hoc networks of drones", "Ad hoc networks of drones"),
("Modeling and control of fleet of UAVs", "Modeling and control of fleet of UAVs"),
("Self-organizing coordination and communication", "Self-organizing coordination and communication"),
("Energy-efficient and real-time communication protocols", "Energy-efficient and real-time communication protocols"),
("Bandwidth-efficient and delay-tolerant communication protocols", "Bandwidth-efficient and delay-tolerant communication protocols"),
("Communication protocols for swarms of mobile robots", "Communication protocols for swarms of mobile robots");
INSERT INTO covers VALUES
(2,"UAV swarms"),
(2,"Autonomous robot networks"),
(2,"Modeling and simulation"),
(2,"Optimal control of networked robots"),
(2,"Ad hoc networks of drones"),
(2,"Modeling and control of fleet of UAVs"),
(2,"Self-organizing coordination and communication"),
(2,"Energy-efficient and real-time communication protocols"),
(2,"Bandwidth-efficient and delay-tolerant communication protocols"),
(2,"Communication protocols for swarms of mobile robots");
INSERT INTO eventjournal VALUES (2, "IEEE Xplore", "https://ieeexplore.ieee.org");
INSERT INTO people VALUES
(4, "Enrico Natalizio", "University of Lorraine, France"),
(5, "Evsen Yanmaz", "Ozyegin University"),
(3, "Raheeb Muzaffar", "Lakeside Labs, Austria");
INSERT INTO organizes VALUES
(2, 4, "Program Chair"),
(2, 5, "Program Chair"),
(2, 3, "Publicity Chair");
INSERT INTO activityhappens VALUES
(2, "Submission Deadline", "2019-03-15"),
(2, "Notification", "2019-04-15"),
(2, "Camera-Ready", "2019-05-01"),
(2, "Workshop Day", "2019-06-10");


INSERT INTO People (PersonID, Name, Affilliation) 
VALUES (6, 'Seong Oun Hwang', 'Inha University, Korea');
INSERT INTO Event (ID, Name, EventWebLink, CFPText)
VALUES (3, 'Special Issue on Cyber Security and Artificial Intelligence', 'https://mc.manuscriptcentral.com/etrij', 'We are facing a big data world, where IoT devices are embedded, connected, and generate a big volume of data.');
INSERT INTO Organizes (EventID, PerID, Role)
VALUES (3, 6, 'Managing GE');
INSERT INTO EventJournal (EventID, JournalName, Publisher)
VALUES (3, ' ETRI Journal', 'IEEE Communications Society Tech');
INSERT INTO ResearchTopic (Name, Area)
VALUES ('Intelligent methods for profiling threat and adversary', 'TopicName');
INSERT INTO Covers(EventID, TopicName)
VALUES (3, 'Intelligent methods for profiling threat and adversary');
INSERT INTO ActivityHappens (EventID, ActivityName, ActivityDate)
VALUES (3, 'Paper submission due', '2019-12-4');


INSERT INTO Event(ID, Name, EventWebLink, CFPText)
VALUES (4, 
"The 28th International Conference on Computer Communication and Networks (ICCCN 2019)",
"http://www.icccn.org/icccn19/", 
"ICCCN is one of the leading international conferences for presenting novel ideas and fundamental advances in the fields
of computer communications and networks. ICCCN serves to foster communication among researchers and
practitioners with a common interest in improving computer communications and networking through scientific and
technological innovation.");
INSERT INTO EventConference(EventID, City, Country, EvDate)
VALUES (4, "Valencia,", "Spain", '2019-07-29');
INSERT INTO ActivityHappens(EventID, ActivityName, ActivityDate)
VALUES(4, "Paper Submission Due", '2019-03-22'), (4, "Acceptance Notification", '2019-05-03'), (4, "Poster Paper Submission Due", '2019-05-08'), 
(4, "Poster Paper Notification", '2019-05-11'), (4, "Camera-Ready Due (all papers)", '2019-05-17');
INSERT INTO People(PersonID, Name, Affilliation)
VALUES(7, "Prof. Tarek Abdelzaher", "Executive Chair"),
(8, "Prof. Juan Carlos Cano", "General Co-Chairs"),
(9, "Dr. Raghu Ganti", "General Co-Chairs"),
(10, "Prof. Carlos T. Calafate", "TPC Co-Chairs"),
(11, "Prof. Tian He", "TPC Co-Chairs"),
(12, "Prof. Kang Chen", "Poster Chair"),
(13, "Prof. Pietro Manzoni", "Workshops General Co-Chairs"),
(14, "Prof. Kang Chen", "Publicity Co-Chairs");
INSERT INTO Organizes(EventID, PerID, Role)
VALUES(4, 7, "Executive Chair"),(4, 8, "General Co-Chairs"), (4, 9, "General Co-Chairs"), (4, 10, "TPC Co-Chairs"), (4, 11, "TPC Co-Chairs"), (4, 12, "Poster Chair"), 
(4, 13, "Workshops General Co-Chairs"), (4, 14, "Publicity Co-Chairs");
INSERT INTO ResearchTopic(Name, Area)
VALUES("Cognitive, Cellular and Mobile Networks (CCM)", "Design, implementation, and applications of computer communications and networks"),
("Data Centers and Big Data Computing (DCBC)", "Design, implementation, and applications of computer communications and networks"),
("Internet of Things (IoT)", "Design, implementation, and applications of computer communications and networks");
INSERT INTO Covers(EventID, TopicName)
VALUES(4, "Cognitive, Cellular and Mobile Networks (CCM)"), (4, "Data Centers and Big Data Computing (DCBC)"), (4, "Internet of Things (IoT)");


INSERT INTO Event SET
ID  = 5,
Name = "Leveraging Machine Learning in SDN/NFV-Based Networks IN IEEE JOURNAL ON SELECTED AREAS IN COMMUNICATIONS",
EventWebLink = "https://www.comsoc.org/publications/journals/ieee-jsac/cfp/leveraging-machine-learning-sdnnfv-based-networks",
CFPText = "A key trend of current network evolution is towards network softwarization. The softwarization/virtualization
technology aims to enable a network to be programmable in a way that makes the network more flexible, scalable, and
reliable, and in turn leads to agile service deployment, low capital and operational expenses, and having self-x
properties. Thus far, two widely adopted solutions have been Software Defined Networks (SDN) and Network Function
Virtualization (NFV). Both SDN and NFV have become key enabling technologies for 5G networks and can be widely
applicable to a range of important domains, including cloud datacenters, IoT, mobile edge computing (MEC), smart grid,
cognition-based networks.ActivityDate";
INSERT INTO EventJournal SET
EventID = 5,
JournalName = "IEEE Journal on Selected Areas in Communications",
Publisher = "IEEE";
INSERT INTO ResearchTopic SET
Name = "Resource management in SDN/NFV-based networks with ML technology",
Area = "Resource management in SDN/NFV-based networks with ML technology";
INSERT INTO ResearchTopic SET
Name = "Traffic engineering in SDN/NFV-based networks with ML technology",
Area = "ML technology";
INSERT INTO ResearchTopic SET
Name = "Elastic VNF placement and orchestration with ML technology",
Area = "ML technology";
INSERT INTO ResearchTopic SET
Name = "Energy efficiency in SDN/NFV-based networks with ML technology",
Area = "ML technology";
INSERT INTO ResearchTopic SET
Name = "VNF performance degradation and correction with ML technology",
Area = "ML technology";
INSERT INTO ResearchTopic SET
Name = "Security, Privacy, and Trust issues in SDN/NFV-based networks with ML technology",
Area = "ML technology";
INSERT INTO ResearchTopic SET
Name = "Novel and innovative machine learning methods for SDN/NFV-based autonomic networks",
Area = "ML technology";
INSERT INTO ActivityHappens SET
EventID = 5,
ActivityName = "Manuscript Due",
ActivityDate = "2019-06-01";
INSERT INTO ActivityHappens SET
EventID = 5,
ActivityName = "Notification of Acceptance",
ActivityDate = "2019-11-01";
INSERT INTO ActivityHappens SET
EventID = 5,
ActivityName = "Final to Publisher",
ActivityDate = "2019-12-01";
INSERT INTO ActivityHappens SET
EventID = 5,
ActivityName = "Expected Publication",
ActivityDate = "2020-04-01";
INSERT INTO Organizes SET
EventID = 5,
PerID = 1,
Role = "Guest Editors";
INSERT INTO Organizes SET
EventID = 5,
PerID = 2,
Role = "Guest Editors";
INSERT INTO Organizes SET
EventID = 5,
PerID = 3,
Role = "Guest Editors";
INSERT INTO Organizes SET
EventID = 5,
PerID = 4,
Role = "Guest Editors";
INSERT INTO Organizes SET
EventID = 5,
PerID = 5,
Role = "Guest Editors";
INSERT INTO Event
VALUES
(6, "Selected Areas in Communications", "https://www.comsoc.org/publications/journals/ieee-jsac/cfp/millimeter-wave-networking", "3rd Last CFP in CFPs--4.pdf(???)");
INSERT INTO EventJournal
VALUES
(6, "Millimeter-wave Networking IEEE Journal", "IEEE ComSoc");
INSERT INTO ActivityHappens
VALUES
(6, "Manuscript Due", '2019-04-30');
INSERT INTO ResearchTopic
VALUES
("Network Planning, Optimization and Learning Theories of mmWave Networks", "mmWave Networks");
INSERT INTO People
VALUES
(0, "Carlo Fischione", "KTH Royal Institute of Technology");
INSERT INTO Covers
VALUES
(6, "Network Planning, Optimization and Learning Theories of mmWave Networks");
INSERT INTO Organizes
VALUES
(6, 0, "Guest Editor");

insert into event values(
7,
"Special Issue on The Big Data Era in IoT-enabled Smart Farming: Re-defining Systems, Tools, and Techniques", 
"https://www.journals.elsevier.com/computer-networks/call-for-papers/big-data-era-in-iot-enabled-smart-farming",
"This Special Issue seeks to make an in-depth, critical contribution to this evolving field of agriculture in the era of Big
Data. We therefore aim to bring together the state-of-the-art research contributions towards providing new insights in
the application and benefits of the emerging methods and technologies in the Big Data-driven agriculture sector."
);
insert into eventbook values(
7,
"Elsevier");
insert into activityhappens values
(7,"Paper submission","2019-04-30"),
(7,"Notification of acceptance","2019-06-30"),
(7,"Final revision","2019-08-15"),
(7,"Publication date","2019-09-30");
insert into organizes value(7,0,"Guest Editor");
insert into organizes value (7,1,"Guest Editor");
insert into organizes value (7,2,"Guest Editor");
insert into organizes  value (7,3,"Guest Editor");

INSERT INTO Event 
   VALUES
   ( 8,'Fourteenth International Conference on Digital Information Management','www.icdim.org','ICDIM 2019' );   
INSERT INTO EventBook 
   VALUES
   ( 8,'Irish Computer Society' );
INSERT INTO ActivityHappens 
   VALUES
   ( 8,'Full Paper Submission','2019-06-05' );
