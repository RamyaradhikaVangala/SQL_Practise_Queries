SELECT TOP (1000) [EmployeeID]
      ,[FirstName]
      ,[LastName]
      ,[Age]
      ,[Gender]
  FROM [SQLPractise].[dbo].[EmployeeDemographics]

 Insert into EmployeeDemographics VALUES
(1011, 'Ryan', 'Howard', 26, 'Male'),
(NULL, 'Holly', 'Flax', NULL, NULL),
(1013, 'Darryl', 'Philbin', NULL, 'Male')

Select * FROM EmployeeDemographics 

Select * FROM EmployeeDemographics Join EmployeeSalary ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
Select * FROM SQLPractise.dbo.EmployeeDemographics Right Join SQLPractise.dbo.EmployeeSalary ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
Select * FROM SQLPractise.dbo.EmployeeDemographics Left Join SQLPractise.dbo.EmployeeSalary ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
