--CREATE TABLE SQLLearn..Employee(
--Emp_id int,
--Emp_name varchar(50),
--Dept_name varchar(50),
--Salary int)

INSERT INTO SQLLearn..Employee VALUES			
(101,'chetan','IT',4000),
(102,'Pragati','HR',8000),
(103,'sagar','Finance',5000),
(104,'Abhi','Admin',3000),
(105,'sagar pk','IT',4000),
(106,'Swati','HR',7000),
(107,'vinay','Finance',5000),
(108,'Shreyas','Admin',6000),
(109,'raghu','IT',6000),
(110,'Gowri','HR',8500),
(111,'prashant','Finance',5000),
(112,'Haalesh','Admin',6000),
(113,'Messy','IT',6500),
(114,'Smriti','HR',9000),
(115,'Virat','Finance',3000),
(116,'Ronaldo','Admin',6500);

SELECT *
FROM Employee

SELECT MAX(salary)
FROM Employee

SELECT Dept_name,MAX(Salary)
FROM Employee
GROUP BY Dept_name


--Write a query to fetch top 3 employees from each dept in employee table who earned max salary

--write a query to display MIN and MAX salary in each Department corresponding to each employee record

--Fetch Max salary in each departments along with the other details of employee table

--for this type, using Aggregate and Group By is not possible
--this types are solved by WINDOW functions.

/* 
WINDOW's Functions
*/


--Fetch Max salary along with the other details of employee table
SELECT e.*,
MAX(salary) OVER() AS max_salary
FROM SQLLearn..Employee e;
		--Max() is an Aggregate Function
		--OVER() is clause, it tells SQL to not consider MAX() as Aggregate Function and consider it as WINDOW function or ANALYTIC function
		--OVER() it creates a WINDOW for all our records
		--Then the Function MAX() is applied to that window and searches the MAX(salary)
		--prints the MAX(salary) for each records
		--OVER() , in brackets we did not put any column, so it creates Only One Window


--Fetch Max salary in each departments along with the other details of employee table
SELECT e.*,
MAX(salary) OVER(PARTITION BY dept_name) AS maxSalaryDept
FROM SQLLearn..Employee e;
							
							--PARTITION BY is Clause
							--PARTION BY dept_name
							--For every distinct value present in dept_name column, it will create WINDOW's
							--Then it will apply FUNCTIONS like MAX() to each of those window's
							--then it will fetch max(salary) with respect to each dept and prints max(salary) for every records wrt each dept
	--we can use any Aggregate Function like MAX, MIN, AVG, SUM, COUNT etc

/*
Window functions:

ROW_NUMBER()
RANK()
DENSE_RANK()
LAG()
LEAD()
...
...
*/


/*
ROW_NUMBER()
*/

--it assignes UNIQUE VALUE to each ofthe records in the table.

SELECT e.*,									--showing error
ROW_NUMBER() OVER() as rowNum				--The function 'ROW_NUMBER' must have an OVER clause with ORDER BY, in ms server
FROM SQLLearn..Employee e;

			--passing a column in OVER clause. 
SELECT e.*,
ROW_NUMBER() OVER(ORDER BY Emp_id) as rowNum		--for every record in this table, we got one unique number.
FROM Employee e	

SELECT e.*,
ROW_NUMBER() OVER(PARTITION BY dept_name ORDER BY emp_id) as rownum
FROM SQLLearn..Employee e  
						--OVER(PARTITION BY dept_name),each unique records present in dept_name column is going to create one window & inside of each of this window, ROW_NUMBER() function is executed
						--so far each window based on number of records, one unique value will be assigned.
						--in each department, it will assigns unique row number



--Fetch the first two employees from each department to join the company
		--let us assume, the employee who joined earlier they are having Low emp_id, and employee who joined later has higher emp_id

SELECT * FROM( 
	SELECT e.*,
	ROW_NUMBER() OVER(PARTITION BY Dept_name ORDER BY emp_id) as row_num			--this is subquery, we gave row_number to each employees in each dept and we sorted ascending based on emp_id
	FROM Employee e ) X																
WHERE  X.row_num < 3;																--from subquery we fetched first two employees from each dept


SELECT * FROM
	(SELECT e.*,
	ROW_NUMBER() OVER(PARTITION BY dept_name ORDER BY Salary DESC) AS rn
	FROM Employee e) X
WHERE X.rn < 4

/*
RANK()
*/

--Fetch Top 3 employees in each Dept earning the max salary 
		--we need to rank the employees based on salary
		--Then, we need tofetch Top # employees from each dept.
		--To achive this type of query, we needto write a query using RANK() or DENSE_RANK()

	SELECT e.*,
	RANK() OVER(PARTITION BY dept_name order by Salary DESC) as rnk
	FROM Employee e
					--Whenever we are using RANK(), it will assign rank based on ORDER BY and Partition
					--if it find any duplicate record,it will assign same rank. 
					--while ranking , it will skips a rank value to the a very next record after dulicate record 
					--number of duplicates occur = it will skip that much of value while recording a very next records after duplicating records
					--ex				salary		rank
					--					6000		1
					--					5000		2
					--					5000		2
					--					4500		4

--Fetch Top 3 employees in each Dept earning the max salary 
SELECT * FROM
	(SELECT e.*,
	RANK() OVER(PARTITION BY dept_name order by salary desc ) as rnk		--subquery
	FROM Employee e) X
WHERE X.rnk < 4

/*
	DENSE_RANK()
*/
		--it will assign same rank for duplicated records, but	
		--It will not Skips any rank value while ranking a very next record after ranking duplicates record

SELECT e.*,
DENSE_RANK() OVER(PARTITION BY dept_name ORDER BY salary DESC) as den_rnk
FROM Employee e							
								--for every duplicate record, it will NOT skips a value in a very next record while ranking.
  

SELECT * 
FROM (
		SELECT e.*,
		DENSE_RANK() OVER(PARTITION BY dept_name ORDER BY salary DESC) as den_rnk
		FROM Employee e	) X 
WHERE X.den_rnk < 4


--ROW_NUMBER(), RANK() & DENSE_RANK() in one query
	SELECT e.*,
	ROW_NUMBER() OVER(PARTITION BY dept_name ORDER BY salary) as row_num,
	RANK() OVER(PARTITION BY dept_name ORDER BY salary) as rnk,
	DENSE_RANK() OVER(PARTITION BY dept_name ORDER BY salary) as den_rnk
	FROM Employee e;

--Question : Why we are not passing any column name inside RANK(),ROW_NUMER(),DENSE_RABK() ?
		--RANK(),ROW_NUMER(),DENSE_RABK() are the just Function, which will assign a value for every record, which has been detected or Identified by what we are mention in OVER() clause.

/*
	LAG()
*/
		
--USE CASE:	Fetch a query to display if the salary of an CURRENT Employee is higher, lower or eual to the PREVIOUS employee 

-- comparing current employee salary with previous employee salary in each department----> LAG()

SELECT e.*,
LAG(Salary) OVER(PARTITION BY dept_name ORDER BY emp_id ) as pev_emp_sal
FROM Employee e
						--ORDER BY emp_id, bcz we need to check the salary of previous employee so ao need in ascending order, that means less emp_id is more previous employee and more emp_id was a current employee
						--if previous employee is not present for a record it shows NULL

--by default, LAG() will check ONLY ONE previous record.
--Argument passing in LAG():
			--LAG(Salary,2,0)
			--salry is coulmn that need to check 
			--2 is to check/comparing with 2nd previous record
			--0 is, If no previous record, it will return 0, instead of NULL by default.

			-----2nd previous
			-----
			-----current
			-----

SELECT e.*,
LAG(Salary,2,0) OVER(PARTITION BY dept_name ORDER BY emp_id ) as pev_emp_sal
FROM Employee e


/*
	LEAD()

*/

--Use Case: Fetch a query to display, if the salary of the current employee is higher, lower, or equal to the NEXT employee.

	--comparing salary of current employee with the NEXT employee-----> LEAD()

SELECT e.*,
LEAD(Salary) OVER(PARTITION BY dept_name ORDER BY emp_id) as Next_emp_sal
FROM Employee e

SELECT e.*,
LEAD(Salary,2,0) OVER(PARTITION BY dept_name ORDER BY emp_id) as Next_emp_sal
FROM Employee e

--Argument passing in LEAD(Salary,2,0)
							--checking for next 2nd salary
							--instead of NULL by default, return 0 if no found

--both LEAD() & LAG()

SELECT e.*,
LAG(Salary) OVER(PARTITION BY dept_name ORDER BY emp_id) as prev_emp_sal,
LEAD(Salary) OVER(PARTITION BY dept_name ORDER BY emp_id ) as Next_emp_sal
FROM Employee e

/*use case: Fetch, if the salary of current employee is Higher than the Previous employee, then display 'HIGHER'.
			if the salary of current employee is Lower than the Previous employee, then display 'LOWER'.
			if the salary of current employee is Equal than the Previous employee, then display 'EQUAL'.	*/


		--comparing current employee salary with previous employee salary so use LAG()

SELECT e.*, 
LAG(Salary) OVER(PARTITION BY dept_name ORDER BY emp_id) as prev_emp_sal,
CASE 
	WHEN e.Salary > LAG(Salary) OVER(PARTITION BY dept_name ORDER BY emp_id) THEN 'HIGHER'
	WHEN e.Salary < LAG(Salary) OVER(PARTITION BY dept_name ORDER BY emp_id) THEN 'LOWER'	
	ELSE 'EQUAL'
END as sal_range
FROM Employee e;


/*
	Other windows Functions are:
					Nth Value
					First Value
					Last Value
					Entile
*/
