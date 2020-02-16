CREATE TABLE [dbo].[SalesInvoiceDetails]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [InvoiceNumber] NVARCHAR(50) NULL, 
    [InvoiceDate] DATETIME NULL, 
    [SubTotal] DECIMAL(18, 3) NULL, 
    [Discount] DECIMAL(18, 3) NULL, 
    [Tax] DECIMAL(18, 3) NULL, 
    [GrandTotal] DECIMAL NULL, 
    [CreatedBy] INT NULL, 
    [CreatedOn] DATETIME NULL, 
    [ModifiedBy] INT NULL, 
    [ModifiedOn] DATETIME NULL, 
    [CustomerName] NVARCHAR(500) NULL, 
    [SalesMan] INT NULL, 
    [ShopeID] INT NULL
)
