SELECT TOP (1000) [EmployeeID]
      ,[JobTitle]
      ,[Salary]
  FROM [SQLPractise].[dbo].[EmployeeSalary]
SELECT * FROM [SQLPractise].[dbo].[EmployeeSalary]
SELECT EmployeeID ,JobTitle, Salary, Count(*) 
  FROM [SQLPractise].[dbo].[EmployeeSalary]
  GROUP BY EmployeeID ,JobTitle, Salary
  Having Count(*) > 1
  DELETE FROM [SQLPractise].[dbo].[EmployeeSalary] Where EmployeeID not in (
  SELECT Max(EmployeeID) FROM [SQLPractise].[dbo].[EmployeeSalary] GROUP BY EmployeeID ,JobTitle, Salary)
  SELECT * FROM [SQLPractise].[dbo].[EmployeeSalary]

/*Deleting duplicate rows in a table */
  With Duplicate_CTE As(
  Select EmployeeID ,JobTitle, Salary, 
  ROW_NUMBER() OVER (Partition by EmployeeID ,JobTitle, Salary 
  ORDER BY Salary) As DupCount
  FROM [SQLPractise].[dbo].[EmployeeSalary] )
  Delete FROM Duplicate_CTE where DupCount>1

  SELECT * FROM [SQLPractise].[dbo].[EmployeeSalary]
