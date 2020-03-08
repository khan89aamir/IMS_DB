
-- =============================================
-- Author:		<AAMIR KHAN>
-- Create date: <07th MARCH 2020>
-- Description:	<Description,,>
-- =============================================
-- EXEC [dbo].[Get_PurchaseInvoice_BulkPrint_Color_Size] 'B33'
Create PROCEDURE [dbo].[Get_PurchaseInvoice_BulkPrint_Color_Size]
@SupplierBillNo VARCHAR(MAX) =''
--,@ModelNo NVARCHAR(50) =''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRY
	DECLARE @PARAMERES VARCHAR(MAX)=''
	BEGIN TRANSACTION
DECLARE @SizeType_ID AS INT=0
DECLARE @SizeValue AS VARCHAR(50)
DECLARE @i AS INT=1
DECLARE @DeliveryPurchaseID AS INT=0
DECLARE @query1  AS VARCHAR(MAX)=''
DECLARE @query2  AS VARCHAR(MAX)
DECLARE @queryunpivot  AS VARCHAR(MAX)=''
DECLARE @ModelNo NVARCHAR(50) =''

IF OBJECT_ID('tempdb..#PurchaseInvoice_Color_Size') IS NOT NULL DROP TABLE #PurchaseInvoice_Color_Size
CREATE TABLE #PurchaseInvoice_Color_Size
(
ID INT IDENTITY(1,1)
,ColorID INT
,Color	NVARCHAR(50)
,ProductID INT
,ProductName NVARCHAR(50)
,ModelNo NVARCHAR(50)
,QTY INT
,Size VARCHAR(50)
,Rate DECIMAL(18,2)
,BarcodeNo BIGINT
)

DECLARE OUTER_CURSOR CURSOR 
FOR
SELECT SizeTypeID,DeliveryPurchaseID1,ModelNo
FROM DeliveryPurchaseBill1 WITH(NOLOCK)
WHERE SupplierBillNo=''+@SupplierBillNo+''

OPEN OUTER_CURSOR 

FETCH NEXT FROM OUTER_CURSOR INTO @SizeType_ID,  @DeliveryPurchaseID, @ModelNo
WHILE @@FETCH_STATUS <> -1
BEGIN
	
	--select @SizeType_ID , @DeliveryPurchaseID, @ModelNo
	
	SET @PARAMERES=CONCAT(@SupplierBillNo,',',@ModelNo)

	SET @i = 1
	SET @query1=''
	SET @queryunpivot=''

	DECLARE cursor_Size CURSOR
	FOR
	SELECT Size FROM SizeMaster WITH(NOLOCK) WHERE SizeTypeID=@SizeType_ID;
	
	OPEN cursor_Size;
	
	FETCH NEXT FROM cursor_Size INTO @SizeValue

	WHILE @@FETCH_STATUS <> -1
	    BEGIN
		
		--print @SizeValue

		SET @query1 += 'MAX(CASE WHEN pd2.Col'+CAST(@i AS VARCHAR)+' = pd2.Col'+cast(@i AS VARCHAR)+
		' THEN pd3.Col'+CAST(@i as VARCHAR)+' END) '+QUOTENAME(@SizeValue)+',';

		SET @queryunpivot += QUOTENAME(@SizeValue);

		SET @i+=1;
	    FETCH NEXT FROM cursor_Size INTO @SizeValue;

		 IF @@FETCH_STATUS = 0 
			SET @queryunpivot +=',';

	    END;

	CLOSE cursor_Size;
	DEALLOCATE cursor_Size;
	
	--print  @query1

	SET @query2='
	SELECT ColorID,Color,ProductID,ProductName,QTY,Size,ModelNo,Rate FROM
	(SELECT clr.ColorName AS Color,
	clr.ColorID,pd1.ProductID,pm.ProductName,pd1.ModelNo,pm.Rate,'+@query1+'pd3.Total,FROM DeliveryPurchaseBill1 pd1
	INNER JOIN DeliveryPurchaseBill2 pd2 ON pd2.DeliveryPurchaseID1=pd1.DeliveryPurchaseID1
	INNER JOIN DeliveryPurchaseBill3 pd3 ON pd3.DeliveryPurchaseID2=pd2.DeliveryPurchaseID2
	INNER JOIN ColorMaster clr ON pd3.ColorID=clr.ColorID
	INNER JOIN ProductMaster pm on pd1.ProductID = pm.ProductID
	WHERE 
	pd1.SupplierBillNo='''+CAST(@SupplierBillNo AS VARCHAR)+'''AND pd2.DeliveryPurchaseID1='+cast(@DeliveryPurchaseID as VARCHAR)+' group by	pd1.ProductID,pm.ProductName,clr.ColorID,clr.ColorName,pd1.ModelNo,pm.Rate,pd3.Total)a UNPIVOT
	(
	QTY
	FOR SIZE IN ('+@queryunpivot+')
	) unpvt'
	
	SET @query2=REPLACE(@query2,',FROM',' FROM');
	
	--PRINT @queryunpivot;
	
	IF @i = 1
	PRINT @query2;

	--PRINT @query2;

	INSERT INTO #PurchaseInvoice_Color_Size
	(ColorID 
	,Color	
	,ProductID 
	,ProductName
	,QTY 
	,Size 
	,ModelNo
	,Rate)
	EXEC (@query2);

FETCH NEXT FROM OUTER_CURSOR INTO @SizeType_ID,  @DeliveryPurchaseID, @ModelNo
END
CLOSE OUTER_CURSOR
DEALLOCATE OUTER_CURSOR

SELECT 
--ID ,
ColorID 
,Color	
,ProductID 
,ProductName
,ModelNo
,QTY 
,Size 
,Rate
,ID AS BarcodeNo 
FROM #PurchaseInvoice_Color_Size
WHERE QTY > 0

--EXEC sp_executesql @query2;

	COMMIT
	END TRY
	
	BEGIN CATCH
	ROLLBACK
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
	,ISNULL(ERROR_PROCEDURE(),'Get_PurchaseInvoice_BulkPrint_Color_Size')
	,@PARAMERES
	END CATCH

END