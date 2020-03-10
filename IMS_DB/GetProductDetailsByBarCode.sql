
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[GetProductDetailsByBarCode]
	-- Add the parameters for the stored procedure here
	@StoreID as int, @BarCode as int
AS
BEGIN
	
	SET NOCOUNT ON;

select p1.ProductID, p1.ProductName,p1.Rate,p2.QTY,p2.ColorID,c1.ColorName,s1.SizeID, s1.Size,p2.BarcodeNo
			from dbo.ProductMaster p1 join 
			dbo.ProductStockColorSizeMaster p2 on p1.ProductID = p2.ProductID
			 join ColorMaster c1 on p2.colorID=c1.ColorID 
			 join SizeMaster s1 on p2.Size=s1.SizeID
             where p2.StoreID = @StoreID and p2.BarcodeNo =@BarCode;


END