-- =============================================
-- Author:		<AAMIR KHAN>
-- Create date: <20th FEB 2020>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Get_CurrencyRate]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT CR.CurrencyRateID, CR.CountryID,C.CountryCode,C.CountryName, CR.CurrencyRate,
	CR.CurrencyCode, CR.CurrencyName
	FROM
	[dbo].[CurrencyRateSetting] CR
	INNER JOIN [dbo].[CountryMaster] C ON CR.CountryID=C.CountryID

END

GO