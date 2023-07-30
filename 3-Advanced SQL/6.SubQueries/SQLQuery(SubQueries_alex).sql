/*
	SUBQueries
*/
	--we are using subqueries in SELECT, FROM & WHERE only...)

	--Subqueries is also called inter queries.
	--Subquery is basically query within a query.
	--a Subquery returns the data that will be used in Main Query or Outer query as a condition to specify the data that we want to tretrive.
	--We can use Subquery in Anywhere in query like we may use in SELECT,FROM,WHERE and 
	--also in INSERT, UPDATE, DELETE
USE SQLTutorial
GO
	
SELECT * 
FROM EmployeeSalary;

--Subquery in SELECT 
SELECT EmployeeID,Salary,(SELECT AVG(Salary) FROM EmployeeSalary) as AllAvgSalary		--subquery execute first
FROM EmployeeSalary

--doing with PARTITION BY
SELECT EmployeeID,Salary,AVG(Salary) OVER() as AllAvgSalary
FROM EmployeeSalary

--Why GROUP BY doesn't work
SELECT EmployeeID,Salary,AVG(Salary) as AllAvgSalary
FROM EmployeeSalary
GROUP BY EmployeeID,Salary
ORDER BY 1,2				--we didn't get (AVG salary of whole table)AllAvgSalary properly by groupby


--Subquery in FROM

		--Subqueryies tend to be little bit slower compare to TEMP table and CTE
		--usage of TEMP table is better bcz, we can re-use again and again.
		--But for subquery we need to write each time.

SELECT a.EmployeeID,allavgsalary
FROM (SELECT EmployeeID,Salary,AVG(Salary) OVER() as AllAvgSalary FROM EmployeeSalary) a

		--inter query or Subquery executes first
		--from subquery, it returns one table.
		--Fromthat table, selectinng in main query
		--we selected entire table in subquery, from that table we selected some data.
		--for this type of situation use TEMP or CTE.

--Subquery in WHERE

--we need employeeId,jobtitle,salary whose Age is greater than 30
		--age column is not present in EmployeeSalary,it is present in Demographics
		--we can join both table to get information or we use SUBQUERY

SELECT EmployeeID,JobTitle,Salary
FROM EmployeeSalary
WHERE EmployeeID in (SELECT EmployeeID
					FROM EmployeeDemographics
					WHERE Age>30)

					--we need to select only one expression in Subquery when we used Subquery in WHERE clause, specific or filtered information 
					--don't select * in Subuery bcz we used subquery in where
					--if we want AGE column in SELECT of main query, we need to JOIN both table.