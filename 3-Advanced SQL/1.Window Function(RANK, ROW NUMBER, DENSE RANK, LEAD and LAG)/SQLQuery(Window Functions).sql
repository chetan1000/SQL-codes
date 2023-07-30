CREATE TABLE SQLTutorial.dbo.Employee(emp_id int,emp_name varchar(50),dept_name varchar(50),salary int);

INSERT INTO SQLTutorial..Employee VALUES(101,'Chetan','IT',20000),
(102,'Pragati','HR',15000),
(103,'Sagar','Finance',11000),
(104,'Abhi','Admin',10000),
(105,'Sagar PK','IT',30000),
(106,'Praveen','Admin',18000),
(107,'Vinay','Finance',19000),
(108,'Swati','HR',25000);

SELECT e.*
FROM SQLTutorial.dbo.Employee e;

/*
WINDOW Function's
*/


--MAX salary earned by an employee in the table
SELECT MAX(salary)
FROM SQLTutorial..Employee

--MAX salary by each Department
SELECT dept_name,MAX(salary) AS max_salary
FROM SQLTutorial..Employee
GROUP BY dept_name

--Fetch the all records or details of employee table along with MAXimum salary
SELECT e.*,
MAX(salary) OVER() AS max_salary
FROM SQLTutorial..Employee e;
		--Max() is an Aggregate Function
		--OVER() is clause, it tells SQL to not consider MAX() as Aggregate Function and consider it as WINDOW function or ANALYTIC function
		--OVER() it creates a WINDOW for all our 8 records
		--Then the Function MAX() is applied to that window and searches the MAX(salary)
		--prints the MAX(salary) for each records
		--OVER() , in brackets we did not put any column, so it creates Only One Window


--Fetch the max salary in each Department along with each employee details   OR
--fetch Max Salary corresponding to each departments along with all records in table

SELECT e.*,
MAX(salary) OVER(PARTITION BY dept_name) AS maxSalaryDept
FROM SQLTutorial..Employee e;
							
							--PARTITION BY is Clause
							--PARTION BY dept_name
							--For every distinct value present in dept_name column, it will create WINDOW's
							--Then it will apply FUNCTIONS like MAX() to each of those window's
							--then it will fetch max(salary) with respect to each dept and prints max(salary) for every records wrt each dept




		