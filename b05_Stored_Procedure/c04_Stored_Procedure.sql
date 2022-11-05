ALTER PROC SP_SATISLAR
@BASTARIH DATE,
@BITTARIH DATE,
@SEHIR AS VARCHAR(50) = '%'
AS
BEGIN
	SELECT 
	u.USERNAME_ KullaniciAdi, u.NAMESURNAME AdSoyad, u.TELNR1 , u.TELNR2,
	c.COUNTRY Ulke, ct.CITY Sehir,
	t.TOWN Ilce, a.ADDRESSTEXT AcikAdres, o.ID SiparisId, 
	itm.ITEMCODE UrunCodu, itm.ITEMNAME UrunAdi, itm.BRAND Marka,
	itm.CATEGORY1, itm.CATEGORY2, itm.CATEGORY3, itm.CATEGORY4,
	od.AMOUNT Miktar,
	od.UNITPRICE BirimFiyat, od.LINETOTAL SatirToplami,
	convert(date, o.DATE_) as siparistarih, CONVERT(time,o.DATE_) as sipariszamani, 
	DATEPART(year,o.DATE_) as yil, dbo.monthname_(o.date_) as ay,
	DBO.DAYOFWEEK_(o.date_) as gun
	FROM 
	ORDERDETAILS od
	inner join ORDERS o on od.ORDERID = o.ID
	inner join ITEMS itm on itm.ID = od.ITEMID
	inner join USERS u on u.ID = o.USERID
	inner join ADDRESS a on a.ID = o.ADDRESSID
	inner join COUNTRIES c on c.ID = a.COUNTRYID
	inner join CITIES ct on ct.ID = a.CITYID
	inner join TOWNS t on t.ID = a.TOWNID
	inner join PAYMENTS p on p.ORDERID = o.ID
	where o.date_ BETWEEN @BASTARIH AND @BITTARIH AND
	CT.CITY LIKE @SEHIR
END

----------------------------------------------------------------------
----------------------------------------------------------------------
----------------------------------------------------------------------
EXEC SP_SATISLAR '20190101' , '20190131' , 'ANKARA'



