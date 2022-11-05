create View VW_SIPARIS_DETAYI
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
case
	when datepart(MONTH,o.date_) = 1 then 'ocak'
	when datepart(MONTH,o.date_) = 2 then 'þubat'
	when datepart(MONTH,o.date_) = 3 then 'mart'
	when datepart(MONTH,o.date_) = 4 then 'nisan'
	when datepart(MONTH,o.date_) = 5 then 'mayýs'
	when datepart(MONTH,o.date_) = 6 then 'haziran'
	when datepart(MONTH,o.date_) = 7 then 'temmuz'
	when datepart(MONTH,o.date_) = 8 then 'aðustos'
	when datepart(MONTH,o.date_) = 9 then 'eylül'
	when datepart(MONTH,o.date_) = 10 then 'ekim'
	when datepart(MONTH,o.date_) = 11 then 'kasým'
	when datepart(MONTH,o.date_) = 12 then 'aralýk'
end ay,  
case
	when datepart(DW,o.date_) = 1 then '7.PAZ'
	when datepart(DW,o.date_) = 2 then '1.PZT'
	when datepart(DW,o.date_) = 3 then '2.SAL'
	when datepart(DW,o.date_) = 4 then '3.CAR'
	when datepart(DW,o.date_) = 5 then '4.PER'
	when datepart(DW,o.date_) = 6 then '5.CUM'
	when datepart(DW,o.date_) = 7 then '6.CMT'
end gun
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


-- 
select CATEGORY1,sum(SatirToplami) as toplamtutar 
from VW_SIPARIS_DETAYI
group by CATEGORY1
order by sum(SatirToplami) desc
-----
select top 10
CATEGORY1,sum(SatirToplami) as toplamtutar 
from VW_SIPARIS_DETAYI
group by CATEGORY1
order by sum(SatirToplami) desc

------------------
create view VW_TOP10_KATEGORÝ
AS
select top 10
CATEGORY1,sum(SatirToplami) as toplamtutar 
from VW_SIPARIS_DETAYI
group by CATEGORY1
order by sum(SatirToplami) desc

------
select * from VW_TOP10_KATEGORÝ

---------------------------------------
create view VW_MAGAZA_ANALIZI
AS
select Sehir, sum(SatirToplami) toplamtutar
from VW_SIPARIS_DETAYI
group by Sehir
----------------
select * from VW_MAGAZA_ANALIZI
 
---------------------------------------
create view VW_TOP_1000_MUSTERI_LISTESÝ
AS
select top 1000
KullaniciAdi,AdSoyad,Sehir, Ilce,AcikAdres,TELNR1,TELNR2, sum(SatirToplami) toplamtutar
from VW_SIPARIS_DETAYI
group by  KullaniciAdi,AdSoyad,Sehir, Ilce,AcikAdres,TELNR1,TELNR2
order by sum(SatirToplami) desc
----------------
select * from VW_TOP_1000_MUSTERI_LISTESÝ
 