CREATE TABLE EmployeeDemographics
(EmployeeID int,
Firstname varchar(50),
LastName varchar(50),
Age int,
Gender varchar(50)
)

CREATE TABLE EmployeeSalary(
EmployeeID int,
JobTitle varchar(50),
Salary int)


INSERT INTO EmployeeDemographics VALUES
(1001,'Jim','Halpert',30,'Male'),
(1002,'Pam','Beasley',30,'Female'),
(1003,'Chetan','Patil',25,'Male'),
(1004,'Pragati','Deshapande',25,'Female'),
(1005,'Sagar','Malligavad',27,'Male'),
(1006,'Abhi','N',28,'Male'),
(1007,'Vinay','Bakale',29,'Male'),
(1008,'Swati','Bellary',30,'Female'),
(1009,'Sampath','Mudagalla',31,'Male')


INSERT INTO EmployeeSalary VALUES
(1001,'Salesman',45000),
(1002,'Receptionalist',36000),
(1003,'Accountant',63000),
(1004,'HR',50000),
(1005,'Regional Manager',65000),
(1006,'Supplier Relations',41000),
(1007,'Salesman',40000),
(1008,'Accountant',50000),
(1009,'Manager',70000);

   * means EveryThing or ALL