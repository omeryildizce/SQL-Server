CREATE VIEW VW_AYLARA_GORE_SATISLAR
AS
 select 
 datepart(year, o.DATE_) yil,  
 case
	when datepart(MONTH,o.date_) = 1 then 'ocak'
	when datepart(MONTH,o.date_) = 2 then '�ubat'
	when datepart(MONTH,o.date_) = 3 then 'mart'
	when datepart(MONTH,o.date_) = 4 then 'nisan'
	when datepart(MONTH,o.date_) = 5 then 'may�s'
	when datepart(MONTH,o.date_) = 6 then 'haziran'
	when datepart(MONTH,o.date_) = 7 then 'temmuz'
	when datepart(MONTH,o.date_) = 8 then 'a�ustos'
	when datepart(MONTH,o.date_) = 9 then 'eyl�l'
	when datepart(MONTH,o.date_) = 10 then 'ekim'
	when datepart(MONTH,o.date_) = 11 then 'kas�m'
	when datepart(MONTH,o.date_) = 12 then 'aral�k'
 end ay,
 sum(amount) toplammiktar,
 sum(LINETOTAL) Toplamtutar, count(od.ID) urunsayisi, count(distinct o.ID) as musterisayisi
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

 group by DATEPART(YEAR, o.date_), DATEPART(MONTH,o.date_) 

 -- 
 select * from VW_AYLARA_GORE_SATISLAR

 --
 alter VIEW VW_AYLARA_GORE_SATISLAR
AS
 select 
 datepart(year, o.DATE_) yil,  
 case
	when datepart(MONTH,o.date_) = 1 then '01-ocak'
	when datepart(MONTH,o.date_) = 2 then '02-�ubat'
	when datepart(MONTH,o.date_) = 3 then '03-mart'
	when datepart(MONTH,o.date_) = 4 then '04-nisan'
	when datepart(MONTH,o.date_) = 5 then '05-may�s'
	when datepart(MONTH,o.date_) = 6 then '06-haziran'
	when datepart(MONTH,o.date_) = 7 then '07-temmuz'
	when datepart(MONTH,o.date_) = 8 then '08-a�ustos'
	when datepart(MONTH,o.date_) = 9 then '09-eyl�l'
	when datepart(MONTH,o.date_) = 10 then '10-ekim'
	when datepart(MONTH,o.date_) = 11 then '11-kas�m'
	when datepart(MONTH,o.date_) = 12 then '12-aral�k'
 end ay,
 sum(amount) toplammiktar,
 sum(LINETOTAL) Toplamtutar, count(od.ID) urunsayisi, count(distinct o.ID) as musterisayisi
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

 group by DATEPART(YEAR, o.date_), DATEPART(MONTH,o.date_) 
