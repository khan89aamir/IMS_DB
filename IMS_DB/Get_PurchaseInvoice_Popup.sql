-- =============================================
-- Author:		<AAMIR KHAN>
-- Create date: <08th MARCH 2020>
-- Description:	<Description,,>
-- =============================================
--EXEC Get_PurchaseInvoice_Popup 'pur'
CREATE PROCEDURE [dbo].[Get_PurchaseInvoice_Popup]
@SupplierBillNo VARCHAR(50)=''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
	DECLARE @PARAMERES VARCHAR(MAX)=''
	SET @PARAMERES=@SupplierBillNo

	SELECT p.PurchaseInvoiceID, p.SupplierBillNo,p.SupplierID,s.SupplierName
	FROM .[dbo].[PurchaseInvoice] p
	INNER JOIN .[dbo].[SupplierMaster] s on p.SupplierID = s.SupplierID
	WHERE ISNULL(p.IsInvoiceDone,0) = 0
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