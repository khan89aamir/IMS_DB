-- =============================================
-- Author:		<AAMIR KHAN>
-- Create date: <08th MARCH 2020>
-- Modify date: <10th MARCH 2020>
-- Description:	<Description,,>
-- =============================================
--EXEC Get_PurchaseInvoice_Popup 'pur' ,0
--EXEC Get_PurchaseInvoice_Popup 'pur'	OLD
CREATE PROCEDURE [dbo].[Get_PurchaseInvoice_Popup]
@SupplierBillNo VARCHAR(50)=''
,@status INT=0
AS
BEGIN

	/*
	@status=0 Means display only unposted purchase invoice
	@status=1 Means display only posted purchase invoice
	*/
	-- SET NOCOUNT ON added to prevent extra result sets from

	SET NOCOUNT ON;
	BEGIN TRY
	DECLARE @PARAMERES VARCHAR(MAX)=''
	SET @PARAMERES=CONCAT(@SupplierBillNo,',',@status)

	SELECT p.PurchaseInvoiceID, p.SupplierBillNo,p.SupplierID,s.SupplierName
	FROM .[dbo].[PurchaseInvoice] p
	INNER JOIN .[dbo].[SupplierMaster] s on p.SupplierID = s.SupplierID
	WHERE ISNULL(p.IsInvoiceDone,0) = @status
	AND p.SupplierBillNo like ''+@SupplierBillNo+'%'+''
	
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