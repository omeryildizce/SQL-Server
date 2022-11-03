declare @isim  as varchar(100)
select @isim 

--
declare @isim  as varchar(100) = 'Ömer'
select @isim 

--
declare @isim  as varchar(100) 
set @isim  = 'Ömer'
select @isim 

-- 
declare @sayi as integer
set @sayi = 15
select @sayi

-- 
declare @sayi as integer
set @sayi = 15
declare @sayi2 as integer 
set @sayi2 = 20
select @sayi as Sayi1, @sayi2 as Sayi2
select @sayi as Sayi1, @sayi2 as Sayi2, @sayi+@sayi2 as Toplam, @sayi*@sayi2 as Carpim

--
declare @sayi as integer
set @sayi = 15
declare @sayi2 as integer 
set @sayi2 = 20
declare @toplam as integer
set @toplam = @sayi + @sayi2
declare @carpim as integer
set @carpim = @sayi * @sayi2
select @sayi as Sayi1, @sayi2 as Sayi2, @toplam as Toplam, @carpim as Carpim


-- 
declare 
@sayi1 as integer,
@sayi2 as integer,
@toplam as integer

set @sayi1 = 17
set @sayi2 = 14
set @toplam = @sayi1 + @sayi2
select @sayi1 as Sayi1, @sayi2 as Sayi2, @toplam as Toplam

--
use test
select * from isimler
update isimler
set telefon = '12345678'
where id = 1
select * from isimler
-- 

declare @isim as varchar(100)
declare @telefon as varchar(100)

select @isim = isim, @telefon = telefon
from isimler where id = 1

select @isim, @telefon


-- 
declare @tarih as datetime
set @tarih = GETDATE()
select @tarih

