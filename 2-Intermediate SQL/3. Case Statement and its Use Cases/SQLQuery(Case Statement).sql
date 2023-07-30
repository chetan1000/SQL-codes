/*
CASE Statement
*/

SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics;

SELECT Firstname,LastName,Age
FROM SQLTutorial.dbo.EmployeeDemographics  --now we get cleaned table
WHERE Age is NOT NULL
ORDER BY Age;


SELECT Firstname,LastName,Age,	
CASE							-- We are giving , bcz we are selecting a column or 
	WHEN Age > 28 THEN 'Old'	--Categorising the things and that's why we have to wrote CASE after SELECT only
	ELSE 'Young'
END
FROM SQLTutorial.dbo.EmployeeDemographics
WHERE Age is NOT NULL
ORDER BY Age;

SELECT Firstname,LastName,Age,	
CASE							
	WHEN Age > 28 THEN 'Old'	
	WHEN Age BETWEEN 26 AND 28 THEN 'Young'
	ELSE 'Baby'
END
FROM SQLTutorial.dbo.EmployeeDemographics
WHERE Age is NOT NULL
ORDER BY Age;

--If the MULTIPLE conditions meet the criteria, in that only FIRST condition is RETURNS
SELECT Firstname,LastName,Age,
CASE
	WHEN Age > 28 THEN 'Old'		--Both Conditions meets the criteria, but ONLY FIRST Condition is RETURNing
	WHEN Age = 31 THEN 'Stanely'
	ELSE 'Baby'
END AS NewColumn
FROM SQLTutorial.dbo.EmployeeDemographics
WHERE Age is NOT NULL
ORDER BY Age;

SELECT Firstname,LastName,Age,
CASE
	WHEN Age = 31 THEN 'Stanely'
	WHEN Age > 28 THEN 'Old'
	ELSE 'Young'
END AS NewColumn
FROM SQLTutorial.dbo.EmployeeDemographics
WHERE Age is NOT NULL
ORDER BY Age;

--USE CASE Problem:
SELECT Firstname,LastName,JobTitle,Salary
FROM SQLTutorial.dbo.EmployeeDemographics
JOIN SQLTutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

--Question
--Company had good profit in this year, so Management decided to give hikes to all employees
--Salesmen was working very hard to increse profit of company so he will get 10% HIKE
--Accountant 5%, HR 1% and Others 3%
--Calculate the Salary After Raise

SELECT Firstname,LastName,JobTitle,Salary,
CASE
	WHEN JobTitle = 'Salesman' THEN Salary + (Salary*.10)
	WHEN JobTitle = 'Accountant' THEN Salary + (Salary*.05)
	WHEN JobTitle = 'HR' THEN Salary + (Salary*.01)
	ELSE Salary + (Salary * .03)
END AS SalaryAfterRaise
FROM SQLTutorial.dbo.EmployeeDemographics
JOIN SQLTutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;



--Application of Case statement
--1.For categorising the things or Labelling The Things
--2.For this type of Calculations.
