DROP TABLE IF EXISTS course;
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS enroll;
DROP TABLE IF EXISTS grades;

CREATE TABLE course
(
    name     VARCHAR(255),
    semester CHAR(3),
    time     VARCHAR(63),
    location VARCHAR(63),
    capacity INTEGER,
    PRIMARY KEY (name, semester)
);

CREATE TABLE student
(
    name  VARCHAR(255),
    email VARCHAR(255) PRIMARY KEY,
    major CHAR(4)
);

CREATE TABLE enroll
(
    student_email VARCHAR(255),
    course_name   VARCHAR(255),
    semester      CHAR(3),
    registered    TIMESTAMP DEFAULT now()
);

CREATE TABLE grades
(
    student_email VARCHAR(255),
    course_name   VARCHAR(255),
    semester      CHAR(3),
    assignment    VARCHAR(255),
    comments      TEXT,
    grade         FLOAT
);

INSERT INTO course(name, semester, time, location, capacity)
VALUES ('Database Applications and Systems', 'F20', 'W4-7', 'Remote', 30);

INSERT INTO course(name, semester, time, location, capacity)
VALUES ('Database Systems', 'S20', 'mr-4-6', 'DCC-318', 180);

INSERT INTO course(name, semester, time, location, capacity)
VALUES ('Database Systems', 'F19', 'w6-9', 'LOW-3039', 25);

INSERT INTO course(name, semester, time, location, capacity)
VALUES ('Operating Systems', 'F20', 'tf10-12', 'DCC-308', 200);

INSERT INTO course(name, semester, time, location, capacity)
VALUES ('Data Mining', 'F20', 'mr8-10', 'SAGE-2308', 25);

INSERT INTO course(name, semester, time, location, capacity)
VALUES ('Tech Studies', 'S19', 't6-9', 'LOW-3039', 10);

INSERT INTO course(name, semester, time, location, capacity)
VALUES ('Database Systems', 'S19', 'mr4-6', 'DCC-318', 168);


INSERT INTO course(name, semester, time, location, capacity)
VALUES ('Database Systems', 'F18', 'w6-9', 'LOW-3039', 20);


INSERT INTO course(name, semester, time, location, capacity)
VALUES ('Operating Systems', 'F19', 'tf10-12', 'DCC-318', 200);


INSERT INTO course(name, semester, time, location, capacity)
VALUES ('Programming Languages', 'S19', 'mr12-2', 'DCC-318', 120);

INSERT INTO student(name, email, major)
VALUES ('alice', 'alice@example.com', 'ITWS');


INSERT INTO student(name, email, major)
VALUES ('bob', 'bob@example.com', 'ITWS');


INSERT INTO student(name, email, major)
VALUES ('carol', 'carol@example.co.uk', 'MATH');

INSERT INTO enroll(student_email, course_name, semester)
VALUES ('alice@example.com', 'Database Applications and Systems', 'F20');

INSERT INTO enroll(student_email, course_name, semester, registered)
VALUES ('bob@example.com', 'Database Applications and Systems', 'F20', '2020-07-30');

INSERT INTO enroll(student_email, course_name, semester)
VALUES ('carol@example.co.uk', 'Tech Studies', 'S19');

INSERT INTO enroll(student_email, course_name, semester)
VALUES ('carol@example.co.uk', 'Operating Systems', 'F20');

INSERT INTO grades(student_email, course_name, semester, assignment, comments, grade)
VALUES ('alice@example.com', 'Database Applications and Systems', 'F20', 'HW-1', NULL, .8);

INSERT INTO grades(student_email, course_name, semester, assignment, comments, grade)
VALUES ('alice@example.com', 'Database Applications and Systems', 'F20', 'HW-2', NULL, .7);

INSERT INTO grades(student_email, course_name, semester, assignment, comments, grade)
VALUES ('bob@example.com', 'Database Applications and Systems', 'F20', 'HW-1', NULL, .9);

INSERT INTO grades(student_email, course_name, semester, assignment, comments, grade)
VALUES ('bob@example.com', 'Database Applications and Systems', 'F20', 'HW-2', NULL, .55);