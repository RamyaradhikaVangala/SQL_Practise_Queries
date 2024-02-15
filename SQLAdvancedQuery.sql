SELECT TOP (1000) [EmployeeID]
      ,[FirstName]
      ,[LastName]
      ,[Age]
      ,[Gender]
  FROM [SQLPractise].[dbo].[EmployeeDemographics]
Update [SQLPractise].[dbo].[EmployeeDemographics]
Set Gender= 'Female'
Where FirstName = 'Holly' and LastName = 'Flax'
Delete FROM [SQLPractise].[dbo].[EmployeeDemographics]
Where EmployeeID = 1005
Select * FROM [SQLPractise].[dbo].[EmployeeDemographics]
Select * FROM [SQLPractise].[dbo].[EmployeeSalary]


Select FirstName, LastName, Salary, Gender,
Count(Gender) OVER (Partition By Gender) As TotalGender,
Avg(Salary) OVER (Partition By Gender) As AvgSalary
FROM [SQLPractise].[dbo].[EmployeeDemographics] dem
Join [SQLPractise].[dbo].[EmployeeSalary] sal
ON dem.EmployeeID = sal.EmployeeID
Where Salary > 45000

WITH CTE_Employee As
(Select FirstName, LastName, Salary, Gender,
Count(Gender) OVER (Partition By Gender) As TotalGender,
Avg(Salary) OVER (Partition By Gender) As AvgSalary
FROM [SQLPractise].[dbo].[EmployeeDemographics] dem
Join [SQLPractise].[dbo].[EmployeeSalary] sal
ON dem.EmployeeID = sal.EmployeeID
Where Salary > 45000
)
Select FirstName, AvgSalary
FROM CTE_Employee

CREATE TABLE #temp_Employee(
EmployeeID int,
JobTitle varchar(100),
Salary int
)
Select * FROM #temp_Employee

INSERT INTO #temp_Employee 
Select * FROM [SQLPractise].[dbo].[EmployeeSalary]

/*

Today's Topic: String Functions - TRIM, LTRIM, RTRIM, Replace, Substring, Upper, Lower

*/

--Drop Table EmployeeErrors;


CREATE TABLE EmployeeErrors (
EmployeeID varchar(50)
,FirstName varchar(50)
,LastName varchar(50)
)

Insert into EmployeeErrors Values 
('1001  ', 'Jimbo', 'Halbert')
,('  1002', 'Pamela', 'Beasely')
,('1005', 'TOby', 'Flenderson - Fired')

Select * FROM EmployeeErrors
Select EmployeeID, TRIM(EmployeeID) AS IDTRIM
FROM EmployeeErrors

Select EmployeeID, LTRIM(EmployeeID) AS IDTRIM
FROM EmployeeErrors
Select EmployeeID, RTRIM(EmployeeID) AS IDTRIM
FROM EmployeeErrors

Select LastName, REPLACE(LastName, '- Fired', 'Flash') As UpdatedLastname
FROM EmployeeErrors

Select Substring(err.FirstName,1,3), Substring(dem.FirstName,1,3), Substring(err.LastName,1,3), Substring(dem.LastName,1,3)
FROM EmployeeErrors err
JOIN [SQLPractise].[dbo].[EmployeeDemographics] dem
	on Substring(err.FirstName,1,3) = Substring(dem.FirstName,1,3)
	and Substring(err.LastName,1,3) = Substring(dem.LastName,1,3)


Select Firstname, UPPER(FirstName)
from EmployeeErrors
Select Firstname, Lower(FirstName)
from EmployeeErrors

CREATE PROCEDURE Test
As
Select * from EmployeeErrors

Exec Test

CREATE PROCEDURE Temp_Employee
AS
DROP TABLE IF EXISTS #temp_employee
Create Table #temp_employee(
JobTitle varchar(100),
EmployeesPerJob int,
AvgAge int,
AvgSalary int
)
Insert into #temp_employee
SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
FROM [SQLPractise].[dbo].[EmployeeDemographics] emp
JOIN [SQLPractise].[dbo].[EmployeeSalary] sal
	ON emp.EmployeeID = sal.EmployeeID
group by JobTitle

Select * FROM #temp_employee

EXEC Temp_Employee

/*Altering a Procedure */
ALTER PROCEDURE Temp_Employee
@JobTitle nvarchar(100)
AS
DROP TABLE IF EXISTS #temp_employee
Create Table #temp_employee(
JobTitle varchar(100),
EmployeesPerJob int,
AvgAge int,
AvgSalary int
)
Insert into #temp_employee
SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
FROM [SQLPractise].[dbo].[EmployeeDemographics] emp
JOIN [SQLPractise].[dbo].[EmployeeSalary] sal
	ON emp.EmployeeID = sal.EmployeeID
Where JobTitle = @JobTitle
group by JobTitle

Select * FROM #temp_employee

EXEC Temp_Employee @JobTitle = 'Salesman'
EXEC Temp_Employee @JobTitle = 'Accountant'

/*Subqueries (in the Select, From, and Where Statement) */

Select EmployeeID, JobTitle, Salary
From [SQLPractise].[dbo].[EmployeeSalary]

Select * FROM [SQLPractise].[dbo].[EmployeeSalary]

-- Subquery in Select
Select EmployeeID, Salary, (Select Avg(Salary) FROM [SQLPractise].[dbo].[EmployeeSalary])
as AvgSalary
From [SQLPractise].[dbo].[EmployeeSalary]

-- How to do it with Partition By
Select EmployeeID, Salary, AVG(Salary) over () as AllAvgSalary
From [SQLPractise].[dbo].[EmployeeSalary]

-- Checking the results with 'Group By'
Select EmployeeID, Salary, AVG(Salary) as AllAvgSalary
From [SQLPractise].[dbo].[EmployeeSalary]
Group by EmployeeID, Salary
order by EmployeeID

-- Subquery in From
Select a.EmployeeID, AllAvgSalary
From (Select EmployeeID, Salary, AVG(Salary) over () as AllAvgSalary
From [SQLPractise].[dbo].[EmployeeSalary]
) a
order by a.EmployeeID

-- Subquery in Where
Select EmployeeID, JobTitle, Salary
From [SQLPractise].[dbo].[EmployeeSalary]
Where EmployeeID in (Select EmployeeID 
FROM [SQLPractise].[dbo].[EmployeeDemographics]
Where Age >30)
Order by EmployeeID