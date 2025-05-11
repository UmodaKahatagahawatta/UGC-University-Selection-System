use uniaddmission;

-- 1

SELECT Stu_ID FROM student
UNION
SELECT Stu_ID FROM submited_Doc_status;



-- 2
SELECT Stu_ID FROM student
EXCEPT
SELECT Stu_ID FROM submited_Doc_status;

-- 3
SELECT Stu_ID FROM student
INTERSECT
SELECT Stu_ID FROM submited_Doc_status;


-- 4 
SELECT Stu_ID FROM student
WHERE Stu_ID NOT IN (
    SELECT Stu_ID FROM submited_Doc_status
);

-- 5
SELECT * FROM student_details
INNER JOIN submited_Doc_status ON student_details.Stu_ID = submited_Doc_status.Stu_ID;

-- 6
SELECT * FROM student_details;

-- 7
SELECT * FROM student_details
LEFT JOIN submited_Doc_status ON student_details.Stu_ID = submited_Doc_status.Stu_ID;

-- 8
SELECT * FROM student_details
RIGHT JOIN submited_Doc_status ON student_details.Stu_ID = submited_Doc_status.Stu_ID;

-- 9
SELECT * 
FROM student_details
LEFT OUTER JOIN submited_Doc_status ON student_details.Stu_ID = submited_Doc_status.Stu_ID

UNION

SELECT * 
FROM student_details
RIGHT OUTER JOIN submited_Doc_status ON student_details.Stu_ID = submited_Doc_status.Stu_ID
WHERE student_details.Stu_ID IS NULL;

-- 10
SELECT Stu_ID, First_Name, Last_Name, Street, City, District, NULL AS Doc_ID, NULL AS Verified_Status
FROM student_details

UNION

SELECT NULL AS Stu_ID, NULL AS First_Name, NULL AS Last_Name, NULL AS Street, NULL AS City, NULL AS District, Doc_ID, Verified_Status
FROM submited_Doc_status;

-- 11
SELECT student_details.Stu_ID AS student_Stu_ID, 
       student_details.First_Name, 
       student_details.Last_Name, 
       student_details.Street, 
       student_details.City, 
       student_details.District,
       submited_Doc_status.Stu_ID AS doc_Stu_ID,
       submited_Doc_status.Doc_ID,
       submited_Doc_status.Verified_Status
FROM student_details
LEFT JOIN submited_Doc_status ON student_details.Stu_ID = submited_Doc_status.Stu_ID;

-- 12
SELECT Stu_ID
FROM (
    SELECT Stu_ID FROM student_details
    UNION
    SELECT Stu_ID FROM submited_Doc_status
) AS Unioned_Students;



-- 13
SELECT Stu_ID, First_Name, Last_Name FROM student
INTERSECT
SELECT Stu_ID, First_Name, Last_Name FROM student WHERE District = 'Nuweraeliya';

-- 14 names of students who have submitted 2 or more documents

SELECT s.First_Name, s.Last_Name
FROM student s
JOIN submited_Doc_status sd ON s.Stu_ID = sd.Stu_ID
GROUP BY s.Stu_ID
HAVING COUNT(sd.Doc_ID) >= 2;

-- 15. Retrieve the total amount paid by each student:

SELECT s.First_Name, s.Last_Name, SUM(pd.Amount) AS Total_Paid
FROM student s
LEFT JOIN Paid_Payment_Details ppd ON s.Stu_ID = ppd.Stu_ID
LEFT JOIN Payment_Details pd ON ppd.Pay_ID = pd.Pay_ID
GROUP BY s.Stu_ID;


-- 16 Retrieve the names of students who have applied for a scholarship and have been accepted:
SELECT s.First_Name, s.Last_Name
FROM Student s
JOIN Application_Details ad ON s.Stu_ID = ad.Stu_ID
JOIN Adminstaive_Details adt ON ad.App_ID = adt.App_ID
WHERE adt.Schol_status = 1;

-- 17 Retrieve the names of students who have applied for a course at a university but haven't been reviewed yet:
SELECT first_name , last_name FROM student s 
INNER JOIN application_details ap 
ON ap.Stu_ID = s.Stu_ID 
INNER JOIN adminstaive_details ad
ON ad.App_ID = ap.App_ID
WHERE ad.Program_status = FALSE ;

-- 18 Retrieve the names of students who have applied for scholarships with a requested amount greater than $3000:
SELECT DISTINCT s.First_Name, s.Last_Name , ad.app_ID
FROM student s 
INNER JOIN application_details ad ON ad.Stu_ID = s. Stu_ID
INNER JOIN schol_application sa ON sa.App_ID = ad.App_ID
WHERE sa.requestedAmount > 3000 ;



