USE [SQLTutorial]
GO
/****** Object:  StoredProcedure [dbo].[Temp_Employee]    Script Date: 26-03-2023 13:59:47 ******/
SET ANSI_NULLS ON				--how to deals with the NULL, when we using WHERE condition
GO
SET QUOTED_IDENTIFIER ON		--How uses Quotes '' inthe actual query itself
GO
ALTER PROCEDURE [dbo].[Temp_Employee]
@JobTitle nvarchar(100)						--adding input parameter, when we executing this stored procedure ,we can specify the input into that stored procedure so we get specific result back
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
WHERE JobTitle = @JobTitle
GROUP BY JobTitle

SELECT *
FROM #temp_employee


EXEC Temp_Employee		--Procedure or function 'Temp_Employee' expects parameter '@JobTitle', which was not supplied.

EXEC Temp_Employee @JobTitle = 'salesman'		--we are specifying in the parameter JobTitle to select data of salesman data
