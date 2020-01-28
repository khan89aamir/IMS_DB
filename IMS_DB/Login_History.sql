
CREATE TABLE [dbo].[Login_History](
	[Login_ID_History] [bigint] IDENTITY(1,1) NOT NULL,
	[Login_ID] [int] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[PcName] [nvarchar](50) NOT NULL,
	[MachineUserName] [nvarchar](50) NOT NULL,
	[UserIPAddress] [varchar](50) NOT NULL,
	[UserMacAddress] [varchar](50) NOT NULL,
	[LoginTime] [datetime] NOT NULL CONSTRAINT [DF_Login_History_LoginTime]  DEFAULT (getdate()),
	[LogOutTime] [datetime] NULL,
 CONSTRAINT [PK_Login_History] PRIMARY KEY CLUSTERED 
(
	[Login_ID_History] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO