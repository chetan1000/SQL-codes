/*
UPDATING/DELETEING the Data.
*/
/*
INSERT--->Insert Into Creates New Rows in a Table
UPDATE--->Altering/Changing in Pre-Existing Row in a table
DELETE--->Removing/Deleting the Row fro table or Deleting an entire Row
*/

INSERT INTO SQLTutorial.dbo.EmployeeDemographics VALUES(NULL,'Alex','Perry',35,'Female')
INSERT INTO SQLTutorial.dbo.EmployeeDemographics VALUES(1010,'Praveen','Godi',29,'Male')

SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics

		--UPDATE--
UPDATE SQLTutorial.dbo.EmployeeDemographics
SET EmployeeID=1012
WHERE Firstname='Alex' AND LastName='Perry' AND Age=35

UPDATE SQLTutorial.dbo.EmployeeDemographics
SET EmployeeID=1012
WHERE Firstname='Alex' AND LastName='Perry' AND Age=30		--if information is matched in table then row affected and it will updated
															--If information is not matched in table then 0 row affected and it will not updated but t will not shows any error

UPDATE SQLTutorial.dbo.EmployeeDemographics
SET EmployeeID=1011;								--It will updates EmployeeID=1011 to whole column of employeeID rows


UPDATE SQLTutorial.dbo.EmployeeDemographics
SET Age=33,Gender='Male'
WHERE EmployeeID=1013

UPDATE SQLTutorial.dbo.EmployeeDemographics
SET LastName='Godi'AND FirstName='Praveen'
WHERE EmployeeID=1011 AND Age=25			--in UPDATE SET for updating multiple columns data of SAME ROW we need to use ONLY ,comma
											--do not use AND OR in SET


											
SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
		
		--DELETE--

DELETE FROM SQLTutorial.dbo.EmployeeDemographics
WHERE EmployeeID=1010								--DELETing an entire row by selecting specific data

		--While Deleting we need to be very carefull, bcz Once DATA Deleted we can't get back

--DELETE FROM SQLTutorial.dbo.EmployeeDemographics		--it will DELETE's all the Data From EmployeeDemographics


/*
Before Deleting,
Once Check 
and Then Delete
*/

--Example: You want to delete a row of employeeID = 1006, but there is chance that may be you are puuting different employeeID by Mistakenly
--So, 
--First use SELECT to see whivh data are you going to be DELETE
--Then DELETE that data
SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
WHERE EmployeeID=1015;			--in this you will come to know which data is going to be delete

DELETE
FROM SQLTutorial.dbo.EmployeeDemographics
WHERE Firstname='Praveen' AND LastName='G'
