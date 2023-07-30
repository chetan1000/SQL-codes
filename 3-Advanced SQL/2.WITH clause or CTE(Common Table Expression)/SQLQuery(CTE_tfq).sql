--CREATE TABLE SQLLearn..Emoloyee1(
--emp_id int,
--emp_name varchar(50),
--salary int)

--INSERT INTO Emoloyee1 VALUES
--(101,'chetan',40000),
--(102,'mohan',50000),
--(103,'Ganesh',60000),
--(104,'Ramesh',70000),
--(105,'Halesh',80000),
--(106,'praveen',90000);

SELECT *
FROM SQLLearn..Emoloyee1

/*
WITH clause  or
CTE (Common Table Expression) or
SubQuery Factoring
*/

--Not always SQL query start with SELECT statement it also start with WITH clause




--Fetch the salary of all the employees whose salary is greater than the average salary of all the employees in this table


WITH average_salary(avg_sal) as
		(SELECT AVG(salary) FROM SQLLearn..Emoloyee1)

SELECT *
FROM SQLLearn..Emoloyee1 e, average_salary av
WHERE e.salary > av.avg_sal;
								--it will first execute WITH clause after that SELECT statement get executed
							

--CREATE TABLE Stores(
--store_id int,
--store_name varchar(50),
--product varchar(50),
--quantity int,
--cost int)

--INSERT INTO Stores VALUES
--(1,'Apple Originals1','iPhone 12 Pro',1,1000),
--(1,'Apple Originals1','Macbook Pro 13',3,2000),
--(1,'Apple Originals1','Airpods pro',2,200),
--(2,'Apple Originals2','iPhone 12 Pro',2,1000),
--(3,'Apple Originals3','iPhone 12 Pro',1,1000),
--(3,'Apple Originals3','macbook Pro 13',1,2000),
--(3,'Apple Originals3','Macbook Air',4,1100),
--(2,'Apple Originals2','iPhone Pro 13',3,1200),
--(4,'Apple Originals4','iPhone 12 Pro',3,1000),
--(4,'Apple Originals4','Macbook Pro 13',2,1000);

SELECT *
FROM SQLLearn..Stores;

--Find the store's who's sales where better than the AVERAGE sales across all stores.
		--We need to solve by these steps
--1. We need to find total sales per each store
--2. Find the average sales wrt all stores
--3. Find the stores Where Total sales per each store > Average sales of all stores.


--By using Subquery method

--1. Total sales per each store-----Total_sales
SELECT s.store_id,SUM(cost) as total_sales_per_store
FROM SQLLearn..Stores s
GROUP BY s.store_id

--2. Finding the average sales wrt all stores----------AVG_sales
SELECT AVG(total_sales_per_store) as avg_sales_for_all_stores
FROM (SELECT s.store_id,SUM(cost) as total_sales_per_store
	  FROM SQLLearn..Stores s
	  GROUP BY s.store_id) X

--3. Find the stores where the total_sales > Avg_sales_for_all_stores
SELECT *
FROM(SELECT s.store_id, SUM(cost) as total_sales_per_store
	FROM SQLLearn..Stores s
	GROUP BY s.store_id) total_sales

JOIN(SELECT AVG(total_sales_per_store) as avg_sales_per_stores
	FROM(SELECT s.store_id,SUM(cost) as total_sales_per_store
		FROM SQLLearn..Stores s
		GROUP BY s.store_id) X) avg_sales

ON total_sales.total_sales_per_store > avg_sales.avg_sales_per_stores

		--we used subquery, it is difficult to understand and it is too messy


--above query by using WITH clause

WITH total_sales(store_id,total_sales_per_store) as 
	(SELECT s.store_id,SUM(cost) as total_sales_per_store
	FROM SQLLearn..Stores s
	GROUP BY s.store_id),

	avg_sales(avg_sales_per_all_stores) as
	(SELECT AVG(total_sales_per_store) as avg_sales_per_all_stores
	FROM total_sales)

SELECT *
FROM  total_sales ts
JOIN avg_sales av
ON ts.total_sales_per_store > av.avg_sales_per_all_stores


	--when we did not used WITH clause,a particular subquery is used multiple times, which is not a good practise
	--by using WITH, see thatSELECT statement is looking so simple, this become very easy to read
	--while writing complex query, if we not used WITH clause, it really looks messy.


--Adavantages of using WITH clause
	--by writing a query with WITH clause, the query is easy to readable and also easier to maintain and debug
	--Improvement in performance by using WITH clause in SQL query
	--Using WITH clause in Recursive queries is very useful












