CREATE TABLE [dbo].[SalesDetails]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [InvoiceID] INT NULL, 
    [ProductID] INT NULL, 
    [QTY] INT NULL,
    [Rate] DECIMAL NULL,
	[CreatedBy] [int] NOT NULL CONSTRAINT [DF_SalesDetails_CreatedBy]  DEFAULT ((0)),
	[CreatedOn] [datetime] NOT NULL CONSTRAINT [DF_SalesDetails_CreatedOn]  DEFAULT (getdate()),
    [ModifiedBy] INT NULL, 
    [ModifiedOn] DATETIME NULL 
)
