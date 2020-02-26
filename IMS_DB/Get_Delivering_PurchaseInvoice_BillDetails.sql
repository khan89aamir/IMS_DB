-- =============================================
-- Author:		<AAMIR KHAN>
-- Create date: <26th FEB 2020>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Get_Delivering_PurchaseInvoice_BillDetails]
@Supplier_BillNo varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT pid.PurchaseInvoiceDetailsID, pid.PurchaseInvoiceID, pid.SupplierBillNo,
	pid.ProductID, pid.ModelNo, pid.BrandID, pid.SupplierID, pid.QTY, pid.Rate, 
	pid.BillDate, pid.Sales_Price, ISNULL(cat.CategoryID,0)CategoryID,pm.ProductName,
	bm.BrandName,sm.SupplierName,sm.CountryID,cm.CountryName
	FROM [dbo].[PurchaseInvoiceDetails] pid
	INNER JOIN [dbo].[ProductMaster] pm ON pid.ProductID = pm.ProductID
	LEFT JOIN [dbo].[CategoryMaster] cat ON pm.CategoryID = cat.CategoryID
	INNER JOIN [dbo].[BrandMaster] bm ON pid.BrandID = bm.BrandID
	INNER JOIN [dbo].[SupplierMaster] sm ON pid.SupplierID = sm.SupplierID
	INNER JOIN [dbo].[CountryMaster] cm ON sm.CountryID = cm.CountryID
	WHERE pid.SupplierBillNo = @Supplier_BillNo

END