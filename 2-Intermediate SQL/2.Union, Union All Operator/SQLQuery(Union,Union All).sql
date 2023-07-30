/*
UNION, UNION ALL
*/


CREATE TABLE WareHouseEmoloyeeDemographics(EmployeeID int,
FirstName varchar(50),LastName varchar(50), Age int, Gender Varchar(10));

INSERT INTO WareHouseEmoloyeeDemographics VALUES(1050,'Vishwa','G',26,'Male'),
(1051,'Yash','KGF',38,'Male'),
(1052,'Uppi','Kabzaa',45,'Male'),
(1013,'Haalesh','Katagi',Null,Null);

SELECT *
FROM SQLTutorial.dbo.WareHouseEmoloyeeDemographics;

--SELECT SqlTutorial.dbo.WareHouseEmoloyeeDemographics.EmployeeID,EmployeeDemographics.Firstname,EmployeeDemographics.LastName,EmployeeDemographics.Age,EmployeeDemographics.Gender
--FROM SQLTutorial.dbo.EmployeeDemographics
--FULL OUTER JOIN SQLTutorial.dbo.WareHouseEmoloyeeDemographics
--ON EmployeeDemographics.EmployeeID = WareHouseEmoloyeeDemographics.EmployeeID;

SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
UNION										--if any rows are same in both table, it will returns rows single time, it will not returns the duplicate rows
SELECT *
FROM SQLTutorial.dbo.WareHouseEmoloyeeDemographics;

SELECT EmployeeID,Firstname,LastName
FROM SQLTutorial.dbo.EmployeeDemographics
UNION				---All queries combined using a UNION, INTERSECT or EXCEPT 
					---operator must have an equal number of expressions in their target lists.
SELECT EmployeeID,FirstName
FROM SQLTutorial.dbo.WareHouseEmoloyeeDemographics;

SELECT EmployeeID,Firstname,LastName
FROM SQLTutorial.dbo.EmployeeDemographics
UNION					--from both table we selecting equal number of columns 
						--but columns are different but there datatypes are same.
SELECT Age,FirstName,Gender
FROM SQLTutorial.dbo.WareHouseEmoloyeeDemographics;

SELECT EmployeeID,Firstname,Age
FROM SQLTutorial.dbo.EmployeeDemographics 
UNION								--Both tables columns are diffrent but equal in number and also having Same datatypes
SELECT EmployeeID,JobTitle,Salary
FROM SQLTutorial.dbo.EmployeeSalary
ORDER BY EmployeeID;


SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
UNION ALL									--it returns all the rows even if the same rows present in both tables
SELECT *
FROM SQLTutorial.dbo.WareHouseEmoloyeeDemographics;




