CREATE TABLE [dbo].[tblFormRightDetails]
(
	[FormID] INT NOT NULL PRIMARY KEY IDENTITY, 
    [FormName] NVARCHAR(50) NULL, 
    [ParentID] INT NULL
)
