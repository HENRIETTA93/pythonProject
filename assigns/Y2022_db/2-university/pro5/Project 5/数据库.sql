-- Project 3 Solution
-- Based on assignment submission by Theodore Okamura
-- If you'd like to use this solution, simply import this file into phpMyAdmin. Make sure that you _uncheck_ "Enable foreign key checks" checkbox under "Other options," otherwise, you may get an FK violation error.

DROP TABLE IF EXISTS band;
CREATE TABLE band
( 
	name VARCHAR(100) PRIMARY KEY,
	genre VARCHAR(50), 
	date_of_formation DATE
);

DROP TABLE IF EXISTS musician;
CREATE TABLE musician
(
	ID INTEGER PRIMARY KEY AUTO_INCREMENT,
	band_name VARCHAR(100),
	f_name VARCHAR(50),
  	m_initial VARCHAR(1),
  	l_name VARCHAR(50),
	dob DATE,
	nationality VARCHAR(60),
	years_exp INTEGER,
	FOREIGN KEY (band_name) REFERENCES band(name) ON DELETE SET NULL
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
	name VARCHAR(100),
	composer INTEGER,
  	lyrics varchar(10000),
  	duration INTEGER,
	style VARCHAR(100),
	PRIMARY KEY (name, composer),
	FOREIGN KEY (composer) REFERENCES musician(ID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS set_list;
CREATE TABLE set_list
(
	band_name VARCHAR(100),
	conc_ID INTEGER,
  	song_name VARCHAR(100),
	composer INTEGER,
	PRIMARY KEY (band_name, conc_ID, song_name, composer),
	FOREIGN KEY (band_name) REFERENCES band(name) ON DELETE CASCADE,
	FOREIGN KEY (conc_ID) REFERENCES concert(ID) ON DELETE CASCADE,
	FOREIGN KEY (song_name, composer) REFERENCES song(name, composer) ON DELETE CASCADE
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
