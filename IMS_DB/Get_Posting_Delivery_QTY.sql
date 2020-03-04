-- =============================================
-- Author:		<AAMIR>
-- Create date: <03 MARCH 2020>
-- Description:	<Description,,>
-- =============================================
--EXEC Get_Posting_Delivery_QTY 1
CREATE PROCEDURE [dbo].[Get_Posting_Delivery_QTY]
@PurchaseInvoiceID INT = 0

AS
BEGIN
--DECLARE @SupplierID INT=0

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--SELECT @SupplierID=SupplierID FROM PurchaseInvoice WITH(NOLOCK)
	--WHERE PurchaseInvoiceID= @PurchaseInvoiceID

	SELECT pd1.ProductID,pd1.StoreID,SUM(pd3.Total) Total
	FROM DeliveryPurchaseBill1 pd1
	INNER JOIN DeliveryPurchaseBill2 pd2 ON pd2.DeliveryPurchaseID1=pd1.DeliveryPurchaseID1
	INNER JOIN DeliveryPurchaseBill3 pd3 ON pd2.DeliveryPurchaseID2=pd3.DeliveryPurchaseID2
	INNER JOIN ColorMaster clr ON pd3.ColorID=clr.ColorID
	WHERE 
	pd1.PurchaseInvoiceID = @PurchaseInvoiceID
	GROUP BY pd1.ProductID,pd1.StoreID


--SELECT pd1.PurchaseInvoiceID,pd1.DeliveryPurchaseID1,pd1.SupplierBillNo, pd1.SizeTypeID, pd1.ModelNo
--,pd2.DeliveryPurchaseID2, clr.ColorName
--,pd3.DeliveryPurchaseID2,pd3.Total
--FROM DeliveryPurchaseBill1 pd1
--INNER JOIN DeliveryPurchaseBill2 pd2 ON pd2.DeliveryPurchaseID1=pd1.DeliveryPurchaseID1
--INNER JOIN DeliveryPurchaseBill3 pd3 ON pd2.DeliveryPurchaseID2=pd3.DeliveryPurchaseID2
--INNER JOIN ColorMaster clr ON pd3.ColorID=clr.ColorID
--WHERE 
--pd1.PurchaseInvoiceID = @PurchaseInvoiceID

END