﻿-- =============================================
-- Author:		<AAMIR KHAN>
-- Create date: <12th MARCH 2020>
-- Description:	<Description,,>
-- =============================================
--EXEC Get_Material_Details 2,1
CREATE PROCEDURE [dbo].[Get_Material_Details]
@ProductID INT=0
,@StoreID INT=0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;
	BEGIN TRY
	
	DECLARE @PARAMERES VARCHAR(MAX)=''
	SET @PARAMERES=CONCAT(@ProductID,',',@StoreID)
	
	IF @ProductID > 0 OR @StoreID > 0
	BEGIN

	SELECT pm.ProductID,pm.ProductName,pm.CategoryID,cm.CategoryName [Department]
	,ps.StoreID,sm.StoreName,s1.SizeTypeID,st.SizeTypeName,c1.ColorName,ps.SizeID,s1.Size,ISNULL(ps.QTY, 0)QTY
	FROM ProductMaster pm
	LEFT OUTER JOIN [dbo].[ProductStockColorSizeMaster] ps ON pm.ProductID = ps.ProductID
	LEFT OUTER JOIN CategoryMaster cm ON pm.CategoryID = cm.CategoryID
	LEFT OUTER JOIN StoreMaster sm ON ps.StoreID = sm.StoreID
	LEFT OUTER JOIN ColorMaster c1 ON ps.ColorID = c1.ColorID
	LEFT OUTER JOIN SizeMaster s1 ON ps.SizeID = s1.SizeID
	LEFT OUTER JOIN SizeTypeMaster st ON s1.SizeTypeID = st.SizeTypeID
	WHERE pm.ProductID = ISNULL(@ProductID,pm.ProductID) 
	AND ps.StoreID = ISNULL(@StoreID,ps.StoreID)
	ORDER BY pm.ProductID,ps.StoreID,s1.SizeTypeID,ps.ColorID
	END

	ELSE
	BEGIN
	SELECT TOP 100 pm.ProductID,pm.ProductName,pm.CategoryID,cm.CategoryName [Department]
	,ps.StoreID,sm.StoreName,s1.SizeTypeID,st.SizeTypeName,c1.ColorName,ps.SizeID,s1.Size,ISNULL(ps.QTY, 0)QTY
	FROM ProductMaster pm
	LEFT OUTER JOIN [dbo].[ProductStockColorSizeMaster] ps ON pm.ProductID = ps.ProductID
	LEFT OUTER JOIN CategoryMaster cm ON pm.CategoryID = cm.CategoryID
	LEFT OUTER JOIN StoreMaster sm ON ps.StoreID = sm.StoreID
	LEFT OUTER JOIN ColorMaster c1 ON ps.ColorID = c1.ColorID
	LEFT OUTER JOIN SizeMaster s1 ON ps.SizeID = s1.SizeID
	LEFT OUTER JOIN SizeTypeMaster st ON s1.SizeTypeID = st.SizeTypeID
	--WHERE pm.ProductID = @ProductID AND ps.StoreID = ISNULL(@StoreID,ps.StoreID)
	ORDER BY pm.ProductID,ps.StoreID,s1.SizeTypeID,ps.ColorID
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