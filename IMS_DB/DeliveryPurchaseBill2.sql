CREATE TABLE [dbo].[DeliveryPurchaseBill2](
	[DeliveryPurchaseID2] [int] IDENTITY(1,1) NOT NULL,
	[DeliveryPurchaseID1] [int] NULL,
	[Col1] [varchar](50) NULL,
	[Col2] [varchar](50) NULL,
	[Col3] [varchar](50) NULL,
	[Col4] [varchar](50) NULL,
	[Col5] [varchar](50) NULL,
	[Col6] [varchar](50) NULL,
	[Col7] [varchar](50) NULL,
	[Col8] [varchar](50) NULL,
	[Col9] [varchar](50) NULL,
	[Col10] [varchar](50) NULL,
	[Col11] [varchar](50) NULL,
	[Col12] [varchar](50) NULL,
	[Col13] [varchar](50) NULL,
	[Col14] [varchar](50) NULL,
	[Col15] [varchar](50) NULL,
	[Col16] [varchar](50) NULL,
	[Col17] [varchar](50) NULL,
	[Col18] [varchar](50) NULL,
	[Col19] [varchar](50) NULL,
	[Col20] [varchar](50) NULL,
	[CreatedBy] [int] NOT NULL CONSTRAINT [DF_DeliveryPurchaseBill2_CreatedBy]  DEFAULT ((0)),
	[CreatedOn] [datetime] NOT NULL CONSTRAINT [DF_DeliveryPurchaseBill2_CreatedOn]  DEFAULT (getdate()),
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_DeliveryPurchaseBill2] PRIMARY KEY CLUSTERED 
(
	[DeliveryPurchaseID2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO