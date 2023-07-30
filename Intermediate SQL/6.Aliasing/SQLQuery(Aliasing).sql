/*
ALIASing
*/

--ALIAS used for Temporarily changing the Column Name or changeing the Table Name


--ALIASING With Column
SELECT FirstName AS Fname							--AS
FROM [SQLTutorial].[dbo].[EmployeeDemographics]

SELECT Firstname Fname
FROM [SQLTutorial].[dbo].EmployeeDemographics			--space for aliasing

SELECT Firstname+' '+LastName AS FullName
FROM [SQLTutorial].[dbo].[EmployeeDemographics]

SELECT AVG(Salary) AvgSalary					--Alias for Aggregate Function
FROM [SQLTutorial].[dbo].[EmployeeSalary]


--Aliasing With TableName
SELECT Demo.EmployeeID
FROM [SQLTutorial].[dbo].[EmployeeDemographics] AS Demo
			--in SELECT statement, for selecting Columns we have to write columnName along with Prefix as ALIAS
			--So that it is easy to understand that which column is coming from which table
	
SELECT Demo.EmployeeID,Sal.Salary
FROM [SQLTutorial].[dbo].[EmployeeDemographics] Demo
JOIN [SQLTutorial].[dbo].[EmployeeSalary] Sal
ON Demo.EmployeeID  = Sal.EmployeeID
									--looks clean,easy understandable, readble,manageble

--Joining 3 tables also using Alias
SELECT a.EmployeeID,a.LastName,a.Firstname,b.JobTitle,c.Age
FROM [SQLTutorial].[dbo].[EmployeeDemographics] a
LEFT JOIN [SQLTutorial].[dbo].[EmployeeSalary] b
ON a.EmployeeID = b.EmployeeID
LEFT JOIN [SQLTutorial].[dbo].[WareHouseEmoloyeeDemographics] c
ON a.EmployeeID = c.EmployeeID;
								--do not use alias a,b,c bcz it will not get any context what the table is refrensing
								--it is really get confusing, this query grows
								--in SELECT statement by looking column it is really difficult to understand from which table the column is coming from


SELECT Demo.EmployeeID,Demo.Firstname,Demo.LastName,Sal.JobTitle,Ware.Age
FROM [SQLTutorial].[dbo].[EmployeeDemographics] Demo
LEFT JOIN [SQLTutorial].[dbo].[EmployeeSalary] Sal
ON Demo.EmployeeID = Sal.EmployeeID
LEFT JOIN [SQLTutorial].[dbo].[WareHouseEmoloyeeDemographics] Ware
ON Demo.EmployeeID = Ware.EmployeeID;

		--it looks easy understandable, readble, sensing which column is come from which table