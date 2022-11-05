CREATE FUNCTION DBO.MONTHNAME_(@DATE AS DATETIME)
RETURNS VARCHAR(10)
AS
BEGIN
	DECLARE @RESULT AS VARCHAR(10)
	IF DATEPART(MONTH, @DATE) = 1 SET @RESULT = '01.OCA'
	IF DATEPART(MONTH, @DATE) = 2 SET @RESULT = '02.SUB'
	IF DATEPART(MONTH, @DATE) = 3 SET @RESULT = '03.MAR'
	IF DATEPART(MONTH, @DATE) = 4 SET @RESULT = '04.NIS'
	IF DATEPART(MONTH, @DATE) = 5 SET @RESULT = '05.MAY'
	IF DATEPART(MONTH, @DATE) = 6 SET @RESULT = '06.HAZ'
	IF DATEPART(MONTH, @DATE) = 7 SET @RESULT = '07.TEM'
	IF DATEPART(MONTH, @DATE) = 8 SET @RESULT = '08.AUG'
	IF DATEPART(MONTH, @DATE) = 9 SET @RESULT = '09.EYL'
	IF DATEPART(MONTH, @DATE) = 10 SET @RESULT = '10.EKI'
	IF DATEPART(MONTH, @DATE) = 11 SET @RESULT = '11.KAS'
	IF DATEPART(MONTH, @DATE) = 12 SET @RESULT = '12.ARA'
 	RETURN @RESULT
END

---------------------------------------------------------
SELECT DBO.MONTHNAME_('20010907')
 
--------------------------------------------------------
CREATE FUNCTION DBO.DAYOFWEEK_(@DATE AS DATETIME)
RETURNS VARCHAR(10)
AS
BEGIN
	DECLARE @RESULT AS VARCHAR(10)
	IF DATEPART(DW, @DATE) = 1 SET @RESULT = '07.PAZ'
	IF DATEPART(DW, @DATE) = 2 SET @RESULT = '01.PZT'
	IF DATEPART(DW, @DATE) = 3 SET @RESULT = '02.SAL'
	IF DATEPART(DW, @DATE) = 4 SET @RESULT = '03.CAR'
	IF DATEPART(DW, @DATE) = 5 SET @RESULT = '04.PER'
	IF DATEPART(DW, @DATE) = 6 SET @RESULT = '05.CUM'
	IF DATEPART(DW, @DATE) = 7 SET @RESULT = '06.CMT'
 	RETURN @RESULT
END

---------------------------------------------------------
SELECT DBO.DAYOFWEEK_('20010907')
 
--------------------------------------------------------


------------------------------------------------
USE [ETRADE]
GO

/****** Object:  View [dbo].[VW_SIPARIS_DETAYI]    Script Date: 5.11.2022 14:00:02 ******/
create View [dbo].[VW_SIPARIS_DETAYI]
AS
select 
u.USERNAME_ KullaniciAdi, u.NAMESURNAME AdSoyad, u.TELNR1 , u.TELNR2,
c.COUNTRY Ulke, ct.CITY Sehir,
t.TOWN Ilce, a.ADDRESSTEXT AcikAdres, o.ID SiparisId, 
itm.ITEMCODE UrunCodu, itm.ITEMNAME UrunAdi, itm.BRAND Marka,
itm.CATEGORY1, itm.CATEGORY2, itm.CATEGORY3, itm.CATEGORY4,
od.AMOUNT Miktar,
od.UNITPRICE BirimFiyat, od.LINETOTAL SatirToplami,
convert(date, o.DATE_) as tarih, CONVERT(time,o.DATE_) as sipariszamani, 
DATEPART(year,o.DATE_) as yil,  
 DBO.MONTHNAME_(O.DATE_) ay,  DBO.DAYOFWEEK_(O.DATE_) gun
from 
ORDERDETAILS od
inner join ORDERS o on od.ORDERID = o.ID
inner join ITEMS itm on itm.ID = od.ITEMID
inner join USERS u on u.ID = o.USERID
inner join ADDRESS a on a.ID = o.ADDRESSID
inner join COUNTRIES c on c.ID = a.COUNTRYID
inner join CITIES ct on ct.ID = a.CITYID
inner join TOWNS t on t.ID = a.TOWNID
inner join PAYMENTS p on p.ORDERID = o.ID
GO


