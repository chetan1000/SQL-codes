/*
PARTITION BY
*/

--PARTITION BY, actually divides result set into partitions and changes the how the window function is calculated


SELECT Firstname,LastName,Gender,Salary
FROM SQLTutorial..EmployeeDemographics dem
JOIN SQLTutorial..EmployeeSalary sal
ON dem.EmployeeID = sal.EmployeeID


SELECT Firstname,LastName,Gender,Salary,
COUNT(Gender) OVER() AS TotalCount
FROM SQLTutorial..EmployeeDemographics dem
JOIN SQLTutorial..EmployeeSalary sal
ON dem.EmployeeID = sal.EmployeeID
		--OVER() is clause it will create window 
		--COUNT() is aggregate Function, OVER() clause tells SQl to treat COUNT as Window Function not as an aggregate function
		--OVER() we didn't passed any column into the OVER clause so it will create one widnow for all records and
		--applies the COUNT function for all records and calculate count and prints the output 

SELECT Firstname,LastName,Gender,Salary,
COUNT(Gender) OVER(PARTITION BY Gender) AS TotalGender		--How many males and Females Employees are there
FROM SQLTutorial..EmployeeDemographics dem
JOIN SQLTutorial..EmployeeSalary sal
ON dem.EmployeeID = sal.EmployeeID
						--in OVER() we paased column
						--PARTION BY is Clause, it will create  windows or Partitions for each Distinct records present in Gender Column
						--in Gender column, For MALE and FEMALE are two distincts records it will create two windows/Partitions and applies COUNT function
						--For each record present in each windows, it will calculates count

SELECT Firstname,LastName,Gender,Salary,COUNT(Gender)
FROM SQLTutorial..EmployeeDemographics dem
JOIN SQLTutorial..EmployeeSalary sal
ON dem.EmployeeID = sal.EmployeeID
GROUP BY Firstname,LastName,Salary,Gender;
				--but output not consists as expected Aggregate result
				--if we SElected all columns and also used the Aggregate function, Grouping is not possible
				--Group By each column like FirstName,Last Name,Gender,Salary is difficult
				--all columns which are used in SELECT , have to be used in GROUP BY statement also
				--With all records details with each columns of a table can't be fetch by GROUP BY statement , and this is achived By PARTITION BY and OVER clause with WINDOWS Function