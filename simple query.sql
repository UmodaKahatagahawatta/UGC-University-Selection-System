USE uniaddmission;

-- simple queries

--  1
SELECT * FROM Student;
 
 -- 2
 SELECT Stu_ID, First_Name, Last_Name FROM Student;
 
 -- 3 (cartesian Product)
 SELECT * FROM Student, University_Details;

-- 4 (Creating user view )
CREATE VIEW Student_Details AS
SELECT Stu_ID, First_Name, Last_Name, Street, City, District, Subject_Streem FROM Student;

-- 5 (Rename Operation)
SELECT Stu_ID AS Student_ID, First_Name AS FirstName, Last_Name AS LastName FROM Student;

-- 6 (Aggregation function)
SELECT AVG(Z_Score) AS Average_Z_Score FROM Student;

-- 7 
SELECT * FROM Student WHERE City LIKE 'Ba%';












