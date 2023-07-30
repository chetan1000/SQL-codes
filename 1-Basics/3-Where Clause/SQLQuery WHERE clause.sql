/* Where Statement
=, <>, <, >, And, Or, Like, Null, Not Null, In
*/
SELECT * 
FROM EmployeeDemographics
WHERE Firstname = 'Jim';

SELECT *
FROM EmployeeDemographics
WHERE Firstname <> 'Jim';

SELECT *
FROM EmployeeDemographics
WHERE Age >= 25;

SELECT *
FROM EmployeeDemographics
WHERE age < 29;

SELECT *
FROM EmployeeDemographics
WHERE age > 35;

SELECT *
FROM EmployeeDemographics
WHERE age <= 32 AND Gender = 'Male';

SELECT *
FROM EmployeeDemographics
WHERE age <= 30 OR Gender = 'Male';

SELECT *
FROM EmployeeDemographics
WHERE FirstName LIKE 'S%';

SELECT *
FROM EmployeeDemographics
WHERE LastName LIKE '%S%';

SELECT *
FROM EmployeeDemographics
WHERE LastName LIKE 'P%a%ti%l%';

SELECT *
FROM EmployeeDemographics
WHERE Firstname IN('Chetan','Pragati');






