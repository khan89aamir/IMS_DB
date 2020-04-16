CREATE TABLE [dbo].[tblUserRights]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [UserID] INT NULL, 
    [FormID] INT NULL, 
    [IsView] INT NULL, 
    [IsSave] INT NULL, 
    [IsUpdate] INT NULL, 
    [IsDelete] INT NULL, 
    [IsOther] INT NULL
)
