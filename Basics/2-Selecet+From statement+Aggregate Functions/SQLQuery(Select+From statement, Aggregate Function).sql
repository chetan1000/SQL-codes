/*
SELECT Statement
	TOP, DISTINCT, COUNT, AS, MAX, MIN, AVG
*/

SELECT * 
FROM EmployeeDemographics;

SELECT EmployeeID, Firstname
FROM EmployeeDemographics;

SELECT TOP 5 Firstname 
FROM EmployeeDemographics;


SELECT DISTINCT *
FROM EmployeeDemographics;

SELECT DISTINCT(Gender)
FROM EmployeeDemographics;

SELECT COUNT(*)
FROM EmployeeDemographics;

SELECT COUNT(EmployeeID)
FROM EmployeeDemographics;

SELECT COUNT(EMployeeID) AS ID
FROM EmployeeDemographics;

SELECT Firstname AS name
FROM EmployeeDemographics;

SELECT * 
FROM EmployeeSalary;

SELECT MAX(Salary)
FROM EmployeeSalary;

SELECT MIN(Salary) minSalary
FROm EmployeeSalary;

SELECT AVG(salary) AS avg_salary
FROM EmployeeSalary;

SELECT * 
FROM SQLTutorial.dbo.EmployeeSalary;