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
𝑆𝑇𝑈𝐷𝐸𝑁𝑇1 = 𝜎𝑆𝐼𝐷≥’’𝑆3’’(STUDENT)
𝑆𝑇𝑈𝐷𝐸𝑁𝑇2 = 𝜎 ’’𝑆1’’≤𝑆𝐼𝐷<’’𝑆3’’(STUDENT)
𝑆𝑇𝑈𝐷𝐸𝑁𝑇3 = 𝜎𝑆𝐼𝐷<’’𝑆1’’(STUDENT)
relation MARK is indirectly fragmented as：
𝑀𝐴𝑅𝐾1 = 𝑀𝐴𝑅𝐾⋉𝑆𝐼𝐷(𝑆𝑇𝑈𝐷𝐸𝑁𝑇2)
𝑀𝐴𝑅𝐾2 = 𝑀𝐴𝑅𝐾⋉𝑆𝐼𝐷(𝑆𝑇𝑈𝐷𝐸𝑁𝑇1)
𝑀𝐴𝑅𝐾3 = 𝑀𝐴𝑅𝐾⋉𝑆𝐼𝐷(𝑆𝑇𝑈𝐷𝐸𝑁𝑇3)
and relation COURSE is vertically fragmented as：
𝐶𝑂𝑈𝑅𝑆𝐸1 = ∏𝐶𝐼𝐷,𝐶𝑁𝐴𝑀𝐸(𝐶𝑂𝑈𝑅𝑆𝐸)
𝐶𝑂𝑈𝑅𝑆𝐸2 = ∏𝐶𝐼𝐷,𝐶𝐶𝑂𝑁𝑇𝐸𝑋𝑇(𝐶𝑂𝑈𝑅𝑆𝐸)

STUDENT1 U STUDENT2 U STUDENT3

MARK1 ⋉ STUDENT2 U
MARK2 ⋉ STUDNET1 U
MARK3 ⋉ STUDENT3

COURSE1 ⋉ COURSE2
