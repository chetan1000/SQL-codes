--/****** Script for SelectTopNRows command from SSMS  ******/
/*
	Inner Joins, Full/Left/Right/ Outer Joins
*/

SELECT TOP (1000) [EmployeeID]
      ,[Firstname]
      ,[LastName]
      ,[Age]
      ,[Gender]
  FROM [SQLTutorial].[dbo].[EmployeeDemographics]




-- INSERT INTO EmployeeDemographics VALUES(1011,'Naveen','G',25,'Male');

--INSERT INTO EmployeeDemographics (firstname,lastname) VALUES('Praveen','G') 

--INSERT INTO EmployeeDemographics (EmployeeID,firstname,lastname) VALUES(1013,'Haalesh','Katagi');

--INSERT INTO EmployeeSalary (EmployeeID,Salary) VALUES(1010,47000);

--INSERT INTO EmployeeSalary(jobtitle,Salary) VALUES('Salesman',43000);




----INNER JOIN
SELECT *
FROM SQLTutorial.dbo.employeeDemographics
INNER JOIN SQLTutorial.dbo.EmployeeSalary
ON EmployeeDemographics.employeeid=EmployeeSalary.employeeid;

--FULL OUTER JOIN
SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
FULL OUTER JOIN SQLTutorial.dbo.EmployeeSalary
ON EmployeeDemographics.employeeid = EmployeeSalary.employeeid;

----LEFT OUTER JOIN
SELECT *
FROM EmployeeDemographics
LEFT OUTER JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

----RIGHT OUTER JOIN
SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
RIGHT OUTER JOIN SQLTutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;


SELECT EmployeeID, FirstName, LastName, JobTitle, Salary
FROM SQLTutorial.dbo.EmployeeDemographics		--Ambiguous column name 'EmployeeID'.		
RIGHT OUTER JOIN SQLTutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

SELECT EmployeeSalary.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM EmployeeDemographics			--EmployeeID of Salary is selected
RIGHT OUTER JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM EmployeeDemographics			--EmployeeID of Demographics is Selected
RIGHT OUTER JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;


SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM EmployeeDemographics			
INNER JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

SELECT EmployeeSalary.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM EmployeeDemographics			
INNER JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM EmployeeDemographics			--EmployeeID of Demographics is Selected
LEFT OUTER JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

SELECT EmployeeSalary.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM EmployeeDemographics			--EmployeeID of Demographics is Selected
LEFT OUTER JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;


--USE Cases
--Swati is an accountant. she made mistake looking at the Average salary of Salesman. 
--Now Chetan, is an another accountant who is good at SQL, this is how he corrected the mistake.

SELECT *
FROM EmployeeDemographics
INNER JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

SELECT JobTitle,Salary
FROM EmployeeDemographics
INNER JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

--SELECT JobTitle,Salary
--FROM EmployeeDemographics
--INNER JOIN EmployeeSalary
--ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--WHERE jobtitle = 'Salesman';

--SELECT JobTitle,AVG(Salary)
--FROM EmployeeDemographics
--INNER JOIN EmployeeSalary
--ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--WHERE jobtitle = 'Salesman'
--GROUP BY jobtitle;








