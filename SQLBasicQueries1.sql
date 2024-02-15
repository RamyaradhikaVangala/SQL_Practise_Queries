INSERT INTO EmployeeDemographics Values 
(1001, 'Jim', 'Halpert', 30, 'Male'),
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male')


INSERT INTO EmployeeSalary Values
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000)

/* Select Statement
* ,Top, Distinct, Count, As, Max, Min, Avg
*/
SELECT * FROM EmployeeDemographics
SELECT Firstname FROM EmployeeDemographics
SELECT Count(Firstname) FROM EmployeeDemographics
SELECT Firstname FROM EmployeeDemographics
SELECT Top 5 * FROM EmployeeDemographics
SELECT DISTINCT(Gender) FROM EmployeeDemographics
SELECT Count(Lastname) AS LastNameCount FROM EmployeeDemographics
SELECT * FROM EmployeeSalary
SELECT Avg(Salary)
FROM SQLPractise.dbo.EmployeeSalary
SELECT Max(Salary) AS MaximumSalary
FROM SQLPractise.dbo.EmployeeSalary
SELECT Min(Salary) AS MinimumSalary
FROM SQLPractise.dbo.EmployeeSalary

/* WHERE Statement
=, <>, <, >, And, Or, Like, Null, Not Null, In */

SELECT * FROM EmployeeDemographics
Where Firstname <> 'Jim'

SELECT * FROM EmployeeDemographics
Where Age < 32 

SELECT * FROM EmployeeDemographics
Where Age <= 32 And Gender = 'Male'

SELECT * FROM EmployeeDemographics
Where Firstname Like 'S%'

SELECT * FROM EmployeeDemographics
Where Lastname Like 'S%o%'

SELECT * FROM EmployeeDemographics
Where Firstname is NOT NULL





