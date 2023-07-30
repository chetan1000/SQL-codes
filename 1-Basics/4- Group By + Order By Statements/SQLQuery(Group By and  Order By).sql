/*
GROUP BY, ORDER BY
*/

SELECT *
FROM EmployeeDemographics;

SELECT DISTINCT(gender)
FROM EmployeeDemographics;  -- it returns unique values

SELECT Gender
FROM EmployeeDemographics
GROUP BY Gender;
--it returns rows as group where all rows of same group are rolled up into one

SELECT Gender, COUNT(Gender)
FROM EmployeeDemographics
GROUP BY Gender;

SELECT gender, Age, COUNT(Gender)
FROM EmployeeDemographics
GROUP BY Gender, Age;

SELECT Gender, COUNT(gender)
FROM EmployeeDemographics
WHERE Age > 27
GROUP BY Gender;

	--ORDER BY
SELECT Gender, COUNT(gender) AS CountGender
FROM EmployeeDemographics
WHERE Age > 27
GROUP BY Gender
ORDER BY CountGender;  --Deafault it take ASC

SELECT Gender, COUNT(gender) AS CountGender
FROM EmployeeDemographics
WHERE Age > 27
GROUP BY Gender
ORDER BY CountGender ASC; 

SELECT Gender, COUNT(gender) AS CountGender
FROM EmployeeDemographics
WHERE Age > 27
GROUP BY Gender
ORDER BY CountGender DESC; 

SELECT Gender, COUNT(gender) AS CountGender
FROM EmployeeDemographics
WHERE Age > 27
GROUP BY Gender
ORDER BY Gender; 

SELECT Gender, COUNT(gender) AS CountGender
FROM EmployeeDemographics
WHERE Age > 27
GROUP BY Gender
ORDER BY Gender DESC; 

SELECT *
FROM EmployeeDemographics
ORDER BY Age;

SELECT *
FROM EmployeeDemographics
ORDER BY Age DESC;

SELECT *
FROM EmployeeDemographics
ORDER BY Age, Gender;

SELECT *
FROM EmployeeDemographics
ORDER BY Age, Gender DESC;  --Age is ASC order and Only Gender is in DESC

SELECT *
FROM EmployeeDemographics
ORDER BY Age DESC, Gender DESC;

SELECT *
FROM EmployeeDemographics
ORDER BY 1,2,3,4,5;

SELECT *
FROM EmployeeDemographics
ORDER BY 4;		--We Can Use column index number

SELECT *
FROM EmployeeDemographics
ORDER BY 5 DESC;

SELECT *
FROM EmployeeDemographics
ORDER BY 4 DESC, 5 DESC;



