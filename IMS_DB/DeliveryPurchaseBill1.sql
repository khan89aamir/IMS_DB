CREATE TABLE [dbo].[DeliveryPurchaseBill1](
	[DeliveryPurchaseID1] [int] IDENTITY(1,1) NOT NULL,
	[SupplierBillNo] [varchar](50) NOT NULL,
	[SizeTypeID] [int] NULL,
	[ModelNo] [nvarchar](50) NULL,
	[CreatedBy] [int] NOT NULL CONSTRAINT [DF_DeliveryPurchaseBill1_CreatedBy]  DEFAULT ((0)),
	[CreatedOn] [datetime] NOT NULL CONSTRAINT [DF_DeliveryPurchaseBill1_CreatedOn]  DEFAULT (getdate()),
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_DeliveryPurchaseBill1] PRIMARY KEY CLUSTERED 
(
	[DeliveryPurchaseID1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO