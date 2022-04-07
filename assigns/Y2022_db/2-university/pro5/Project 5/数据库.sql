-- Project 3 Solution
-- Based on assignment submission by Theodore Okamura
-- If you'd like to use this solution, simply import this file into phpMyAdmin. Make sure that you _uncheck_ "Enable foreign key checks" checkbox under "Other options," otherwise, you may get an FK violation error.

DROP TABLE IF EXISTS band;
CREATE TABLE band
(
    ID int primary key auto_increment,
	name VARCHAR(100),
	genre VARCHAR(50), 
	date_of_formation DATE
);

DROP TABLE IF EXISTS musician;
CREATE TABLE musician
(
	ID INTEGER PRIMARY KEY AUTO_INCREMENT,
	band int,
	f_name VARCHAR(50),
  	m_initial VARCHAR(1),
  	l_name VARCHAR(50),
	dob DATE,
	nationality VARCHAR(60),
	years_exp INTEGER,
	FOREIGN KEY (band) REFERENCES band(ID) ON DELETE SET NULL
);

DROP TABLE IF EXISTS concert;
CREATE TABLE concert
(
	ID INTEGER PRIMARY KEY AUTO_INCREMENT,
	date DATE NOT NULL,
	st_addr VARCHAR(100),
	city VARCHAR(50),
  	state VARCHAR(20),
	country VARCHAR(100),
  	capacity INTEGER
);

DROP TABLE IF EXISTS song;
CREATE TABLE song
(
    ID int primary key auto_increment,
	name VARCHAR(100),
	composer INTEGER,
  	lyrics varchar(10000),
  	duration INTEGER,
	style VARCHAR(100),
	FOREIGN KEY (composer) REFERENCES musician(ID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS set_list;


create table set_list(
 ID int primary key auto_increment,
 band int,
 conc_ID int,
 song int,
 	FOREIGN KEY (band) REFERENCES band(ID) ON DELETE CASCADE,
	FOREIGN KEY (conc_ID) REFERENCES concert(ID) ON DELETE CASCADE,
	FOREIGN KEY (song) REFERENCES song(ID) ON DELETE CASCADE

);

DROP TABLE IF EXISTS vocalist;
CREATE TABLE vocalist
(
	ID INTEGER PRIMARY KEY,
	vocal_range VARCHAR(50),
  	FOREIGN KEY (ID) REFERENCES musician(ID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS language;
CREATE TABLE language
(
  	ID INTEGER,
	language VARCHAR(100),
	PRIMARY KEY (ID, language),
	FOREIGN KEY (ID) REFERENCES vocalist(ID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS instrumentalist;
CREATE TABLE instrumentalist
(
  	ID INTEGER PRIMARY KEY,
	handedness VARCHAR(20),
	FOREIGN KEY (ID) REFERENCES musician(ID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS instrument;
CREATE TABLE instrument
(
	name VARCHAR(100) PRIMARY KEY,
	type VARCHAR(100)
);

DROP TABLE IF EXISTS plays;
CREATE TABLE plays
(
	instr_ID INTEGER,
	instrument VARCHAR(100),
	PRIMARY KEY (instr_ID, instrument),
	FOREIGN KEY (instr_ID) REFERENCES instrumentalist(ID) ON DELETE CASCADE,
	FOREIGN KEY (instrument) REFERENCES instrument(name) ON DELETE CASCADE
);


--
DROP TABLE IF EXISTS plays;
DROP TABLE IF EXISTS instrument;
DROP TABLE IF EXISTS instrumentalist;
DROP TABLE IF EXISTS language;
DROP TABLE IF EXISTS vocalist;
DROP TABLE IF EXISTS set_list;
DROP TABLE IF EXISTS song;
DROP TABLE IF EXISTS concert;
DROP TABLE IF EXISTS musician;
DROP TABLE IF EXISTS band;

--
select count(*) from band;
select count(*) from song;
select count(*) from concert;
select count(*) from set_list;