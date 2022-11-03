use ETRADE
select count(*) as ADDRESS		from ADDRESS		
select count(*) as  COUNTRIES	from COUNTRIES		
select count(*) as CITIES		from CITIES			
select count(*) as DISTRICTS	from DISTRICTS		
select count(*) as INVOICEDETAILS from INVOICEDETAILS	
select count(*) as INVOICES		from INVOICES		
select count(*) as ITEMS		from ITEMS			
select count(*) as ORDERDETAILS from ORDERDETAILS	
select count(*) as ORDERS		from ORDERS			
select count(*) as PAYMENTS		from PAYMENTS		
select count(*) as TOWNS		from TOWNS			
select count(*) as USERS		from USERS

 -----------------------------------------------------
 select 
 u.USERNAME_ KullaniciAdi, u.NAMESURNAME AdSoyad, c.COUNTRY Ulke, ct.CITY Sehir,
 t.TOWN Ilce, a.ADDRESSTEXT AcikAdres, o.ID SiparisId, o.DATE_ SiparisTarihi,
 itm.ITEMCODE UrunCodu, itm.ITEMNAME UrunAdi, itm.BRAND Marka, od.AMOUNT Miktar,
 od.UNITPRICE BirimFiyat, od.LINETOTAL SatirToplami
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

 --------------------------------------------
 ------- View ---------------------
 create view VWORDERS
 as
 select 
 u.USERNAME_ KullaniciAdi, u.NAMESURNAME AdSoyad, c.COUNTRY Ulke, ct.CITY Sehir,
 t.TOWN Ilce, a.ADDRESSTEXT AcikAdres, o.ID SiparisId, o.DATE_ SiparisTarihi,
 itm.ITEMCODE UrunCodu, itm.ITEMNAME UrunAdi, itm.BRAND Marka, od.AMOUNT Miktar,
 od.UNITPRICE BirimFiyat, od.LINETOTAL SatirToplami
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



 ---------
 select * from VWORDERS
 ---------
 select * from VWORDERS
where KullaniciAdi = 'Z_dalamanlý'

--------
 select * from VWORDERS
where Sehir = 'Ankara'

-------------------
select sehir, sum(SatirToplami), count(*) from VWORDERS
group by Sehir
