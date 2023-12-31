/***
	STORED PROCEDURES
***/

		--Stored Procedures are the group of SQL statements that is being created & stored in database.
		--Stored Procedure can accept input parameters.
		--A single stored procedure can be used over the network by the different users and we can all be using different input data.
		--A stored procedure is also reduce Network Traffic and increases the performances.
		--If we modified that store procedure, everyone who use that store procedure in future will get that update.

		
USE [SQLTutorial]
GO							--To use our required database

--creating a stored procedure
CREATE PROCEDURE Test
AS
SELECT *
FROM SQLTutorial..EmployeeDemographics

--to view stored procedure
EXEC Test


--creating another stored procedure with Temp Table
CREATE PROCEDURE Temp_Employee
AS
CREATE TABLE #temp_employee(
JobTitle varchar(100),
EmployeePerJob int,
AvgAge int,
AvgSalary int)

INSERT INTO #temp_employee
SELECT JobTitle,COUNT(JobTitle),AVG(Age),AVG(Salary)
FROM SQLTutorial..EmployeeDemographics emp
JOIN SQLTutorial..EmployeeSalary sal
	on emp.EmployeeID=sal.EmployeeID
GROUP BY JobTitle

SELECT *
FROM #temp_employee


EXEC Temp_Employee
