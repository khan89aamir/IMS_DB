CREATE TABLE [dbo].[DefaultStoreSetting]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [StoreID] INT NULL, 
    [MachineName] NVARCHAR(500) NULL, 
    [StoreCategory] NVARCHAR(50) NULL, 
    [BarCodeSetting] NVARCHAR(MAX) NULL
)
