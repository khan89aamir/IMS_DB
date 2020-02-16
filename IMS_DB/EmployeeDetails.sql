CREATE TABLE [dbo].[EmployeeDetails]
(
	[EmpID] INT NOT NULL PRIMARY KEY IDENTITY, 
    [EmployeeCode] NVARCHAR(50) NULL, 
    [Name] NVARCHAR(50) NULL, 
    [ShopID] INT NULL, 
    [Gender] BIT NULL, 
    [DOB] DATETIME NULL, 
    [Address] NVARCHAR(MAX) NULL, 
    [Photo] VARBINARY(MAX) NULL, 
    [CreatedBy] INT NULL, 
    [CreatedOn] DATETIME NULL, 
    [UpdatedBy] INT NULL, 
    [UpdatedOn] DATETIME NULL
)
