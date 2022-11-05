CREATE FUNCTION DBO.GET_ITEM_INFO(@ITEMID INT)
RETURNS TABLE
AS
RETURN
(
	SELECT 
		MIN(UNITPRICE) AS MINPRICE,
		MAX(UNITPRICE) AS MAXPRICE,
		AVG(UNITPRICE) AS AVGPRICE,
		SUM(LINETOTAL) AS TOTALSALE,
		SUM(AMOUNT) AS TOTALAMOUNT
	FROM ORDERDETAILS WHERE ITEMID = @ITEMID
)

select *
FROM DBO.GET_ITEM_INFO(5)

SET STATISTICS TIME ON
select 
ITM.ID, ITM.ITEMCODE MALZEMEKODU, ITM.ITEMNAME MALZEMEADI,
ITEMINFO.MINPRICE, ITEMINFO.MAXPRICE, ITEMINFO.AVGPRICE, ITEMINFO.TOTALSALE
from ITEMS ITM 
CROSS APPLY  DBO.GET_ITEM_INFO(ITM.ID) AS ITEMINFO