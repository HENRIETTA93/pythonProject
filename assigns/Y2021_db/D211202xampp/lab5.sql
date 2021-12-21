INSERT INTO Course VALUES ('QMDS 100', 'Business Mathematics');
DELETE FROM Course WHERE CourseName='Business Mathematics';

UPDATE Course SET CourseName='Database Management' WHERE Course_ID = 'ISM 4212';

SELECT Faculty_Name FROM Faculty WHERE Faculty_ID='4756';

SELECT MIN(Section_No) FROM Section WHERE Semester='I-2008';

 SELECT MIN(Age) FROM Student WHERE Nationality!='Macao';

SELECT Department FROM Student WHERE Nationality!= 'Macao'
GROUP BY Department HAVING MIN(Age)>=19;

 SELECT Department FROM Student WHERE Nationality!= 'Macao'
 AND Department NOT IN (SELECT Department FROM Student WHERE Age<19);

 SELECT Department FROM Student WHERE Nationality NOT IN ('Macao')
 AND Department NOT IN (SELECT Department FROM Student WHERE Age<19);

SELECT Department FROM Student WHERE Nationality NOT IN ('Macao')
GROUP BY Department HAVING MIN(Age)>=19;