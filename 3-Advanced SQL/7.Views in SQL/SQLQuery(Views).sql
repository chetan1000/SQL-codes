/*
	Views
		
		--a View is a database object that has NO Values.
		--It is a Virtual table, which is created according to the result set of an SQL query
		--However, it looks siilar to an actual table containing rows & columns.therefore we can say contents are based on the Base table.
		--It is operated similar to the Base Table but DOES NOT contain any data of its own.
		--It's name is always UNIQUE, like Tables
		--the Views differ from tables as they are Definitions that are created on top of other table
		--If any Changes occur in the Underlying Table, the same Changes Reflected in the View also.
		--Views are DATABASE OBJECT; that's why it DOESN'T store physically. This feature makes views excellent for Abstacting or Hiding Complex queries
*/

/*
	Uses of Views:
				--The primary use of view in sql server is to Implement the SECURITY Mechanism. it prevents users from seeing specific columns & rows from Tables.

				--It only shows the data returned by the query that has declared when the view was created. The rest of information is completely hidden from end-user
*/ss


/* Syntax for creating Views
	
	CRERATE VIEW viewName AS
	SELECT column1, column2,....
	FROM table_name
	WHERE condition

*/

--ViewName should be UNIQUE

use [SQLLearn]

CREATE TABLE STUDENTS(
id int,
admission_no int,
First_name Varchar(50),
Last_name varchar(50),
age int,
city varchar(20)
)

INSERT INTO SQLLearn..STUDENTS VALUES
(1,1234,'Chetan','P',23,'Hubli'),
(2,5678,'Pragati','D',24,'Gadag'),
(3,1357,'Sagar','M',25,'Mysore'),
(4,2468,'Abhi','N',26,'Bangalore');

SELECT * FROM STUDENTS



CREATE TABLE FEE(
admission_no int, 
course varchar(25),
amount_paid int)

INSERT INTO FEE VALUES
(1234,'Python',20000),
(5678,'Java',22000),
(1357,'SQL',18000),
(2468,'C++',15000);

SELECT * FROM FEE

--creating a VIEW

CREATE VIEW Course_Enrolled
AS
SELECT First_name,Last_name,course,amount_paid
FROM STUDENTS as S
INNER JOIN FEE as F
	ON S.admission_no = F.admission_no;


SELECT * FROM Course_Enrolled



--RENAME view in Sql Server
SP_RENAME Course_enrolled, Course_joined
--we can rename view by right click then renaming it


--UPDATE Views in SQl Server

	--adding City column in corse_enrolled
ALTER VIEW course_enrolled
AS
SELECT First_name,Last_name,course,city,amount_paid
FROM STUDENTS as S
INNER JOIN FEE as F
	ON S.admission_no = F.admission_no;

SELECT * FROM course_enrolled

--we can modify by right click on view--> Design


--How To Get Views definition in SQL Server?

SP_HELPTEXT course_enrolled					-- it will provide Query of that view which is ued to create it.


--to LIST or Display all Views present in SQL Server
	--we can use SYS.VIEWS or SYS.OBJECTS catalog view to list or Display all views available in SQL Server Mgmnt.

SELECT OBJECT_SCHEMA_NAME(v.object_id)schema_name,v.name
FROM sys.views as v


--to Dispaly All Tables in Sql Server
SELECT OBJECT_SCHEMA_NAME(v.object_id)schema_name,v.name
FROM sys.objects as v


--DROP Views in SQL Server

--Syntax:
--DROP VIEW [IF EXISTS] schema_name.view_name

																--CREATE VIEW Course_End
																--AS
																--SELECT First_name,Last_name,course,amount_paid
																--FROM STUDENTS as S
																--INNER JOIN FEE as F
																--	ON S.admission_no = F.admission_no

DROP VIEW IF EXISTS Course_End

--or

--DROP VIEW Course_End
