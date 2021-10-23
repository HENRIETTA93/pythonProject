/* 
THIS SCRIPT IS CALLED 'REFRESHDATA' FOR A REASON. IT WILL RETURN
YOUR DATA IN YOUR DATABASE (IF PROPERLY CONSTRUCTED) TO THE REQUIRED STATE 
FOR SUBMISSION.

YOU MAY RUN THIS AS MANY TIMES AS YOU WANT, IT FIRST ERASES ALL DATA ALONG 
WITH ANY CHANGES OR ADDITIONS AND THEN REINSERTS THE ORIGINAL DATA WITH NO CHANGES.

IF YOU HAVE (OR MIGHT HAVE) CHANGED ANY OF THE SUPPLIED DATA, YOU MUST RUN 
THIS SCRIPT AGAIN PRIOR TO SUBMISSION
*/

COMMIT;
REM EMPTY ALL DATA ***WARNING***

DELETE FROM CONF_TRACKS;
DELETE FROM MEMB_ACADEMIC;
DELETE FROM INDIV_MEMBER;
DELETE FROM CONFERENCE;

--------------------------------------------------------

REM INSERTING into INDIV_MEMBER
SET DEFINE OFF;

insert into indiv_member (i_username, firstname, lastname, email, joindate, title, gender, organization, website, country, year_birth, receive_emails_flag, member_type) values ('gwash', 'George', 'Washington', 'gwash@kent.edu', '01-JAN-1996', NULL, 'Man', 'Kent State University', 'http://www.kent.edu', 'USA', to_date('1950', 'YYYY'), 'Y', 'A');

insert into indiv_member (i_username, firstname, lastname, email, joindate, title, gender, organization, website, country, year_birth, receive_emails_flag, member_type) values ('johnadams', 'John', 'Adams', 'jadams@uga.edu', '21-MAY-2001', 'Dr.', 'Man', 'University of Georgia', 'http://www.uga.edu', 'USA', to_date('1960', 'YYYY'), 'N', 'A');

insert into indiv_member (i_username, firstname, lastname, email, joindate, title, gender, organization, website, country, year_birth, receive_emails_flag, member_type) values ('tjeff1', 'Tom', 'Jefferson', 'tj1@osu.edu', '30-DEC-1997', 'Dr.', 'Prefer not to indicate', 'Ohio State University', 'http://www.osu.edu', 'Canada', to_date('1935', 'YYYY'), 'Y', 'A');

insert into indiv_member (i_username, firstname, lastname, email, joindate, title, gender, organization, website, country, year_birth, receive_emails_flag, member_type) values ('jimmad', 'James', 'Madison', 'jimmad@gsu.edu', '01-JAN-1997', 'Mr.', 'Man', 'Georgia State University', 'http://www.gsu.edu', 'USA', NULL, 'N', 'A');

insert into indiv_member (i_username, firstname, lastname, email, joindate, title, gender, organization, website, country, year_birth, receive_emails_flag, member_type) values ('jmonroe76', 'Jamie', 'Monroe', 'jmon@gwu.edu', '23-AUG-1999', 'Ms.', 'Woman', 'George Washington University', 'http://www.gwu.edu', 'Canada', to_date('1972', 'YYYY'), 'Y', 'A');

insert into indiv_member (i_username, firstname, lastname, email, joindate, title, gender, organization, website, country, year_birth, receive_emails_flag, member_type) values ('jqa1776', 'JQ', 'Adams', 'jqa1776@kent.edu', DEFAULT, NULL, 'Prefer to self-describe', 'Kent State University', NULL, DEFAULT, to_date('1950', 'YYYY'), 'Y', 'A');

insert into indiv_member (i_username, firstname, lastname, email, joindate, title, gender, organization, website, country, year_birth, receive_emails_flag, member_type) values ('ajax1', 'Andrew', 'Jackson', 'ajax1@ucla.edu', DEFAULT, 'Dr.', 'Non-binary', 'UCLA', 'http://www.ucla.edu', 'Mexico', to_date('1975', 'YYYY'), 'N', 'A');

insert into indiv_member (i_username, firstname, lastname, email, joindate, title, gender, organization, website, country, year_birth, receive_emails_flag, member_type) values ('MVB', 'Martina', 'Van Buren', 'MVB@uva.edu', '31-OCT-2017', 'Dr.', 'Woman', 'University of Virgina', 'http://www.uva.edu', DEFAULT, to_date('1990', 'YYYY'), 'N', 'A');

insert into indiv_member (i_username, firstname, lastname, email, joindate, title, gender, organization, website, country, year_birth, receive_emails_flag, member_type) values ('whh123', 'William Henry', 'Harrison', 'whh123@kent.edu', '03-APR-2003', 'Dr.', 'Man', 'Kent State University', 'http://www.kent.edu', 'USA', to_date('1945', 'YYYY'), 'Y', 'A');

insert into indiv_member (i_username, firstname, lastname, email, joindate, title, gender, organization, website, country, year_birth, receive_emails_flag, member_type) values ('tyler', 'Joni', 'Tyler', 'jt1@fsu.edu', DEFAULT, 'Mrs.', 'Woman', 'Florida State University', 'http://www.fsu.edu', DEFAULT, to_date('1973', 'YYYY'), 'Y', 'A');

insert into indiv_member (i_username, firstname, lastname, email, joindate, title, gender, organization, website, country, year_birth, receive_emails_flag, member_type) values ('polkadot', 'James', 'Polk', 'jp123@mcc.edu', '01-JAN-2020', 'Mr.', 'Prefer not to indicate', 'Manatee Community College', 'http://www.mcc.edu', 'USA', to_date('1994', 'YYYY'), 'Y', 'S');

insert into indiv_member (i_username, firstname, lastname, email, joindate, title, gender, organization, website, country, year_birth, receive_emails_flag, member_type) values ('zach', 'Zachary', 'Taylor', 'zach@kent.edu', '20-MAR-2021', 'Mr.', 'Man', 'Kent State University', 'http://www.kent.edu', DEFAULT, to_date('2000', 'YYYY'), 'Y', 'S');

insert into indiv_member (i_username, firstname, lastname, email, joindate, title, gender, organization, website, country, year_birth, receive_emails_flag, member_type) values ('millie001', 'Millie', 'Filmore', 'mfilmore@kent.edu', DEFAULT, NULL, 'Woman', 'Kent State University', NULL, 'USA', NULL, 'N', 'S');

insert into indiv_member (i_username, firstname, lastname, email, joindate, title, gender, organization, website, country, year_birth, receive_emails_flag, member_type) values ('frankie', 'Franklin', 'Pierce', 'fpierce2@uva.edu', '15-JUL-2018', 'Mr.', 'Man', 'University of Virginia', 'http://www.uva.edu', 'England', to_date('1999', 'YYYY'), 'N', 'S');

insert into indiv_member (i_username, firstname, lastname, email, joindate, title, gender, organization, website, country, year_birth, receive_emails_flag, member_type) values ('jbuch1', 'Jamie', 'Buchanan', 'jbuch1@usf.edu', '18-JAN-1999', 'Miss', 'Woman', 'Univ of South Florida', 'http://www.usf.edu', 'USA', to_date('1980', 'YYYY'), 'Y', 'S');

insert into indiv_member (i_username, firstname, lastname, email, joindate, title, gender, organization, website, country, year_birth, receive_emails_flag, member_type) values ('ronnie01', 'Ronald', 'Reagan', 'reagan1@ucla.edu', '01-JAN-1996', 'Mr.', 'Man', 'UCLA', 'http://www.ucla.edu', 'USA', to_date('1950', 'YYYY'), 'Y', 'M');

insert into indiv_member (i_username, firstname, lastname, email, joindate, title, gender, organization, website, country, year_birth, receive_emails_flag, member_type) values ('slick', 'Bill', 'Clinton', 'bclinton@uark.edu', '10-SEP-2018', NULL, 'Man', 'Univ of Arkansas', NULL, 'USA', NULL, 'N', 'M');

insert into indiv_member (i_username, firstname, lastname, email, joindate, title, gender, organization, website, country, year_birth, receive_emails_flag, member_type) values ('gwbush01', 'George W', 'Bush', 'gbush01@ut.edu', '20-FEB-2020', 'Mr.', 'Man', 'University of Texas', 'http://www.ut.edu', DEFAULT, to_date('1938', 'YYYY'), 'N', 'M');

insert into indiv_member (i_username, firstname, lastname, email, joindate, title, gender, organization, website, country, year_birth, receive_emails_flag, member_type) values ('dtrump', 'Donald', 'Trump', 'dtrump5@nyu.edu', '01-JAN-1997', 'Mr.', 'Man', 'New York University', NULL, 'USA', to_date('1945', 'YYYY'), 'Y', 'M');

insert into indiv_member (i_username, firstname, lastname, email, joindate, title, gender, organization, website, country, year_birth, receive_emails_flag, member_type) values ('josie', 'Josephine', 'Biden', 'jbiden100@kent.edu', DEFAULT, 'Mr.', 'Woman', 'University of Delaware', 'http://www.udel.edu', 'USA', NULL, 'Y', 'M');


REM INSERTING into MEMB_ACADEMIC
SET DEFINE OFF;

insert into memb_academic (a_username, primary_teach_field, diss_title, directory_flag, agree_code_conduct, agree_code_research) values ('gwash', 'Project Mgmt', 'I Cannot Tell a Lie: I Do Not Have a Dissertation', 'YES', 'Y', 'Y');

insert into memb_academic (a_username, primary_teach_field, diss_title, directory_flag, agree_code_conduct, agree_code_research) values ('johnadams', 'Artifical Intelligence', NULL, 'YES', 'Y', 'Y');

insert into memb_academic (a_username, primary_teach_field, diss_title, directory_flag, agree_code_conduct, agree_code_research) values ('tjeff1', 'Text Mining', 'Lessons from Political Sentiment Analysis on Twitter During the 2020 Election Season', 'NO', 'Y', 'Y');

insert into memb_academic (a_username, primary_teach_field, diss_title, directory_flag, agree_code_conduct, agree_code_research) values ('jimmad', 'Systems Analysis and Design', 'Comparing Agile Systems Development Techniques', 'YES', 'Y', 'Y');

insert into memb_academic (a_username, primary_teach_field, diss_title, directory_flag, agree_code_conduct, agree_code_research) values ('jmonroe76', 'Database Mgmt', NULL, 'NO', 'N', 'Y');

insert into memb_academic (a_username, primary_teach_field, diss_title, directory_flag, agree_code_conduct, agree_code_research) values ('jqa1776', 'Java Programming', 'Effect of Developer Emotional State on Coding Errors', 'YES', 'Y', 'Y');

insert into memb_academic (a_username, primary_teach_field, diss_title, directory_flag, agree_code_conduct, agree_code_research) values ('ajax1', 'Bitcoin Technology', NULL, 'YES', 'Y', 'Y');

insert into memb_academic (a_username, primary_teach_field, diss_title, directory_flag, agree_code_conduct, agree_code_research) values ('MVB', 'Project Mgmt', 'Managing Agile Development Teams', 'YES', 'N', 'N');

insert into memb_academic (a_username, primary_teach_field, diss_title, directory_flag, agree_code_conduct, agree_code_research) values ('whh123', 'C# Programming', 'Resistance to Technological Change Among Programmers', 'NO', 'Y', 'Y');

insert into memb_academic (a_username, primary_teach_field, diss_title, directory_flag, agree_code_conduct, agree_code_research) values ('tyler', 'Database Mgmt', NULL, 'YES', 'Y', 'Y');


REM INSERTING into CONFERENCE
SET DEFINE OFF;

insert into conference (conf_id, conf_name, conf_start_date, conf_end_date, conf_city, conf_country, conf_site_name) values (1, 'ICIS 2018', '06-DEC-2018', '10-DEC-2018', 'San Francisco', DEFAULT, NULL);

insert into conference (conf_id, conf_name, conf_start_date, conf_end_date, conf_city, conf_country, conf_site_name) values (2, 'ICIS 2019', '10-DEC-2019', '14-DEC-2019', 'Munich', 'Germany', 'Internationales Conference Center');

insert into conference (conf_id, conf_name, conf_start_date, conf_end_date, conf_city, conf_country, conf_site_name) values (3, 'ICIS 2020', '12-DEC-2020', '15-DEC-2020', 'Hyderabad', 'India', 'Virtual');

insert into conference (conf_id, conf_name, conf_start_date, conf_end_date, conf_city, conf_country, conf_site_name) values (4, 'ICIS 2021', '12-DEC-2021', '15-DEC-2021', 'Austin', 'USA', 'Hilton Conference Center');

insert into conference (conf_id, conf_name, conf_start_date, conf_end_date, conf_city, conf_country, conf_site_name) values (5, 'ICIS 2022', NULL, NULL, 'Copenhagen', 'Denmark', NULL);

insert into conference (conf_id, conf_name, conf_start_date, conf_end_date, conf_city, conf_country, conf_site_name) values (6, 'AMCIS 2021', '09-AUG-2021', '13-AUG-2021', 'Montreal', 'Canada', 'Virtual');

insert into conference (conf_id, conf_name, conf_start_date, conf_end_date, conf_city, conf_country, conf_site_name) values (7, 'AMCIS 2022', '11-AUG-2022', '13-AUG-2022', 'Minneapolis', DEFAULT, NULL);

insert into conference (conf_id, conf_name, conf_start_date, conf_end_date, conf_city, conf_country, conf_site_name) values (8, 'ECIS 2019', '17-JUN-2019', '20-JUN-2019', 'Stockholm', 'Sweden', NULL);

insert into conference (conf_id, conf_name, conf_start_date, conf_end_date, conf_city, conf_country, conf_site_name) values (9, 'PACIS 2021', '20-JUN-2021', '24-JUN-2021', 'Dubai', 'UAE', NULL);

insert into conference (conf_id, conf_name, conf_start_date, conf_end_date, conf_city, conf_country, conf_site_name) values (10, 'PACIS 2018', '15-JUN-2018', '19-JUN-2018', 'Yokohama', 'Japan', NULL);



REM INSERTING into CONF_TRACKS
SET DEFINE OFF;

insert into conf_tracks (track_conf_id, track_name, track_chair, submission_deadline, number_submissions, number_accepted_papers) values (4, 'General IS Topics', 'gwash', '10-JUN-2021', 127, 20);

insert into conf_tracks (track_conf_id, track_name, track_chair, submission_deadline, number_submissions, number_accepted_papers) values (4, 'Societal Impacts of IS', 'johnadams', '10-JUN-2021', 32, 6);

insert into conf_tracks (track_conf_id, track_name, track_chair, submission_deadline, number_submissions, number_accepted_papers) values (4, 'AI in Business and Society', 'jimmad', '10-JUN-2021', 40, 5);

insert into conf_tracks (track_conf_id, track_name, track_chair, submission_deadline, number_submissions, number_accepted_papers) values (4, 'IS Implementation', 'ajax1', '10-JUN-2021', 35, 3);

insert into conf_tracks (track_conf_id, track_name, track_chair, submission_deadline, number_submissions, number_accepted_papers) values (4, 'Blockchain and Fintech', 'MVB', '10-JUN-2021', 15, 3);

insert into conf_tracks (track_conf_id, track_name, track_chair, submission_deadline, number_submissions, number_accepted_papers) values (6, 'Cognitive Research in IS', 'tyler', '04-FEB-2021', 82, 20);

insert into conf_tracks (track_conf_id, track_name, track_chair, submission_deadline, number_submissions, number_accepted_papers) values (6, 'Digital Agility', 'tjeff1', '04-FEB-2021', 10, 6);

insert into conf_tracks (track_conf_id, track_name, track_chair, submission_deadline, number_submissions, number_accepted_papers) values (6, 'Social Computing', 'jqa1776', '04-FEB-2021', 62, 12);

insert into conf_tracks (track_conf_id, track_name, track_chair, submission_deadline, number_submissions, number_accepted_papers) values (3, 'General IS Topics', 'gwash', '05-JUN-2020', 93, 15);

insert into conf_tracks (track_conf_id, track_name, track_chair, submission_deadline, number_submissions, number_accepted_papers) values (3, 'Blockchain and Fintech', 'whh123', '05-JUN-2020', 19, 4);


commit;