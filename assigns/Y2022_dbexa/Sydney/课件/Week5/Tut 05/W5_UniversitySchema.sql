DROP TABLE IF EXISTS Transcript;
DROP TABLE IF EXISTS Lecture;
DROP TABLE IF EXISTS UoSOffering;
DROP TABLE IF EXISTS Requires;
DROP TABLE IF EXISTS Classroom;
DROP TABLE IF EXISTS WhenOffered;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS AcademicStaff;
DROP TABLE IF EXISTS UnitOfStudy;

/* create the schema */
CREATE TABLE Student (
  studId        INTEGER,
  name          VARCHAR(20) NOT NULL,
  password      VARCHAR(10) NOT NULL,
  address       VARCHAR(50),
  PRIMARY KEY (studId)
);
CREATE TABLE AcademicStaff (
  id            CHAR(9),
  name          VARCHAR(20) NOT NULL,
  deptId        Char(3)  NOT NULL,
  password      VARCHAR(10) NOT NULL,
  address       VARCHAR(50),
  salary        INTEGER,
  PRIMARY KEY (id)
);
CREATE TABLE UnitOfStudy (
  uoSCode       CHAR(8),
  deptId        CHAR(3)  NOT NULL,
  uoSName       VARCHAR(40) NOT NULL,
  credits       INTEGER  NOT NULL,
  PRIMARY KEY (uoSCode),
  UNIQUE (deptId, uoSName)
);
CREATE TABLE WhenOffered (
  uoSCode       CHAR(8),
  semester      CHAR(2),
  PRIMARY KEY (uoSCode, semester)
);
CREATE TABLE ClassRoom (
  classroomId   VARCHAR(8),
  seats         INTEGER NOT NULL,
  type          VARCHAR(7) ,
  PRIMARY KEY (classroomId)
);
CREATE TABLE Requires (
  uoSCode       CHAR(8),
  prereqUoSCode CHAR(8),
  enforcedSince DATE NOT NULL,
  PRIMARY KEY (uoSCode, prereqUoSCode),
  constraint Requires_uoSCode_fk_UOS FOREIGN KEY (uoSCode) REFERENCES UnitOfStudy(uoSCode),
  FOREIGN KEY (prereqUoSCode) REFERENCES UnitOfStudy(uoSCode)
);
CREATE TABLE UoSOffering (
  uoSCode       CHAR(8), 
  semester      CHAR(2),
  year          INTEGER,
  textbook      VARCHAR(50),
  enrollment    INTEGER,
  maxEnrollment INTEGER,
  instructorId  CHAR(9),
  PRIMARY KEY (UoSCode, Semester, Year),
  FOREIGN KEY (UoSCode)          REFERENCES UnitOfStudy(UoSCode),
  FOREIGN KEY (UoSCode,Semester) REFERENCES WhenOffered(UoSCode,Semester),
  FOREIGN KEY (InstructorId)     REFERENCES AcademicStaff(Id)
);
CREATE TABLE Lecture (
  uoSCode       CHAR(8), 
  semester      CHAR(2),
  year          INTEGER,
  classTime     CHAR(5),
  classroomId   VARCHAR(8),
  PRIMARY KEY (UoSCode, Semester, Year, ClassroomId),
  FOREIGN KEY (UoSCode, Semester, Year) REFERENCES UoSOffering,
  FOREIGN KEY (ClassroomId)             REFERENCES Classroom
);
CREATE TABLE Transcript (
  studId        INTEGER,
  uoSCode       CHAR(8),
  Semester      CHAR(2),
  year          INTEGER,
  grade         VARCHAR(2),
  PRIMARY KEY (StudId,UoSCode,Semester,Year),
  FOREIGN KEY (StudId) REFERENCES Student(studId),
  FOREIGN KEY (UoSCode,Semester,Year) REFERENCES UoSOffering
);

/* add some students - the following data is completely arbitrary */
/* any similarities to actual students is purely accidential.     */
INSERT INTO Student VALUES (307088592, 'John Smith', 'Green', 'Newtown');
INSERT INTO Student VALUES (305422153, 'Sally Waters', 'Purple', 'Coogee');
INSERT INTO Student VALUES (305678453, 'Pauline Winters', 'Turkey', 'Bondi');
INSERT INTO Student VALUES (316424328, 'Matthew Long', 'Space', 'Camperdown');
INSERT INTO Student VALUES (309145324, 'Victoria Tan', 'Grapes', 'Maroubra');
INSERT INTO Student VALUES (309187546, 'Sally Waters', 'Robot', 'Kingsford');

/* add some example academics */
INSERT INTO AcademicStaff VALUES ('6339103', 'Uwe Roehm',    'SIT', 'sailing', 'Cremorne', 90000);
INSERT INTO AcademicStaff VALUES ('1234567', 'Jon Patrick',  'SIT', 'english', 'Glebe',  135000);
INSERT INTO AcademicStaff VALUES ('7891234', 'Sanjay Chawla','SIT', 'cricket', 'Neutral Bay', 140000);
INSERT INTO AcademicStaff VALUES ('1237890', 'Joseph Davis', 'SIT', 'abcd',    NULL, 120000);
INSERT INTO AcademicStaff VALUES ('4657890', 'Alan Fekete',  'SIT', 'opera',   'Cameray', 120000);
INSERT INTO AcademicStaff VALUES ('0987654', 'Simon Poon',   'SIT', 'pony',    'Sydney', 75000);
INSERT INTO AcademicStaff VALUES ('1122334', 'Irena Koprinska','SIT','volleyball', 'Glebe', 90000);

/* some of our class rooms */
INSERT INTO Classroom VALUES ('BoschLT1',270, 'tiered');
INSERT INTO Classroom VALUES ('BoschLT2',267, 'tiered');
INSERT INTO Classroom VALUES ('BoschLT3',300, 'tiered');
INSERT INTO Classroom VALUES ('BoschLT4',300, 'tiered');
INSERT INTO Classroom VALUES ('CheLT1',  300, 'tiered');
INSERT INTO Classroom VALUES ('CheLT2',  145, 'tiered');
INSERT INTO Classroom VALUES ('CheLT3',  300, 'tiered');
INSERT INTO Classroom VALUES ('CheLT4',  145, 'tiered');
INSERT INTO Classroom VALUES ('CAR157',  290, 'tiered');
INSERT INTO Classroom VALUES ('CAR159',  290, 'tiered');
INSERT INTO Classroom VALUES ('CAR173',  127, 'tiered');
INSERT INTO Classroom VALUES ('CAR175',  160, 'tiered');
INSERT INTO Classroom VALUES ('CAR273',  160, 'tiered');
INSERT INTO Classroom VALUES ('CAR275',  160, 'tiered');
INSERT INTO Classroom VALUES ('CAR373',  160, 'tiered');
INSERT INTO Classroom VALUES ('CAR375',  160, 'tiered');
INSERT INTO Classroom VALUES ('EAA',     500, 'sloping');
INSERT INTO Classroom VALUES ('EALT',    200, 'sloping');
INSERT INTO Classroom VALUES ('EA403',    40, 'flat');
INSERT INTO Classroom VALUES ('EA404',    40, 'flat');
INSERT INTO Classroom VALUES ('EA405',    40, 'flat');
INSERT INTO Classroom VALUES ('EA406',    40, 'flat');
INSERT INTO Classroom VALUES ('FarrelLT',190, 'tiered');
INSERT INTO Classroom VALUES ('MechLT',  100, 'tiered');
INSERT INTO Classroom VALUES ('QuadLT',  261, 'tiered');
INSERT INTO Classroom VALUES ('SITLT',    50, 'sloping');

/* some units of study; note: older ones have only 3cp */
INSERT INTO UnitOfStudy  VALUES ('INFO1003', 'SIT', 'Introduction to IT', 6);
INSERT INTO UnitOfStudy  VALUES ('INFO2120', 'SIT', 'Database Systems I', 6);
INSERT INTO UnitOfStudy  VALUES ('INFO3404', 'SIT', 'Database Systems II', 6);
INSERT INTO UnitOfStudy  VALUES ('COMP5046', 'SIT', 'Statistical Natural Language Processing', 6);
INSERT INTO UnitOfStudy  VALUES ('COMP5138', 'SIT', 'Database Management Systems', 6);
INSERT INTO UnitOfStudy  VALUES ('COMP5338', 'SIT', 'Advanced Data Models', 6);
INSERT INTO UnitOfStudy  VALUES ('INFO2005', 'SIT', 'Database Management Introductory', 3);
INSERT INTO UnitOfStudy  VALUES ('INFO3005', 'SIT', 'Organisational Database Systems', 3);
INSERT INTO UnitOfStudy  VALUES ('MATH1002', 'MAT', 'Linear Algebra', 3);

INSERT INTO Requires VALUES('INFO2120', 'INFO1003', '01-Jan-2002');
INSERT INTO Requires VALUES('INFO3404', 'INFO2120', '01-Nov-2004');
INSERT INTO Requires VALUES('COMP5046', 'COMP5138', '01-Nov-2006');
INSERT INTO Requires VALUES('COMP5338', 'COMP5138', '01-Jan-2004');
INSERT INTO Requires VALUES('COMP5338', 'INFO2120', '01-Jan-2004');
INSERT INTO Requires VALUES('INFO2005', 'INFO1003', '01-Jan-2002');
INSERT INTO Requires VALUES('INFO3005', 'INFO2005', '01-Jan-2002');

INSERT INTO WhenOffered VALUES ('INFO1003', 'S1');
INSERT INTO WhenOffered VALUES ('INFO1003', 'S2');
INSERT INTO WhenOffered VALUES ('INFO2120', 'S1');
INSERT INTO WhenOffered VALUES ('INFO3404', 'S2');
INSERT INTO WhenOffered VALUES ('INFO2005', 'S2');
INSERT INTO WhenOffered VALUES ('INFO3005', 'S1');
INSERT INTO WhenOffered VALUES ('COMP5046', 'S1');
INSERT INTO WhenOffered VALUES ('COMP5138', 'S1');
INSERT INTO WhenOffered VALUES ('COMP5138', 'S2');
INSERT INTO WhenOffered VALUES ('COMP5138', 'SS');
INSERT INTO WhenOffered VALUES ('COMP5338', 'S1');
INSERT INTO WhenOffered VALUES ('COMP5338', 'S2');
INSERT INTO WhenOffered VALUES ('MATH1002', 'S1');
INSERT INTO WhenOffered VALUES ('MATH1002', 'S2');

INSERT INTO UoSOffering VALUES ('INFO1003', 'S1', 2006, 'Snyder', 150,200, '0987654');
INSERT INTO UoSOffering VALUES ('INFO1003', 'S2', 2006, 'Snyder',  80,200, '0987654');
INSERT INTO UoSOffering VALUES ('INFO2120', 'S1', 2006, 'Kifer/Bernstein/Lewis', 140, 200, '6339103');
INSERT INTO UoSOffering VALUES ('INFO2120', 'S1', 2009, 'Kifer/Bernstein/Lewis', 178, 200, '6339103');
INSERT INTO UoSOffering VALUES ('INFO2120', 'S1', 2010, 'Kifer/Bernstein/Lewis', 181, 200, '6339103');
INSERT INTO UoSOffering VALUES ('INFO3404', 'S2', 2008, 'Ramakrishnan/Gehrke',    80, 150, '6339103');
INSERT INTO UoSOffering VALUES ('COMP5138', 'S2', 2006, 'Ramakrishnan/Gehrke',    60, 100, '1237890');
INSERT INTO UoSOffering VALUES ('COMP5138', 'S1', 2010, 'Ramakrishnan/Gehrke',    56, 100, '1234567');
INSERT INTO UoSOffering VALUES ('COMP5046', 'S1', 2010, NULL,                     15,  40, '1234567');
INSERT INTO UoSOffering VALUES ('COMP5338', 'S1', 2006, 'none',  32, 50,  '6339103');
INSERT INTO UoSOffering VALUES ('COMP5338', 'S2', 2006, 'none',  30, 50,  '7891234');
INSERT INTO UoSOffering VALUES ('INFO2005', 'S2', 2004, 'Hoffer', 370, 400,  '6339103');
INSERT INTO UoSOffering VALUES ('INFO3005', 'S1', 2005, 'Hoffer', 100, 150,  '1122334');

INSERT INTO Lecture     VALUES ('INFO1003', 'S1', 2006, 'Mon12', 'CheLT4' );
INSERT INTO Lecture     VALUES ('INFO1003', 'S2', 2006, 'Mon12', 'CheLT4' );
INSERT INTO Lecture     VALUES ('INFO2120', 'S1', 2006, 'Mon11', 'CAR175' );
INSERT INTO Lecture     VALUES ('INFO2120', 'S1', 2009, 'Mon09', 'EALT'   );
INSERT INTO Lecture     VALUES ('INFO2120', 'S1', 2009, 'Tue13', 'CAR159' );
INSERT INTO Lecture     VALUES ('INFO2120', 'S1', 2010, 'Mon09', 'QuadLT' );
INSERT INTO Lecture     VALUES ('INFO2120', 'S1', 2010, 'Tue13', 'BoschLT2' );
INSERT INTO Lecture     VALUES ('INFO3404', 'S2', 2008, 'Mon09', 'CheLT4' );
INSERT INTO Lecture     VALUES ('COMP5046', 'S1', 2010, 'Tue14', 'SITLT'  );
INSERT INTO Lecture     VALUES ('COMP5138', 'S2', 2006, 'Mon18', 'SITLT'  );
INSERT INTO Lecture     VALUES ('COMP5138', 'S1', 2010, 'Thu18', 'FarrelLT');
INSERT INTO Lecture     VALUES ('COMP5338', 'S1', 2006, 'Tue18', 'EA404'  );
INSERT INTO Lecture     VALUES ('INFO2005', 'S2', 2004, 'Mon09', 'CAR159' );
INSERT INTO Lecture     VALUES ('INFO3005', 'S1', 2005, 'Wed09', 'EALT'   );

/* add some dummy transcripts */
INSERT INTO Transcript VALUES (307088592,'INFO2120', 'S1', 2009,'F');
INSERT INTO Transcript VALUES (307088592,'INFO2120', 'S1', 2010,'P');
INSERT INTO Transcript VALUES (316424328,'INFO2120', 'S1', 2010,'D');
INSERT INTO Transcript VALUES (305678453,'INFO2120', 'S1', 2010,'HD');
INSERT INTO Transcript VALUES (316424328,'INFO3005', 'S1', 2005,'CR');
INSERT INTO Transcript VALUES (305422153,'INFO3404', 'S2', 2008,'P');
INSERT INTO Transcript VALUES (316424328,'COMP5338', 'S1', 2006,'D');
INSERT INTO Transcript VALUES (309145324,'INFO2120', 'S1', 2010,'F');
INSERT INTO Transcript VALUES (309187546,'INFO2005', 'S2', 2004,'D');

COMMIT;
