/*
	SUBQUERY in SQL
*/

	--It is a sql query, which is passed inside another sql query

USE [SQLLearn]
GO

--Question: FInd the Employee who's salary is more than the average salary earned by all employeess
		--1. Filter the avg salary
		--2. filter the employees based on above result


--CREATE TABLE SQLLearn.dbo.Department(dept_id int,
--						dept_name varchar(50),
--						Location varchar(50));

--INSERT INTO Department VALUES
--							(1,'Admin','Bangalore'),
--							(2,'HR','Bangalore'),
--							(3,'IT','Bangalore'),
--							(4,'Finance','Mumbai'),
--							(5,'Marketting','Bangalore'),
--							(6,'Sales','Mumbai');

SELECT * FROM Employee
SELECT * FROM SQLLearn..department

SELECT AVG(Salary) from SQLLearn..Employee;					--avg value=5781

SELECT *
FROM Employee
WHERE Salary > 5781			--if more information is added to the table, and average also changes that time that time this query fails to fetch correct answer

SELECT *
FROM Employee
WHERE Salary > (SELECT AVG(Salary) FROM Employee)				---WHERE Salary > 5781			--if more information is added to the table, and average also changes that time that time this query fails to fetch correct answer

																/*	SELECT *
																	FROM Employee
																	WHERE Salary >....is outer query or main query
																----SELECT AVG(Salary) FROM Employee inner query or subquery
																*/



--subquery processing by SQL
		--when query with subquery occurs
		--subquery executes first, bcz it is a Independent query
		--From subquery data is fetched
		--using that data fetched by subquery,the main query returns some data.

--Different Types of Subquery
	--1. scaler subquery
	--2. multiple row subquery
	--3. co-related subquery.

--1.Scalar subquery:
		--it is a simple subquery which will always returns, one row and one column.
	--example:
		SELECT *
		FROM Employee
		WHERE Salary > (SELECT AVG(Salary) FROM Employee)
		--here subquery returning single row and single column.

		SELECT *
		FROM Employee e
		JOIN (SELECT AVG(salary) sal FROM Employee) avg_sal
			ON e.Salary > avg_sal.sal
						--whenever subquery used in JOINs or FROM the returning data will be treats as table by the SQL


--2. Multiple Row Subquery:
			--if subquery returns multiple row, then it is called as multiple subquery.
			--there are two types in multiple subquery
				--1. Subquery which returns multiple column and multiple rows
				--2. subquery which returns only one column and multiple rows

	--1. Subquery which returns multiple column and multiple rows:

--Question: Find the employees who earn the highest salary in each department.
			
			--1. Finding the highest salary in each department
			--2. once find, comparing this salary with department information in the employee table, so we get final result

SELECT dept_name, MAX(salary) as MaxSalary
FROM Employee
GROUP BY Dept_name


--SELECT *
--FROM Employee 
--WHERE (dept_name,salary) in (SELECT dept_name,MAX(salary)			--for multiple columns in WHERE we need use( , )
--						FROM Employee								--selecting multiple columns with WHERE clause IN multiple columns 
--						GROUP BY Dept_name)
								


--Question: Find department who do not have any employees
				--see department table and also see employee table, if any dept is not present in employee, which means no employee present in thst employee.

SELECT distinct Dept_name
FROM Employee					--multiple row single column subquery
								--four department present Admin,Finance,HR,IT

SELECT *
FROM sqllearn.dbo.department 
WHERE dept_name not in (SELECT distinct Dept_name
						FROM Employee)							--Marketting,Sales not present in employee so no employees are thre in thesedept


--3. Co-related Subquery:
	--A subquery which is related to other Outer query.
	--The processing of Subquery is depend on values that returned from the outer query.
	
--Question: Find the employees in each dept's who earn more than average salary in that dept.
				--finding the avg salary to the specific dept
				--comaring the salary of employees with avg salry of that dept
SELECT *
FROM Employee e1
WHERE Salary > ( SELECT AVG(Salary)
				FROM Employee e2
				WHERE e2.Dept_name = e1.Dept_name )
										--Subquery, is depend upon outer query for dept_name
										--over every single record processed from outer query, it will execute the inner query
										--(no of records present in outer query = no of time inner query is executing)
										--if outer query has millions of rows, then inner query needs to process that time, in that time this is not prefareble.

				--for every single record in e1, sql will process subquery once, i.e, it fetch dept_name from outer query
				--in subquery it fetch the same dept_name from e2,if both dept_name of e1 & e2 are matched it finds AVG(salary) of that dept
				--then comparing Salay from outer query with Avg(salary) from inner query

--Question: Find the Department who do not have any Employyes.

SELECT *
FROM Department d
WHERE NOT EXISTS (SELECT 1
				FROM Employee e
				WHERE e.dept_name = d.dept_name)
					--from every record in department table, it return d.dept_name in the subquery.
					--Sql will found e.dept name , if bth dept_name matched, then it will select 1 from sub query
					--WHERE NOT EXISTS is failed so not fetched
					--ex: d.dept_name=Admin, e.dept_name=Admin, then it returns 1, where NOT EXISTS is not valid

					--if D.dept_name= 'marketing' and this dept_name is not present in subquery, so it not returns anything,
					--now WHERE NOT EXISTS is valid, so it will fetch the output

				--In all other subquery's SQL will straight away enters subuery first and hold that output & 
				--then use that output from subquery & process it with outer query.

				--but in co-related query,SQL will not able to execute subquery, so for every single record that processed from outer query, the subquery executed
				--depending how many times of records available , that many times subquery executed.

				--Co-related query is Little bit SLOWER bcz, it depend upon outer query, and the records how much present in outer query, that times subquery have to execute.


					
--4. Nested Subquery:
				--Subquery inside subquery and subquery inside subquery
--Question : Find the stores who's sales were better than the average sales across all stores.
				
				--1. Find the total sales for each store
				--2. Find the AVG sales for all the stores
				--3. compare 1 & 2

	SELECT *
	FROM SQLLearn..Stores

				--SELECT store_name,SUM(cost) as total_sales
				--FROM Stores			--total sales of all stores
				--GROUP BY store_name

				--SELECT AVG(total_sales) as AVG_sales		--Avg of total sales of all stores 
				--FROM (SELECT store_name,SUM(cost) as total_sales
				--	FROM Stores			
				--	GROUP BY store_name) x

				--Then Comparing 

SELECT *
FROM(SELECT store_name, SUM(cost) as total_sales
		FROM Stores
		GROUP BY store_name) sales
JOIN(SELECT AVG(total_sales) as sales1
		FROM (SELECT store_name, SUM(cost) as total_sales
			FROM Stores
			GROUP BY store_name) X)avg_sales
	ON sales.total_sales > avg_sales.sales1


	--Subquery is repeating multiple times, then use WITH clause.

	--using WITH clause
	WITH sales3 as
		(SELECT store_name, SUM(cost) as total_sales
		FROM Stores
		GROUP BY store_name)

		SELECT *
		FROM sales3
		JOIN ( SELECT AVG(total_sales) as sales2
				FROM sales3 X) avg_sales
			ON sales3.total_sales > avg_sales.sales2



/* 
	Different SQL clause Where Subquery is allowed
			SELECT
			FROM
			WHERE
			HAVING
	*/

	--FROM and WHERE already seen
--Subquery in SELECT
	--Question : fetch all employee details and add Remarks to those employees who earn more than the Average pay.
	SELECT *,
		(CASE 
			WHEN salary > (SELECT AVG(salary) FROM Employee) THEN 'Higher than average'
			ELSE null
		END) as Remarks
	FROM Employee;

			--This is not best method, always find any alternative to remove subqueries from SELECT clause.
			--If we wrote SELECT query inside SELECT clause, then for every single record (from main clause).
			--our query query will process. this whole SQL query that present in SELECT clause will also got procesed.

		--Always try to avoid using Subquery inside SELECT clause.
		--we can easily replace SELECT subquery by putting inside JOIN condition.

SELECT *,
		(CASE WHEN Salary > avg_sal.sal THEN 'Higher than the average'
				ELSE NULL
		END) as Remarks
FROM Employee
CROSS JOIN (SELECT AVG(salary) as sal FROM Employee) avg_sal 
			--CROSS JOIN doesn't need any Joining Condition,and we need to fetch all record from employees so used Cross join

--Subqueries in HAVING clause
	
	--Question: Find the stores who have sold more units then the average units sold by all stores.

															--SELECT * FROM SQLLearn..Stores 

															--SELECT store_name, SUM(quantity) 
															--FROM SQLLearn..Stores 
															--GROUP BY store_name 

															--SELECT AVG(quantity) from  SQLLearn..Stores 

SELECT store_name, SUM(quantity)
FROM SQLLearn..Stores
GROUP BY store_name
HAVING SUM(quantity) > (SELECT AVG(quantity) from  SQLLearn..Stores )


/*
		Subqueries used in
				SQL Queries
				INSERT
				UPDATE
				DELETE

*/

--Subqueries in sql query is already seen

--SubQuery in INSERT
	 
	 --Question: INSERT data to Employee History table. Make sure NOT Insert Duplicate records.

				--already employye history table present in database with some columns and there are no records. it is empty
				--but in my laptop not present so i created 

			CREATE TABLE SQLLearn..Employee_History(emp_id int,
													emp_name varchar(50),
													dept_name varchar(50),
													salary int,
													location varchar(50));

			SELECT * FROM Employee_History
			SELECT * FROM Employee
			SELECT * FROM Department
								/* --by seeing column names in employee_history table, these columns are available in Employee and Department table
									--so we need to refer to those table & fetch the data from those two table & Load into the Employee_History table
									--we don't need to insert record by record by manually, and if more number of records needs to be insert, These data already avilable in other tables.
									--when we need to insert data, that are present in some existing tables, so we need to use subqueries to load the data.		*/

			INSERT INTO SQLLearn..Employee_History
			SELECT e.Emp_id,e.Emp_name,d.dept_name,e.Salary,d.Location
			FROM Employee e											--joing the table to get data from both table and loading into history table
			JOIN Department d
				ON d.dept_name = e.Dept_name
			WHERE NOT EXISTS (SELECT 1														--Corelated sunquery
								FROM Employee_History eh
								WHERE eh.emp_id = e.Emp_id)
								
			--Output : If first time executed, it INSERTED 16 records, if Second time executed, it shows as 0 inserted, bcz already these records are present in history table, so it will not insert duplicate records
			
			--when e.emp_id is get from outer query, then SQL will check in employee_history table, if same eh.emp_id present or not, 
			
			--if same emp_id NOT present in history table, it returns Nothing from SELECT in subquery, and WHERE NOT EXISTS  became TRUE or ACTIVE, that time it will INSERT Data
			--ex: e.emp_id=101		and sql will check in emp_id in employee_history, if same emp_id not present in the employee_history, it will return anything from subquery, then WHERE NOT EXIST becomes ACTIVE, INSERT of data takes place in history table. 
			
			--if same emp_id present in history table, it returns as 1 from subquery, and WHERE NOT EXISTS  became fails or inactive, that time it will INSERT Data
			--ex:e.emp_id=101 andsql will check in emp_id in employee_history, if same emp_id present in the employee_history, it will return 1 from subquery, then WHERE NOT EXIST becomes IN-ACTIVE, it will NOT INSERT the data bcz already data available in Employee_history tableand avoid duplicate of records.


--SUBQUERY in UPDATE

	--Question: Give 10% increment to all employees in Banglore location, based on the maximum salary earned by an employee in each department. consider employees in Employee_history table.
				
				/*	--UPDATEing an employee table  with some conditions:
										
								1.  the employees who earned maximum salary in Each Department. need to give 10% hike to them only.

								2. Location = 'Bangalore'

								3. Employees are from Employee_history (updating the employees in employee tableand but these employees should also present employee_history table.if employees present in employee table and not present in Employee_history table, we need to leave thode employees from employyee table)		*/

--SELECT * FROM Employee_History
--SELECT * FROM Employee
--SELECT * FROM Department


				UPDATE Employee 
				SET Salary	=		(SELECT MAX(salary) + (MAX(salary) * 0.1)
										FROM SQLLearn..Employee_History eh
										WHERE eh.dept_name = Employee.Dept_name)				--co-related subquery
									
				WHERE Employee.Dept_name in (SELECT dept_name
										FROM Department
										WHERE Location = 'Bangalore')
																	
				AND Employee.emp_id in (SELECT emp_id
									FROM Employee_History)

--SUBQUERY in DELETE
		
		--Question: Delete all departments who do not have any employees

		DELETE FROM Department
		WHERE dept_name IN (SELECT dept_name
					FROM Department d
					WHERE NOT EXISTS (SELECT 1
										FROM Employee e					--query inside subquery
										WHERE e.Dept_name = d.dept_name)
								
								);

		SELECT * FROM Department						
									


								