-- =============================================
-- Author:		<AAMIR KHAN>
-- Create date: <29th FEB 2020>
-- Description:	<Description,,>
-- =============================================
-- EXEC [dbo].[Get_PurchaseInvoice_Color_Size] 'purinv11',2
CREATE PROCEDURE [dbo].[Get_PurchaseInvoice_Color_Size]
@SupplierBillNo NVARCHAR(MAX) =''
,@SizeType_ID INT=0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

DECLARE @SizeValue AS VARCHAR(50)
DECLARE @i AS INT=1
DECLARE @DeliveryPurchaseID AS INT=0
DECLARE @query1  AS NVARCHAR(MAX)=''
DECLARE @query2  AS NVARCHAR(MAX)

DECLARE cursor_Size CURSOR
FOR
SELECT Size from SizeMaster where SizeTypeID=@SizeType_ID;

SELECT @DeliveryPurchaseID=DeliveryPurchaseID1 
FROM DeliveryPurchaseBill1 WHERE SizeTypeID=@SizeType_ID AND SupplierBillNo=''+@SupplierBillNo+''

OPEN cursor_Size;

FETCH NEXT FROM cursor_Size INTO @SizeValue

	WHILE @@FETCH_STATUS = 0
	    BEGIN

		SET @query1 += N'MAX(CASE WHEN pd2.Col'+CAST(@i as VARCHAR)+' = pd2.Col'+cast(@i as VARCHAR)+
		' THEN pd3.Col'+CAST(@i as VARCHAR)+' END) '+QUOTENAME(@SizeValue)+',';
		SET @i+=1;
	        FETCH NEXT FROM cursor_Size INTO @SizeValue;

	    END;

CLOSE cursor_Size;
 
DEALLOCATE cursor_Size;

SET @query2='SELECT '+@query1+'FROM DeliveryPurchaseBill1 pd1
INNER JOIN DeliveryPurchaseBill2 pd2 ON pd2.DeliveryPurchaseID1=pd1.DeliveryPurchaseID1
INNER JOIN DeliveryPurchaseBill3 pd3 ON pd3.DeliveryPurchaseID2=pd2.DeliveryPurchaseID2
WHERE 
pd1.SizeTypeID='+cast(@SizeType_ID AS VARCHAR)+' AND pd1.SupplierBillNo='''+CAST(@SupplierBillNo AS VARCHAR)+''''
--'pd2.DeliveryPurchaseID2='+cast(@DeliveryPurchaseID as VARCHAR)

SET @query2=REPLACE(@query2,',FROM',' FROM');

IF @i = 1
PRINT @query2;

EXEC sp_executesql @query2;

END