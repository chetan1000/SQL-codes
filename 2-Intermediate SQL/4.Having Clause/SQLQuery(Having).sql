/*
HAVING Clause
*/

SELECT JobTitle, COUNT(JobTitle)
FROM SQLTutorial.dbo.EmployeeDemographics
JOIN SQLTutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle;

SELECT JobTitle, COUNT(JobTitle)
FROM SQLTutorial.dbo.EmployeeDemographics
JOIN SQLTutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE COUNT(JobTitle) > 1
GROUP BY JobTitle;
	--ERROR bcz We CANNOT use AGGREGATE Functionsin in the WHERE clause, we need to use HAVING Clause

SELECT JobTitle,COUNT(JOBTITLE)
FROM SQLTutorial.dbo.EmployeeDemographics
JOIN SQLTutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle 
HAVING COUNT(JobTitle) > 1

SELECT JobTitle,COUNT(JOBTITLE)
FROM SQLTutorial.dbo.EmployeeDemographics
JOIN SQLTutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
HAVING COUNT(JobTitle) > 1
GROUP BY JobTitle 
		--HAVING clause is completely depend upon GROUP BY statement
		--after GROUPing the Data, we should use HAVING to SELECT specifics data from GROUPs which are created using GROUP BY 
		--HAVING should come after the GROUP BY, bcz we can't look the Aggregated information before it Aggregated in GROUP BY statement


SELECT JobTitle, COUNT(JobTitle) as countJobTitle
FROM SQLTutorial.dbo.EmployeeDemographics
JOIN SQLTutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING COUNT(JobTitle) > 1
ORDER BY count(JobTitle)

SELECT JobTitle, COUNT(JobTitle) as countJobTitle
FROM SQLTutorial.dbo.EmployeeDemographics
JOIN SQLTutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
ORDER BY count(JobTitle)
HAVING COUNT(JobTitle) > 1
						--Error, because we need to use Having before ORDER BY
						--GROUP BY-->HAVING-->ORDER BY


SELECT JobTitle, COUNT(JobTitle) as countJobTitle
FROM SQLTutorial.dbo.EmployeeDemographics
JOIN SQLTutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
ORDER BY JobTitle
		--Sorting based on JobTitle
		--if any filtering or selecting not needed after GROUP BY then only go for ORDER BY 




/*
where
*/

SELECT COUNT(JobTitle) as JobTitleCount
FROM SQLTutorial.dbo.EmployeeDemographics	--Aggregate functions works if it present only in SELECT statement,
JOIN SQLTutorial.dbo.EmployeeSalary			--if other columns and also if AGGREGATE Function contains in SELECT we have to use GROUP BY
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
						

SELECT JobTitle, COUNT(JobTitle) as JobTitleCount
FROM SQLTutorial.dbo.EmployeeDemographics
JOIN SQLTutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle

SELECT JobTitle, AVG(Salary) as AvgSalary
FROM SQLTutorial.dbo.EmployeeDemographics
JOIN SQLTutorial.dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING AVG(Salary) > 45000
ORDER BY AVG(salary)