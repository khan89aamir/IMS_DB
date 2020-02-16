CREATE TABLE [dbo].[SalesDetails]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [InvoiceID] INT NULL, 
    [ProductID] INT NULL, 
    [CreatedBy] INT NULL, 
    [CreatedOn] DATETIME NULL, 
    [ModifiedBy] INT NULL, 
    [ModifiedOn] DATETIME NULL, 
    [QTY] NCHAR(10) NULL
)
