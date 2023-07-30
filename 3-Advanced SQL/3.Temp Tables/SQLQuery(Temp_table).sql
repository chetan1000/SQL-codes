/*
TEMP tables
*/

--Temporary tables, we can execute as much we want

--Creatting Temp table
CREATE TABLE #Temp_Employee(
EmployeeID int,
JobTitle varchar(50),
Salary int
)

SELECT *
FROM #Temp_Employee


INSERT INTO #Temp_Employee VALUES (
1001,'HR',45000);


--INSERTing Data from another table into TEMP table .......it is the biggest application of TEMP table
INSERT INTO #Temp_Employee
SELECT * 
FROM SQLTutorial..EmployeeSalary


SELECT *
FROM #Temp_Employee

--suppose if one table contains millons of rows and we are doing compkex query that contains joins, window functions etc.
--it will take very long time for processing and executing
--SO, we can insert that data into TEMP table
--TEMP table consists some sub-sections data,while executing TEMP table it will proces easily for further process. 



--creating another temp table
CREATE TABLE #Temp_Employee2(
JobTitle varchar(100),
EmployeesPerJob int,
AvgAge int,
AvgSalary int)

INSERT INTO #Temp_Employee2
SELECT JobTitle,COUNT(JobTitle),AVG(Age),AVG(Salary)
FROM SQLTutorial..EmployeeDemographics emp
JOIN SQLTutorial..EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
GROUP BY JobTitle

SELECT *
FROM #Temp_Employee2

	--if we do further calculation, but everytime we have to join the tables and 
	--everytime joining and after that doing calculations is so tedious and takes more time
	--So, that time, we should insert these joined data into Temporary tables, 
	--so that if any furter calcations or whenever we need datawe can use from this temporary table
	--we reduced Run-Time dramatically, when we placed data into Temporary Table.

--Simply other things
		--we can insert data frome one table to another
			--CREATE TABLE Employ(
			--EmployeeID int,
			--JobTitle varchar(50),
			--Salary int
			--)

			--INSERT INTO Employ
			--SELECT * 
			--FROM SQLTutorial..EmployeeSalary

			--SELECT *
			--FROM Employ


		--Inserting data from One Temporary table into another Temporary table
		--Inserting the Temporary table data into another normal table


--Temp tables are widely used in STORED PROCEDURES.

--CREATE TABLE #Temp_Employee2(
--JobTitle varchar(10),
--EmployeesPerJob int,
--AvgAge int,
--AvgSalary int)
--INSERT INTO #Temp_Employee2
--SELECT JobTitle,COUNT(JobTitle),AVG(Age),AVG(Salary)
--FROM SQLTutorial..EmployeeDemographics emp
--JOIN SQLTutorial..EmployeeSalary sal
--	ON emp.EmployeeID = sal.EmployeeID
--GROUP BY JobTitle

--SELECT *
--FROM #Temp_Employee2

	--whenever we need to run, a stored procedure to un again and again for some reason, it throws ERROR that already table existed.
	--the use this , DROP TABLE IF EXISTS #Temp_Employee2
	--so that if table exists, it will delete then recreate.


DROP TABLE IF EXISTS #Temp_Employee2
CREATE TABLE #Temp_Employee2(
JobTitle varchar(100),
EmployeesPerJob int,
AvgAge int,
AvgSalary int)
INSERT INTO #Temp_Employee2
SELECT JobTitle,COUNT(JobTitle),AVG(Age),AVG(Salary)
FROM SQLTutorial..EmployeeDemographics emp
JOIN SQLTutorial..EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
GROUP BY JobTitle
SELECT *
FROM #Temp_Employee2



--Temporary tables
	--these are created in TempDB and are automatically deleted as soon as the last connection is terminated.
	--helps us to store and process intermediate tresult
	--sores temporary data.

--2 types of temporary tables:
--1. Local Temporary Table		2. Global Temporary Tables

--1. Local Temporary Tables:
		--table is available only for session that has created it
		--it is automatically Dropped or DELETED when the connection is closed.
		--we can drop these table by DROP TABLE #EmpDetails
		--There will be random numbers are appended to the name of table
		--To create local Temporary Tables, Single "#" is used at the prefix of the table name
		--if the temporary table is created inside the stored procedure, iit get dropped Automatically upon the completion of stored Procedure
		--Example:

		CREATE PROCEDURE
		ProcTemp
		AS
		BEGIN
		CREATE TABLE
		#EmpDetails
		INSERT INTO
		#EmpDetails VALUES
		(01,'Lalit'),(02,'Athrav')
		SELECT *
		FROM #EmpDetails
		END
		Execute ProcTemp


--2. Global Temporary Table:
		--to create Global temporary table use '##' before tyhe table name
		--Global Temporary tables are visible to all connections and Dropped when the last connection refrencing the table is closed
		--Global Table name must have an Unique Table Name
		--There will be NO random numbers Suffixed at the end of the thable name.

	CREATE Table
	##EmpDeatils(id int,
	name varchar(25))

