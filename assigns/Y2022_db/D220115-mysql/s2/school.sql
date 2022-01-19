
drop table if exists enrollment;
drop table if exists offering;
drop table if exists faculty;
drop table if exists course;
drop table if exists registration;
drop table if exists student;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `StdSSN` varchar(20) primary key,
  `StdFirstName` varchar(20),
  `StdLastName` varchar(20),
  `StdCity` varchar(25),
  `StdState` char(2),
  `StdMajor` varchar(20),
  `StdClass` char(2),
  `StdGPA` float,
  `StdZip` varchar(20)
);

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('123456789', 'HOMER', 'WELLS', 'SEATTLE', 'WA', 'IS', 'FR', '3', '981211111');
INSERT INTO `student` VALUES ('124567890', 'BOB', 'NORBERT', 'BOTHELL', 'WA', 'FIN', 'JR', '2.700000048', '980112121');
INSERT INTO `student` VALUES ('234567890', 'CANDY', 'KENDALL', 'TACOMA', 'WA', 'ACCT', 'JR', '3.5', '990423321');
INSERT INTO `student` VALUES ('345678901', 'WALLY', 'KENDALL', 'SEATTLE', 'WA', 'IS', 'SR', '2.799999952', '981231141');
INSERT INTO `student` VALUES ('456789012', 'JOE', 'ESTRADA', 'SEATTLE', 'WA', 'FIN', 'SR', '3.200000048', '981212333');
INSERT INTO `student` VALUES ('567890123', 'MARIAH', 'DODGE', 'SEATTLE', 'WA', 'IS', 'JR', '3.599999905', '981140021');
INSERT INTO `student` VALUES ('678901234', 'TESS', 'DODGE', 'REDMOND', 'WA', 'ACCT', 'SO', '3.299999952', '981162344');
INSERT INTO `student` VALUES ('789012345', 'ROBERTO', 'MORALES', 'SEATTLE', 'WA', 'FIN', 'JR', '2.5', '981212212');
INSERT INTO `student` VALUES ('876543210', 'CRISTOPHER', 'COLAN', 'SEATTLE', 'WA', 'IS', 'SR', '4', '981141332');
INSERT INTO `student` VALUES ('890123456', 'LUKE', 'BRAZZI', 'SEATTLE', 'WA', 'IS', 'SR', '2.200000048', '981160021');
INSERT INTO `student` VALUES ('901234567', 'WILLIAM', 'PILGRIM', 'BOTHELL', 'WA', 'IS', 'SO', '3.799999952', '981131885');


-- ----------------------------
-- Table structure for registration
-- ----------------------------
DROP TABLE IF EXISTS `registration`;
CREATE TABLE `registration`  (
  `RegNo` int primary key,
  `StdSSN` varchar(20),
  `RegStatus` char(1),
  `RegDate` date,
  `RegTerm` varchar(20),
  `RegYear` int,
	constraint fk_stdssn_reg foreign key (StdSSN) references student(stdssn)
);

-- ----------------------------
-- Records of registration
-- ----------------------------
INSERT INTO `registration` VALUES ('1234', '123456789', 'P', '2005-03-29', 'Fall', '2005');
INSERT INTO `registration` VALUES ('1236', '234567890', 'P', '2005-03-29', 'Fall', '2005');
INSERT INTO `registration` VALUES ('1238', '345678901', 'P', '2005-03-29', 'Fall', '2005');
INSERT INTO `registration` VALUES ('1240', '678901234', 'P', '2005-10-29', 'Winter', '2006');
INSERT INTO `registration` VALUES ('1242', '567890123', 'P', '2005-03-29', 'Fall', '2005');
INSERT INTO `registration` VALUES ('1244', '678901234', 'P', '2005-03-29', 'Fall', '2006');
INSERT INTO `registration` VALUES ('1246', '124567890', 'P', '2005-10-29', 'Winter', '2006');
INSERT INTO `registration` VALUES ('1248', '789012345', 'P', '2005-03-29', 'Fall', '2005');
INSERT INTO `registration` VALUES ('1250', '876543210', 'P', '2005-03-29', 'Fall', '2005');
INSERT INTO `registration` VALUES ('1252', '890123456', 'P', '2005-03-29', 'Fall', '2005');
INSERT INTO `registration` VALUES ('1254', '901234567', 'P', '2005-03-29', 'Fall', '2005');
INSERT INTO `registration` VALUES ('1256', '123456789', 'F', '2005-11-02', 'Winter', '2006');
INSERT INTO `registration` VALUES ('1258', '234567890', 'F', '2006-02-27', 'Spring', '2006');
INSERT INTO `registration` VALUES ('1260', '345678901', 'F', '2006-02-27', 'Spring', '2006');
INSERT INTO `registration` VALUES ('1262', '456789012', 'F', '2006-02-27', 'Spring', '2006');
INSERT INTO `registration` VALUES ('1264', '567890123', 'F', '2003-02-27', 'Spring', '2006');
INSERT INTO `registration` VALUES ('1266', '124567890', 'F', '2006-02-27', 'Spring', '2006');
INSERT INTO `registration` VALUES ('1268', '678901234', 'F', '2006-02-26', 'Spring', '2006');
INSERT INTO `registration` VALUES ('1270', '789012345', 'P', '2006-02-28', 'Spring', '2006');
INSERT INTO `registration` VALUES ('1272', '890123456', 'P', '2006-02-28', 'Spring', '2006');
INSERT INTO `registration` VALUES ('1274', '901234567', 'F', '2006-02-27', 'Spring', '2006');


-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `CourseNo` varchar(20) primary key,
  `CrsDesc` varchar(100),
  `CrsUnits` int
);

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('FIN300', 'FUNDAMENTALS OF FINANCE', '4');
INSERT INTO `course` VALUES ('FIN450', 'PRINCIPLES OF INVESTMENTS', '4');
INSERT INTO `course` VALUES ('FIN480', 'CORPORATE FINANCE', '4');
INSERT INTO `course` VALUES ('IS320', 'FUNDAMENTALS OF BUSINESS PROGRAMMING', '4');
INSERT INTO `course` VALUES ('IS460', 'SYSTEMS ANALYSIS', '4');
INSERT INTO `course` VALUES ('IS470', 'BUSINESS DATA COMMUNICATIONS', '4');
INSERT INTO `course` VALUES ('IS480', 'FUNDAMENTALS OF DATABASE MANAGEMENT', '4');


-- ----------------------------
-- Table structure for faculty
-- ----------------------------
DROP TABLE IF EXISTS `faculty`;
CREATE TABLE `faculty`  (
  `FacSSN` varchar(20) primary key,
  `FacFirstName` varchar(20),
  `FacLastName` varchar(20),
  `FacCity` varchar(25),
  `FacState` char(2),
  `FacDept` varchar(10),
  `FacRank` varchar(20),
  `FacSalary` int,
  `FacSupervisor` varchar(20),
  `FacHireDate` date,
  `FacZipCode` varchar(20),
	constraint fk_super_fac foreign key (FacSupervisor) references faculty(FacSSN) on delete set null

);

-- ----------------------------
-- Records of faculty
-- ----------------------------

INSERT INTO `faculty` VALUES ('543210987', 'VICTORIA', 'EMMANUEL', 'BOTHELL', 'WA', 'MS', 'PROF', '120000', null, '1996-04-15', '980112242');
INSERT INTO `faculty` VALUES ('765432109', 'NICKI', 'MACON', 'BELLEVUE', 'WA', 'FIN', 'PROF', '65000', null, '1997-04-11', '980159945');
INSERT INTO `faculty` VALUES ('654321098', 'LEONARD', 'FIBON', 'SEATTLE', 'WA', 'MS', 'ASSC', '70000', '543210987', '1994-05-01', '981210094');
INSERT INTO `faculty` VALUES ('098765432', 'LEONARD', 'VINCE', 'SEATTLE', 'WA', 'MS', 'ASST', '35000', '654321098', '1995-04-10', '981119921');
INSERT INTO `faculty` VALUES ('876543210', 'CRISTOPHER', 'COLAN', 'SEATTLE', 'WA', 'MS', 'ASST', '40000', '654321098', '1999-03-01', '981141332');
INSERT INTO `faculty` VALUES ('987654321', 'JULIA', 'MILLS', 'SEATTLE', 'WA', 'FIN', 'ASSC', '75000', '765432109', '2000-03-15', '981149954');




-- ----------------------------
-- Table structure for offering
-- ----------------------------
DROP TABLE IF EXISTS `offering`;
CREATE TABLE `offering`  (
  `OfferNo` int primary key,
  `CourseNo` varchar(20),
  `OffTerm` varchar(20),
  `OffYear` int,
  `OffLocation` varchar(20),
  `OffTime` varchar(20),
  `FacSSN` varchar(20),
  `OffDays` varchar(5),
  `OffLimit` int,
  `OffNumEnrolled` int,
	constraint fk_facssn_offer foreign key (facssn) references faculty(facssn),
	constraint fk_courseno_offer foreign key (courseno) references course(courseno)
);

-- ----------------------------
-- Records of offering
-- ----------------------------
INSERT INTO `offering` VALUES ('1111', 'IS320', 'SUMMER', '2006', 'BLM302', '10:30 AM', null, 'MW', '10', '0');
INSERT INTO `offering` VALUES ('1234', 'IS320', 'FALL', '2005', 'BLM302', '10:30 AM', '098765432', 'MW', '10', '5');
INSERT INTO `offering` VALUES ('2222', 'IS460', 'SUMMER', '2005', 'BLM412', '1:30 PM', null, 'TTH', '30', '0');
INSERT INTO `offering` VALUES ('3333', 'IS320', 'SPRING', '2006', 'BLM214', '8:30 AM', '098765432', 'MW', '20', '0');
INSERT INTO `offering` VALUES ('4321', 'IS320', 'FALL', '2005', 'BLM214', '3:30 PM', '098765432', 'TTH', '15', '5');
INSERT INTO `offering` VALUES ('4444', 'IS320', 'WINTER', '2006', 'BLM302', '3:30 PM', '543210987', 'TTH', '10', '2');
INSERT INTO `offering` VALUES ('5555', 'FIN300', 'WINTER', '2006', 'BLM207', '8:30 AM', '765432109', 'MW', '15', '0');
INSERT INTO `offering` VALUES ('5678', 'IS480', 'WINTER', '2006', 'BLM302', '10:30 AM', '987654321', 'MW', '20', '1');
INSERT INTO `offering` VALUES ('5679', 'IS480', 'SPRING', '2006', 'BLM412', '3:30 PM', '876543210', 'TTH', '10', '9');
INSERT INTO `offering` VALUES ('6666', 'FIN450', 'WINTER', '2006', 'BLM212', '10:30 AM', '987654321', 'TTH', '20', '0');
INSERT INTO `offering` VALUES ('7777', 'FIN480', 'SPRING', '2006', 'BLM305', '1:30 PM', '765432109', 'MW', '20', '0');
INSERT INTO `offering` VALUES ('8888', 'IS320', 'SUMMER', '2006', 'BLM405', '1:30 PM', '654321098', 'MW', '20', '0');
INSERT INTO `offering` VALUES ('9876', 'IS460', 'SPRING', '2006', 'BLM307', '1:30 PM', '654321098', 'TTH', '10', '6');


-- ----------------------------
-- Table structure for enrollment
-- ----------------------------
DROP TABLE IF EXISTS `enrollment`;
CREATE TABLE `enrollment`  (
  `RegNo` int,
  `OfferNo` int,
  `EnrGrade` float,
	constraint fk_regno_enroll foreign key (regno) references registration(regno),
	constraint fk_offerno_enroll foreign key (offerno) references offering(offerno)
);

-- ----------------------------
-- Records of enrollment
-- ----------------------------
INSERT INTO `enrollment` VALUES ('1234', '1234', '3.2');
INSERT INTO `enrollment` VALUES ('1236', '1234', '3.6');
INSERT INTO `enrollment` VALUES ('1238', '1234', '3.2');
INSERT INTO `enrollment` VALUES ('1240', '4444', '2.5');
INSERT INTO `enrollment` VALUES ('1242', '1234', '3.8');
INSERT INTO `enrollment` VALUES ('1244', '4321', '3.1');
INSERT INTO `enrollment` VALUES ('1246', '4444', '2.9');
INSERT INTO `enrollment` VALUES ('1248', '4321', '3.8');
INSERT INTO `enrollment` VALUES ('1250', '4321', '3.2');
INSERT INTO `enrollment` VALUES ('1252', '4321', '3.4');
INSERT INTO `enrollment` VALUES ('1254', '4321', '3.1');
INSERT INTO `enrollment` VALUES ('1256', '4444', '3.3');
INSERT INTO `enrollment` VALUES ('1256', '5678', '3.4');
INSERT INTO `enrollment` VALUES ('1258', '5679', null);
INSERT INTO `enrollment` VALUES ('1258', '9876', null);
INSERT INTO `enrollment` VALUES ('1260', '5679', '3.1');
INSERT INTO `enrollment` VALUES ('1260', '9876', '3.3');
INSERT INTO `enrollment` VALUES ('1262', '5679', '3.1');
INSERT INTO `enrollment` VALUES ('1262', '9876', '3.5');
INSERT INTO `enrollment` VALUES ('1264', '5679', '3.2');
INSERT INTO `enrollment` VALUES ('1264', '9876', '2.9');
INSERT INTO `enrollment` VALUES ('1266', '5679', '3.5');
INSERT INTO `enrollment` VALUES ('1268', '5679', '3.5');
INSERT INTO `enrollment` VALUES ('1268', '9876', '3.6');
INSERT INTO `enrollment` VALUES ('1270', '5679', '3');
INSERT INTO `enrollment` VALUES ('1272', '5679', '3.3');
INSERT INTO `enrollment` VALUES ('1274', '5679', '3.4');
INSERT INTO `enrollment` VALUES ('1274', '9876', '2.8');
