﻿-- =============================================
-- Author:		<AAMIR KHAN>
-- Create date: <12th MARCH 2020>
-- Description:	<Description,,>
-- =============================================
--EXEC Get_ProductDetails_Popup 'bag'
CREATE PROCEDURE Get_ProductDetails_Popup
@ProductName NVARCHAR(100)=''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from

	SET NOCOUNT ON;
	BEGIN TRY
	
	DECLARE @PARAMERES VARCHAR(MAX)=''
	SET @PARAMERES=@ProductName

	SELECT pm.ProductID,pm.ProductName,pm.CategoryID,cm.CategoryName AS [Department]
	FROM ProductMaster pm
	LEFT OUTER JOIN CategoryMaster cm ON pm.CategoryID = cm.CategoryID
	WHERE ISNULL(pm.ActiveStatus,1) = 1
	AND pm.ProductName LIKE ''+@ProductName+'%'+''

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