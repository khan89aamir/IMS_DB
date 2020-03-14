﻿-- =============================================
-- Author:		<AAMIR KHAN>
-- Create date: <14th MARCH 2020>
-- Description:	<Description,,>
-- =============================================
--EXEC Get_Product_Master '0'
--EXEC Get_Product_Master 'b'
CREATE PROCEDURE Get_Product_Master
@ProductName NVARCHAR(100)='0'
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	BEGIN TRY
	DECLARE @PARAMERES VARCHAR(MAX)=''
	SET @PARAMERES=@ProductName

	SET NOCOUNT ON;
	IF @ProductName = '0'
	BEGIN

	SELECT pm.ProductID,pm.ProductName,pm.CategoryID,cm.CategoryName AS [Department],Photo
	,(CASE WHEN pm.ActiveStatus =1 THEN 'Active' WHEN pm.ActiveStatus =0 THEN 'InActive' END)ActiveStatus
	FROM ProductMaster pm
	INNER JOIN CategoryMaster cm ON pm.CategoryID = cm.CategoryID

	END

	ELSE
	BEGIN
	
	SELECT pm.ProductID,pm.ProductName,pm.CategoryID,cm.CategoryName AS [Department],Photo
	,(CASE WHEN pm.ActiveStatus =1 THEN 'Active' WHEN pm.ActiveStatus =0 THEN 'InActive' END)ActiveStatus
	FROM ProductMaster pm
	INNER JOIN CategoryMaster cm ON pm.CategoryID = cm.CategoryID
	WHERE pm.ProductName LIKE ''+@ProductName+'%'

	END
	
	END TRY

	BEGIN CATCH
	INSERT [dbo].[ERROR_Log]
	(
	ERR_NUMBER
	, ERR_SEVERITY
	, ERR_STATE
	, ERR_LINE
	, ERR_MESSAGE
	, ERR_PROCEDURE
	, PARAMERES
	)
	SELECT  
	ERROR_NUMBER() 
	,ERROR_SEVERITY() 
	,ERROR_STATE() 
	,ERROR_LINE()
	,ERROR_MESSAGE()
	,ERROR_PROCEDURE()
	,@PARAMERES
	
	END CATCH
END