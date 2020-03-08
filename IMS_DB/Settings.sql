CREATE TABLE [dbo].[DefaultStoreSetting]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [StoreID] INT NULL, 
    [MachineName] NVARCHAR(500) NULL, 
    [StoreCategory] INT NULL, 
    [BarCodeSetting] NVARCHAR(MAX) NULL, 
    [CreatedBy] INT NOT NULL CONSTRAINT [DF_DefaultStoreSetting_CreatedBy]  DEFAULT ((0)),
    [CreatedOn] DATETIME NOT NULL CONSTRAINT [DF_DefaultStoreSetting_CreatedOn]  DEFAULT (getdate())
   
    [BarCodeSetting] NVARCHAR(MAX) NULL, 
    [InvoiceFooterNote] NVARCHAR(MAX) NULL
)
