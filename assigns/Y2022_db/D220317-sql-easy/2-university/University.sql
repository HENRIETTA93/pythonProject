SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

drop table if exists time_slot;
drop table if exists teaches;
drop table if exists takes;
drop table if exists student;
drop table if exists section;
drop table if exists prereq;
drop table if exists instructor;
drop table if exists department;
drop table if exists course;
drop table if exists classroom;
drop table if exists advisor;

CREATE TABLE advisor (
  s_ID varchar(5) NOT NULL,
  i_ID varchar(5) DEFAULT NULL
) ;

INSERT INTO advisor (s_ID, i_ID) VALUES('12345', '10101');
INSERT INTO advisor (s_ID, i_ID) VALUES('44553', '22222');
INSERT INTO advisor (s_ID, i_ID) VALUES('45678', '22222');
INSERT INTO advisor (s_ID, i_ID) VALUES('00128', '45565');
INSERT INTO advisor (s_ID, i_ID) VALUES('76543', '45565');
INSERT INTO advisor (s_ID, i_ID) VALUES('23121', '76543');
INSERT INTO advisor (s_ID, i_ID) VALUES('98988', '76766');
INSERT INTO advisor (s_ID, i_ID) VALUES('76653', '98345');
INSERT INTO advisor (s_ID, i_ID) VALUES('98765', '98345');

CREATE TABLE classroom (
  building varchar(15) NOT NULL,
  room_number varchar(7) NOT NULL,
  capacity decimal(4,0) DEFAULT NULL
) ;

INSERT INTO classroom (building, room_number, capacity) VALUES('Packard', '101', '500');
INSERT INTO classroom (building, room_number, capacity) VALUES('Painter', '514', '10');
INSERT INTO classroom (building, room_number, capacity) VALUES('Taylor', '3128', '70');
INSERT INTO classroom (building, room_number, capacity) VALUES('Watson', '100', '30');
INSERT INTO classroom (building, room_number, capacity) VALUES('Watson', '120', '50');

CREATE TABLE course (
  course_id varchar(8) NOT NULL,
  title varchar(50) DEFAULT NULL,
  dept_name varchar(20) DEFAULT NULL,
  credits decimal(2,0) DEFAULT NULL
) ;

INSERT INTO course (course_id, title, dept_name, credits) VALUES('BIO-101', 'Intro. to Biology', 'Biology', '4');
INSERT INTO course (course_id, title, dept_name, credits) VALUES('BIO-301', 'Genetics', 'Biology', '4');
INSERT INTO course (course_id, title, dept_name, credits) VALUES('BIO-399', 'Computational Biology', 'Biology', '3');
INSERT INTO course (course_id, title, dept_name, credits) VALUES('CS-101', 'Intro. to Computer Science', 'Comp. Sci.', '4');
INSERT INTO course (course_id, title, dept_name, credits) VALUES('CS-190', 'Game Design', 'Comp. Sci.', '4');
INSERT INTO course (course_id, title, dept_name, credits) VALUES('CS-315', 'Robotics', 'Comp. Sci.', '3');
INSERT INTO course (course_id, title, dept_name, credits) VALUES('CS-319', 'Image Processing', 'Comp. Sci.', '3');
INSERT INTO course (course_id, title, dept_name, credits) VALUES('CS-347', 'Database System Concepts', 'Comp. Sci.', '3');
INSERT INTO course (course_id, title, dept_name, credits) VALUES('EE-181', 'Intro. to Digital Systems', 'Elec. Eng.', '3');
INSERT INTO course (course_id, title, dept_name, credits) VALUES('FIN-201', 'Investment Banking', 'Finance', '3');
INSERT INTO course (course_id, title, dept_name, credits) VALUES('HIS-351', 'World History', 'History', '3');
INSERT INTO course (course_id, title, dept_name, credits) VALUES('MU-199', 'Music Video Production', 'Music', '3');
INSERT INTO course (course_id, title, dept_name, credits) VALUES('PHY-101', 'Physical Principles', 'Physics', '4');

CREATE TABLE department (
  dept_name varchar(20) NOT NULL,
  building varchar(15) DEFAULT NULL,
  budget decimal(12,2) DEFAULT NULL
) ;

INSERT INTO department (dept_name, building, budget) VALUES('Biology', 'Watson', '90000.00');
INSERT INTO department (dept_name, building, budget) VALUES('Comp. Sci.', 'Taylor', '100000.00');
INSERT INTO department (dept_name, building, budget) VALUES('Elec. Eng.', 'Taylor', '85000.00');
INSERT INTO department (dept_name, building, budget) VALUES('Finance', 'Painter', '120000.00');
INSERT INTO department (dept_name, building, budget) VALUES('History', 'Painter', '50000.00');
INSERT INTO department (dept_name, building, budget) VALUES('Music', 'Packard', '80000.00');
INSERT INTO department (dept_name, building, budget) VALUES('Physics', 'Watson', '70000.00');

CREATE TABLE instructor (
  ID varchar(5) NOT NULL,
  name varchar(20) NOT NULL,
  dept_name varchar(20) DEFAULT NULL,
  salary decimal(8,2) DEFAULT NULL
) ;

INSERT INTO instructor (ID, `name`, dept_name, salary) VALUES('10101', 'Srinivasan', 'Comp. Sci.', '65000.00');
INSERT INTO instructor (ID, `name`, dept_name, salary) VALUES('12121', 'Wu', 'Finance', '90000.00');
INSERT INTO instructor (ID, `name`, dept_name, salary) VALUES('15151', 'Mozart', 'Music', '40000.00');
INSERT INTO instructor (ID, `name`, dept_name, salary) VALUES('22222', 'Einstein', 'Physics', '95000.00');
INSERT INTO instructor (ID, `name`, dept_name, salary) VALUES('32343', 'El Said', 'History', '60000.00');
INSERT INTO instructor (ID, `name`, dept_name, salary) VALUES('33456', 'Gold', 'Physics', '87000.00');
INSERT INTO instructor (ID, `name`, dept_name, salary) VALUES('45565', 'Katz', 'Comp. Sci.', '75000.00');
INSERT INTO instructor (ID, `name`, dept_name, salary) VALUES('58583', 'Califieri', 'History', '62000.00');
INSERT INTO instructor (ID, `name`, dept_name, salary) VALUES('76543', 'Singh', 'Finance', '80000.00');
INSERT INTO instructor (ID, `name`, dept_name, salary) VALUES('76766', 'Crick', 'Biology', '72000.00');
INSERT INTO instructor (ID, `name`, dept_name, salary) VALUES('83821', 'Brandt', 'Comp. Sci.', '92000.00');
INSERT INTO instructor (ID, `name`, dept_name, salary) VALUES('98345', 'Kim', 'Elec. Eng.', '80000.00');

CREATE TABLE prereq (
  course_id varchar(8) NOT NULL,
  prereq_id varchar(8) NOT NULL
) ;

INSERT INTO prereq (course_id, prereq_id) VALUES('BIO-301', 'BIO-101');
INSERT INTO prereq (course_id, prereq_id) VALUES('BIO-399', 'BIO-101');
INSERT INTO prereq (course_id, prereq_id) VALUES('CS-190', 'CS-101');
INSERT INTO prereq (course_id, prereq_id) VALUES('CS-315', 'CS-101');
INSERT INTO prereq (course_id, prereq_id) VALUES('CS-319', 'CS-101');
INSERT INTO prereq (course_id, prereq_id) VALUES('CS-347', 'CS-101');
INSERT INTO prereq (course_id, prereq_id) VALUES('EE-181', 'PHY-101');

CREATE TABLE section (
  course_id varchar(8) NOT NULL,
  sec_id varchar(8) NOT NULL,
  semester varchar(6) NOT NULL,
  year decimal(4,0) NOT NULL,
  building varchar(15) DEFAULT NULL,
  room_number varchar(7) DEFAULT NULL,
  time_slot_id varchar(4) DEFAULT NULL
) ;

INSERT INTO section (course_id, sec_id, semester, `year`, building, room_number, time_slot_id) VALUES('BIO-101', '1', 'Summer', '2017', 'Painter', '514', 'B');
INSERT INTO section (course_id, sec_id, semester, `year`, building, room_number, time_slot_id) VALUES('BIO-301', '1', 'Summer', '2018', 'Painter', '514', 'A');
INSERT INTO section (course_id, sec_id, semester, `year`, building, room_number, time_slot_id) VALUES('CS-101', '1', 'Fall', '2017', 'Packard', '101', 'H');
INSERT INTO section (course_id, sec_id, semester, `year`, building, room_number, time_slot_id) VALUES('CS-101', '1', 'Spring', '2018', 'Packard', '101', 'F');
INSERT INTO section (course_id, sec_id, semester, `year`, building, room_number, time_slot_id) VALUES('CS-190', '1', 'Spring', '2017', 'Taylor', '3128', 'E');
INSERT INTO section (course_id, sec_id, semester, `year`, building, room_number, time_slot_id) VALUES('CS-190', '2', 'Spring', '2017', 'Taylor', '3128', 'A');
INSERT INTO section (course_id, sec_id, semester, `year`, building, room_number, time_slot_id) VALUES('CS-315', '1', 'Spring', '2018', 'Watson', '120', 'D');
INSERT INTO section (course_id, sec_id, semester, `year`, building, room_number, time_slot_id) VALUES('CS-319', '1', 'Spring', '2018', 'Watson', '100', 'B');
INSERT INTO section (course_id, sec_id, semester, `year`, building, room_number, time_slot_id) VALUES('CS-319', '2', 'Spring', '2018', 'Taylor', '3128', 'C');
INSERT INTO section (course_id, sec_id, semester, `year`, building, room_number, time_slot_id) VALUES('CS-347', '1', 'Fall', '2017', 'Taylor', '3128', 'A');
INSERT INTO section (course_id, sec_id, semester, `year`, building, room_number, time_slot_id) VALUES('EE-181', '1', 'Spring', '2017', 'Taylor', '3128', 'C');
INSERT INTO section (course_id, sec_id, semester, `year`, building, room_number, time_slot_id) VALUES('FIN-201', '1', 'Spring', '2018', 'Packard', '101', 'B');
INSERT INTO section (course_id, sec_id, semester, `year`, building, room_number, time_slot_id) VALUES('HIS-351', '1', 'Spring', '2018', 'Painter', '514', 'C');
INSERT INTO section (course_id, sec_id, semester, `year`, building, room_number, time_slot_id) VALUES('MU-199', '1', 'Spring', '2018', 'Packard', '101', 'D');
INSERT INTO section (course_id, sec_id, semester, `year`, building, room_number, time_slot_id) VALUES('PHY-101', '1', 'Fall', '2017', 'Watson', '100', 'A');

CREATE TABLE student (
  ID varchar(5) NOT NULL,
  name varchar(20) NOT NULL,
  dept_name varchar(20) DEFAULT NULL,
  tot_cred decimal(3,0) DEFAULT NULL
) ;

INSERT INTO student (ID, `name`, dept_name, tot_cred) VALUES('00128', 'Zhang', 'Comp. Sci.', '102');
INSERT INTO student (ID, `name`, dept_name, tot_cred) VALUES('12345', 'Shankar', 'Comp. Sci.', '32');
INSERT INTO student (ID, `name`, dept_name, tot_cred) VALUES('19991', 'Brandt', 'History', '80');
INSERT INTO student (ID, `name`, dept_name, tot_cred) VALUES('23121', 'Chavez', 'Finance', '110');
INSERT INTO student (ID, `name`, dept_name, tot_cred) VALUES('44553', 'Peltier', 'Physics', '56');
INSERT INTO student (ID, `name`, dept_name, tot_cred) VALUES('45678', 'Levy', 'Physics', '46');
INSERT INTO student (ID, `name`, dept_name, tot_cred) VALUES('54321', 'Williams', 'Comp. Sci.', '54');
INSERT INTO student (ID, `name`, dept_name, tot_cred) VALUES('55739', 'Sanchez', 'Music', '38');
INSERT INTO student (ID, `name`, dept_name, tot_cred) VALUES('70557', 'Snow', 'Physics', '0');
INSERT INTO student (ID, `name`, dept_name, tot_cred) VALUES('76543', 'Brown', 'Comp. Sci.', '58');
INSERT INTO student (ID, `name`, dept_name, tot_cred) VALUES('76653', 'Aoi', 'Elec. Eng.', '60');
INSERT INTO student (ID, `name`, dept_name, tot_cred) VALUES('98765', 'Bourikas', 'Elec. Eng.', '98');
INSERT INTO student (ID, `name`, dept_name, tot_cred) VALUES('98988', 'Tanaka', 'Biology', '120');

CREATE TABLE takes (
  ID varchar(5) NOT NULL,
  course_id varchar(8) NOT NULL,
  sec_id varchar(8) NOT NULL,
  semester varchar(6) NOT NULL,
  year decimal(4,0) NOT NULL,
  grade varchar(2) DEFAULT NULL
) ;

INSERT INTO takes (ID, course_id, sec_id, semester, `year`, grade) VALUES('00128', 'CS-101', '1', 'Fall', '2017', 'A');
INSERT INTO takes (ID, course_id, sec_id, semester, `year`, grade) VALUES('00128', 'CS-347', '1', 'Fall', '2017', 'A-');
INSERT INTO takes (ID, course_id, sec_id, semester, `year`, grade) VALUES('12345', 'CS-101', '1', 'Fall', '2017', 'C');
INSERT INTO takes (ID, course_id, sec_id, semester, `year`, grade) VALUES('12345', 'CS-190', '2', 'Spring', '2017', 'A');
INSERT INTO takes (ID, course_id, sec_id, semester, `year`, grade) VALUES('12345', 'CS-315', '1', 'Spring', '2018', 'A');
INSERT INTO takes (ID, course_id, sec_id, semester, `year`, grade) VALUES('12345', 'CS-347', '1', 'Fall', '2017', 'A');
INSERT INTO takes (ID, course_id, sec_id, semester, `year`, grade) VALUES('19991', 'HIS-351', '1', 'Spring', '2018', 'B');
INSERT INTO takes (ID, course_id, sec_id, semester, `year`, grade) VALUES('23121', 'FIN-201', '1', 'Spring', '2018', 'C+');
INSERT INTO takes (ID, course_id, sec_id, semester, `year`, grade) VALUES('44553', 'PHY-101', '1', 'Fall', '2017', 'B-');
INSERT INTO takes (ID, course_id, sec_id, semester, `year`, grade) VALUES('45678', 'CS-101', '1', 'Fall', '2017', 'F');
INSERT INTO takes (ID, course_id, sec_id, semester, `year`, grade) VALUES('45678', 'CS-101', '1', 'Spring', '2018', 'B+');
INSERT INTO takes (ID, course_id, sec_id, semester, `year`, grade) VALUES('45678', 'CS-319', '1', 'Spring', '2018', 'B');
INSERT INTO takes (ID, course_id, sec_id, semester, `year`, grade) VALUES('54321', 'CS-101', '1', 'Fall', '2017', 'A-');
INSERT INTO takes (ID, course_id, sec_id, semester, `year`, grade) VALUES('54321', 'CS-190', '2', 'Spring', '2017', 'B+');
INSERT INTO takes (ID, course_id, sec_id, semester, `year`, grade) VALUES('55739', 'MU-199', '1', 'Spring', '2018', 'A-');
INSERT INTO takes (ID, course_id, sec_id, semester, `year`, grade) VALUES('76543', 'CS-101', '1', 'Fall', '2017', 'A');
INSERT INTO takes (ID, course_id, sec_id, semester, `year`, grade) VALUES('76543', 'CS-319', '2', 'Spring', '2018', 'A');
INSERT INTO takes (ID, course_id, sec_id, semester, `year`, grade) VALUES('76653', 'EE-181', '1', 'Spring', '2017', 'C');
INSERT INTO takes (ID, course_id, sec_id, semester, `year`, grade) VALUES('98765', 'CS-101', '1', 'Fall', '2017', 'C-');
INSERT INTO takes (ID, course_id, sec_id, semester, `year`, grade) VALUES('98765', 'CS-315', '1', 'Spring', '2018', 'B');
INSERT INTO takes (ID, course_id, sec_id, semester, `year`, grade) VALUES('98988', 'BIO-101', '1', 'Summer', '2017', 'A');
INSERT INTO takes (ID, course_id, sec_id, semester, `year`, grade) VALUES('98988', 'BIO-301', '1', 'Summer', '2018', NULL);

CREATE TABLE teaches (
  ID varchar(5) NOT NULL,
  course_id varchar(8) NOT NULL,
  sec_id varchar(8) NOT NULL,
  semester varchar(6) NOT NULL,
  year decimal(4,0) NOT NULL
) ;

INSERT INTO teaches (ID, course_id, sec_id, semester, `year`) VALUES('76766', 'BIO-101', '1', 'Summer', '2017');
INSERT INTO teaches (ID, course_id, sec_id, semester, `year`) VALUES('76766', 'BIO-301', '1', 'Summer', '2018');
INSERT INTO teaches (ID, course_id, sec_id, semester, `year`) VALUES('10101', 'CS-101', '1', 'Fall', '2017');
INSERT INTO teaches (ID, course_id, sec_id, semester, `year`) VALUES('45565', 'CS-101', '1', 'Spring', '2018');
INSERT INTO teaches (ID, course_id, sec_id, semester, `year`) VALUES('83821', 'CS-190', '1', 'Spring', '2017');
INSERT INTO teaches (ID, course_id, sec_id, semester, `year`) VALUES('83821', 'CS-190', '2', 'Spring', '2017');
INSERT INTO teaches (ID, course_id, sec_id, semester, `year`) VALUES('10101', 'CS-315', '1', 'Spring', '2018');
INSERT INTO teaches (ID, course_id, sec_id, semester, `year`) VALUES('45565', 'CS-319', '1', 'Spring', '2018');
INSERT INTO teaches (ID, course_id, sec_id, semester, `year`) VALUES('83821', 'CS-319', '2', 'Spring', '2018');
INSERT INTO teaches (ID, course_id, sec_id, semester, `year`) VALUES('10101', 'CS-347', '1', 'Fall', '2017');
INSERT INTO teaches (ID, course_id, sec_id, semester, `year`) VALUES('98345', 'EE-181', '1', 'Spring', '2017');
INSERT INTO teaches (ID, course_id, sec_id, semester, `year`) VALUES('12121', 'FIN-201', '1', 'Spring', '2018');
INSERT INTO teaches (ID, course_id, sec_id, semester, `year`) VALUES('32343', 'HIS-351', '1', 'Spring', '2018');
INSERT INTO teaches (ID, course_id, sec_id, semester, `year`) VALUES('15151', 'MU-199', '1', 'Spring', '2018');
INSERT INTO teaches (ID, course_id, sec_id, semester, `year`) VALUES('22222', 'PHY-101', '1', 'Fall', '2017');

CREATE TABLE time_slot (
  time_slot_id varchar(4) NOT NULL,
  day varchar(1) NOT NULL,
  start_hr decimal(2,0) NOT NULL,
  start_min decimal(2,0) NOT NULL,
  end_hr decimal(2,0) DEFAULT NULL,
  end_min decimal(2,0) DEFAULT NULL
) ;

INSERT INTO time_slot (time_slot_id, `day`, start_hr, start_min, end_hr, end_min) VALUES('A', 'F', '8', '0', '8', '50');
INSERT INTO time_slot (time_slot_id, `day`, start_hr, start_min, end_hr, end_min) VALUES('A', 'M', '8', '0', '8', '50');
INSERT INTO time_slot (time_slot_id, `day`, start_hr, start_min, end_hr, end_min) VALUES('A', 'W', '8', '0', '8', '50');
INSERT INTO time_slot (time_slot_id, `day`, start_hr, start_min, end_hr, end_min) VALUES('B', 'F', '9', '0', '9', '50');
INSERT INTO time_slot (time_slot_id, `day`, start_hr, start_min, end_hr, end_min) VALUES('B', 'M', '9', '0', '9', '50');
INSERT INTO time_slot (time_slot_id, `day`, start_hr, start_min, end_hr, end_min) VALUES('B', 'W', '9', '0', '9', '50');
INSERT INTO time_slot (time_slot_id, `day`, start_hr, start_min, end_hr, end_min) VALUES('C', 'F', '11', '0', '11', '50');
INSERT INTO time_slot (time_slot_id, `day`, start_hr, start_min, end_hr, end_min) VALUES('C', 'M', '11', '0', '11', '50');
INSERT INTO time_slot (time_slot_id, `day`, start_hr, start_min, end_hr, end_min) VALUES('C', 'W', '11', '0', '11', '50');
INSERT INTO time_slot (time_slot_id, `day`, start_hr, start_min, end_hr, end_min) VALUES('D', 'F', '13', '0', '13', '50');
INSERT INTO time_slot (time_slot_id, `day`, start_hr, start_min, end_hr, end_min) VALUES('D', 'M', '13', '0', '13', '50');
INSERT INTO time_slot (time_slot_id, `day`, start_hr, start_min, end_hr, end_min) VALUES('D', 'W', '13', '0', '13', '50');
INSERT INTO time_slot (time_slot_id, `day`, start_hr, start_min, end_hr, end_min) VALUES('E', 'R', '10', '30', '11', '45');
INSERT INTO time_slot (time_slot_id, `day`, start_hr, start_min, end_hr, end_min) VALUES('E', 'T', '10', '30', '11', '45');
INSERT INTO time_slot (time_slot_id, `day`, start_hr, start_min, end_hr, end_min) VALUES('F', 'R', '14', '30', '15', '45');
INSERT INTO time_slot (time_slot_id, `day`, start_hr, start_min, end_hr, end_min) VALUES('F', 'T', '14', '30', '15', '45');
INSERT INTO time_slot (time_slot_id, `day`, start_hr, start_min, end_hr, end_min) VALUES('G', 'F', '16', '0', '16', '50');
INSERT INTO time_slot (time_slot_id, `day`, start_hr, start_min, end_hr, end_min) VALUES('G', 'M', '16', '0', '16', '50');
INSERT INTO time_slot (time_slot_id, `day`, start_hr, start_min, end_hr, end_min) VALUES('G', 'W', '16', '0', '16', '50');
INSERT INTO time_slot (time_slot_id, `day`, start_hr, start_min, end_hr, end_min) VALUES('H', 'W', '10', '0', '12', '30');


ALTER TABLE advisor
  ADD PRIMARY KEY (s_ID);
--  ADD KEY i_ID (i_ID);

ALTER TABLE classroom
  ADD PRIMARY KEY (building,room_number);

ALTER TABLE course
  ADD PRIMARY KEY (course_id);
--  ADD KEY dept_name (dept_name);

ALTER TABLE department
  ADD PRIMARY KEY (dept_name);

ALTER TABLE instructor
  ADD PRIMARY KEY (ID);
--  ADD KEY dept_name (d;ept_name);

ALTER TABLE prereq
  ADD PRIMARY KEY (course_id,prereq_id);
--  ADD KEY prereq_id (prereq_id);

ALTER TABLE section
  ADD PRIMARY KEY (course_id,sec_id,semester,year);
--  ADD KEY building (building,room_number);

ALTER TABLE student
  ADD PRIMARY KEY (ID);
--  ADD KEY dept_name (dept_name);

ALTER TABLE takes
  ADD PRIMARY KEY (ID,course_id,sec_id,semester,year);
--  ADD KEY course_id (course_id,sec_id,semester,year);

ALTER TABLE teaches
  ADD PRIMARY KEY (ID,course_id,sec_id,semester,year);
--  ADD KEY course_id (course_id,sec_id,semester,year);

ALTER TABLE time_slot
  ADD PRIMARY KEY (time_slot_id,day) ;


ALTER TABLE advisor
  ADD CONSTRAINT advisor_ibfk_1 FOREIGN KEY (i_ID) REFERENCES instructor (ID) ON DELETE SET NULL,
  ADD CONSTRAINT advisor_ibfk_2 FOREIGN KEY (s_ID) REFERENCES student (ID) ON DELETE CASCADE;

ALTER TABLE course
  ADD CONSTRAINT course_ibfk_1 FOREIGN KEY (dept_name) REFERENCES department (dept_name) ON DELETE SET NULL;

ALTER TABLE instructor
  ADD CONSTRAINT instructor_ibfk_1 FOREIGN KEY (dept_name) REFERENCES department (dept_name) ON DELETE SET NULL;

ALTER TABLE prereq
  ADD CONSTRAINT prereq_ibfk_1 FOREIGN KEY (course_id) REFERENCES course (course_id) ON DELETE CASCADE,
  ADD CONSTRAINT prereq_ibfk_2 FOREIGN KEY (prereq_id) REFERENCES course (course_id);

ALTER TABLE section
  ADD CONSTRAINT section_ibfk_1 FOREIGN KEY (course_id) REFERENCES course (course_id) ON DELETE CASCADE,
  ADD CONSTRAINT section_ibfk_2 FOREIGN KEY (building,room_number) REFERENCES classroom (building, room_number) ON DELETE SET NULL,

ALTER TABLE student
  ADD CONSTRAINT student_ibfk_1 FOREIGN KEY (dept_name) REFERENCES department (dept_name) ON DELETE SET NULL;

ALTER TABLE takes
  ADD CONSTRAINT takes_ibfk_1 FOREIGN KEY (course_id,sec_id,semester,year) REFERENCES section (course_id, sec_id, semester, year) ON DELETE CASCADE,
  ADD CONSTRAINT takes_ibfk_2 FOREIGN KEY (ID) REFERENCES student (ID) ON DELETE CASCADE;

ALTER TABLE teaches
  ADD CONSTRAINT teaches_ibfk_1 FOREIGN KEY (course_id,sec_id,semester,year) REFERENCES section (course_id, sec_id, semester, year) ON DELETE CASCADE,
  ADD CONSTRAINT teaches_ibfk_2 FOREIGN KEY (ID) REFERENCES instructor (ID) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
