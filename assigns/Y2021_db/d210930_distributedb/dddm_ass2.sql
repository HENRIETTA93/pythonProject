-- Question 1

(1)
SELECT STUDENT.SNAME, COURSE.CNAME
FROM STUDENT JOIN MARK ON STUDENT.SID=MARK.SID
JOIN COURSE ON COURSE.CID=MARK.CID
WHERE MAKR.SCORE>85;
SELECT STUDENT.SNAME, COURSE.CNAME
FROM STUDENT, MARK, COURSE
WHERE STUDENT.SID=MARK.SID AND COURSE.CID=MARK.CID
AND MAKR.SCORE>85;



-- Question 2

SELECT SNAME, CNAME
FROM STUDENT, COURSE, MARK
WHERE (SAGE <16
OR MARK.CID <'C2')
AND (CCONTEXT = 'Science'
OR SCORE > 85)
AND STUDENT.SID = MARK.SID
AND (CCONTEXT = 'Science'
OR SCORE <= 85)
AND COURSE.CID=MARK.CID;

(1)
SELECT SNAME, CNAME
FROM STUDENT JOIN MARK ON STUDENT.SID=MARK.SID
JOIN COURSE ON COURSE.CID=MARK.CID
WHERE (SAGE<16 OR MARK.CID<'C2')
AND CCONTEXT='Science';


-- Question 3
SELECT CNAME
FROM STUDENT, COURSE, MARK
WHERE STUDENT.SID = MARK.SID
AND COURSE.CID = MARK.CID
AND SNAME = "James"

Assume that relation STUDENT of the sample database is horizontally fragmented:
ππππ·πΈππ1 = πππΌπ·β₯ββπ3ββ(STUDENT)
ππππ·πΈππ2 = π ββπ1βββ€ππΌπ·<ββπ3ββ(STUDENT)
ππππ·πΈππ3 = πππΌπ·<ββπ1ββ(STUDENT)
relation MARK is indirectly fragmented asοΌ
ππ΄ππΎ1 = ππ΄ππΎβππΌπ·(ππππ·πΈππ2)
ππ΄ππΎ2 = ππ΄ππΎβππΌπ·(ππππ·πΈππ1)
ππ΄ππΎ3 = ππ΄ππΎβππΌπ·(ππππ·πΈππ3)
and relation COURSE is vertically fragmented asοΌ
πΆπππππΈ1 = βπΆπΌπ·,πΆππ΄ππΈ(πΆπππππΈ)
πΆπππππΈ2 = βπΆπΌπ·,πΆπΆππππΈππ(πΆπππππΈ)

STUDENT1 U STUDENT2 U STUDENT3

MARK1 β STUDENT2 U
MARK2 β STUDNET1 U
MARK3 β STUDENT3

COURSE1 β COURSE2
