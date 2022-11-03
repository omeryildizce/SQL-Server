use test
drop table isimler, tarihler
-----------------------------
create table isimler 
(
	id int identity(1,1) primary key,
	ad varchar(50),
	cinsiyet varchar(1)
)
select * from isimler

--------------------------
create table soyisimler
(
	id int identity(1,1) primary key,
	soyisim varchar(50)
)
select * from soyisimler

-----------------------------------------------------------------
-- isimler.xlsx belgesindeki veriler tablolara kayýt edildi. ----
-----------------------------------------------------------------

create table kisiler
(
	id int identity(1,1) primary key,
	ad varchar(50),
	soyad varchar(50),
	cinsiyet varchar(1),
	dogumtarihi date,
	yas int,
	yasgrubu varchar(30)

)
select * from kisiler
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------- Rastgele kisiler tablosonun doldurulmasý -----
truncate table kisiler
declare @ad as varchar(50)
declare @cinsiyet as varchar(1)
declare @soyad as varchar(50)
declare @dogumtarihi as date
declare @yas as int
declare @yasgrubu as varchar(30)
declare @i as int = 0

while @i < 1000
begin
	select @ad = ad, @cinsiyet = cinsiyet from isimler where id = ROUND(RAND() * 611, 0)
	select @soyad = soyisim from soyisimler where id = ROUND(RAND() * 1000, 0)
	set @dogumtarihi = DATEADD(DAY, ROUND(RAND() * 22000, 0), '1950-01-01')
	set @yas = DATEDIFF(YEAR, @dogumtarihi, GETDATE())

	if @yas between 10 and 20 
		set @yasgrubu = '20 yaþ altý'
	if @yas between 21 and 30 
		set @yasgrubu = '21 - 30 arasý'
	if @yas between 31 and 40 
		set @yasgrubu = '31 - 40 arasý'
	if @yas between 41 and 50 
		set @yasgrubu = '41 - 50 arasý'
	if @yas between 51 and 60 
		set @yasgrubu = '51 - 60 arasý'
	if @yas > 60
		set @yasgrubu = '60 yaþ üstü'
	
	insert into kisiler(ad,soyad,cinsiyet,dogumtarihi, yas,yasgrubu) 
	values (@ad, @soyad, @cinsiyet, @dogumtarihi, @yas, @yasgrubu)
	set @i = @i + 1	
end
select * from kisiler

