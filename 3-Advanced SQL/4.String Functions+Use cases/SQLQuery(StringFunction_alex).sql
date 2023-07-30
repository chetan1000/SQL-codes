/*
STRING FUNCTION'S:

TRIM, LTRIM, RTRIM, REPLACE, SUBSTRING, UPPER, LOWER....
*/

CREATE TABLE EmployeeErrors(
EmployeeID varchar(50),
FirstName varchar(50),
LastName varchar(50))

INSERT INTO EmployeeErrors VALUES
('1001 ','Jimbo','Halbert')
,(' 1002','Pamela','Beasely')
,('1005','Chetangouda','Patil')
,('100 7','PragatiChetan','Patil');


SELECT *
FROM EmployeeErrors


--Using TRIM, LTRIM, RTRIM
	--TRIM
SELECT EmployeeID,TRIM(EmployeeID) as TrimmedId
FROM EmployeeErrors

	--LTRIM
SELECT EmployeeID,LTRIM(EmployeeID) as TrimmedId
FROM EmployeeErrors

	--RTRIM
SELECT EmployeeID,RTRIM(EmployeeID) as TrimmedId
FROM EmployeeErrors


--Using REPLACE
SELECT LastName,REPLACE(LastName,'Halbert','Honda')			--REPALCE(columnname where we need to replace,'value that we are replacing','replacing value or value which sholu add this')
FROM EmployeeErrors

--Using SUBSTRING
		--substring is very Unique, we can specify either number or string
		--SUBSTRING(columnname,startingpoint,length/places where to stop)

SELECT FirstName,SUBSTRING(FirstName,1,3)
FROM EmployeeErrors

SELECT FirstName,SUBSTRING(FirstName,3,3)
FROM EmployeeErrors

		--Puzzy Matching
		--matching the employees firstname using SUBSTRING from both tables
SELECT err.FirstName,SUBSTRING(err.FirstName,1,3),dem.FirstName,SUBSTRING(err.FirstName,1,3)
FROM EmployeeErrors err
JOIN SQLTutorial..EmployeeDemographics dem
	ON SUBSTRING(err.FirstName,1,3) = SUBSTRING(dem.FirstName,1,3)


--UPPER and LOWER
SELECT FirstName,UPPER(FirstName)
FROM EmployeeErrors

SELECT FirstName,LOWER(FirstName)
FROM EmployeeErrors