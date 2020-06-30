﻿CREATE TABLE [dbo].[tblFormRightDetails](
	[FormID] [int] IDENTITY(1,1) NOT NULL,
	[FormName] [varchar](50) NOT NULL,
	[ParentID] [int] NULL CONSTRAINT [DF_tblFormRightDetails_ParentID]  DEFAULT ((0)),
 CONSTRAINT [PK__tblFormR__FB05B7BD943B0D84] PRIMARY KEY CLUSTERED 
(
	[FormID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO