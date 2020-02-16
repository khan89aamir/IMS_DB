
CREATE TABLE [dbo].[ProductStockMaster](
	[ProductStockID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[QTY] [int] NOT NULL,
	[StoreID] [int] NOT NULL CONSTRAINT [DF_ProductStockMaster_StoreID]  DEFAULT ((0)),
	[CreatedBy] [int] NOT NULL CONSTRAINT [DF_ProductStockMaster_CreatedBy]  DEFAULT ((0)),
	[CreatedOn] [datetime] NOT NULL CONSTRAINT [DF_ProductStockMaster_CreatedOn]  DEFAULT (getdate()),
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL, 
    CONSTRAINT [PK_ProductStockMaster] PRIMARY KEY ([ProductStockID],[ProductID],[StoreID])
) ON [PRIMARY]

GO


