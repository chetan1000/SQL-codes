/*
CTE
*/

--CTE is a common table expression, to name the temporary result set, which is use to manipulate the complex subqueries data.
--It only exists within the scopes of the statements that we are about to write, once we can outof this query it can never existed.
--a CTE is also creates a memory, rather then the Temp DB file like Temp Table would be
--In general, CTE act like subquery
--CTE is also called as WITH queries bcz it starts with WITH clause so.

WITH CTE_Employee as
(SELECT Firstname, LastName, Gender,Salary
,COUNT(Gender) OVER(PARTITION BY gender) as TotalGender
,AVG(Salary) OVER(PARTITION BY gender) as AvgSalary
FROM SQLTutorial..EmployeeDemographics emp
JOIN SQLTutorial..EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
WHERE Salary > 45000							--we created & placed it in temporary place. whenever we needed, we just go and grab the data.
)												--whenever we need data oftenly, we can just create CTE, from that we can fetch the data
												
SELECT Firstname,TotalGender,AvgSalary			--CTE scope existed in very next SELECT statement after creating CTE table
FROM CTE_Employee								--it is like creating variables within a function and those arguments will existed within that function only

SELECT *
FROM CTE_Employee				--if we frun this SELECT satement, it shows error, bcz CTE will not store any where

--CTE is not stored anywhere, it is not stored in some TEMP Database somewhere

-- 