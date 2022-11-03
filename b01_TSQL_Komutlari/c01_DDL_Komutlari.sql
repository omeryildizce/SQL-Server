-- test veritabanýný oluþturma
create database test

-- silmek için 
drop database test 

-- test veritabanýný oluþturma
create database test

-- Tablo oluþturma
create table isimler (id int identity(1,1), isim varchar(20))
use test
select * from isimler

-- veri giriþi
insert into isimler(isim) values ('Ömer') 
select * from isimler

-- Tablo silme
drop table isimler

-- Tablo oluþturma
create table isimler (id int identity(1,1), isim varchar(20))
use test
select * from isimler

-- veri giriþi
insert into isimler(isim) values ('Ömer') 
select * from isimler


-- Tablo sütun güncelleme
alter table isimler add telefon varchar(12)
select * from isimler

-- veri giriþi
insert into isimler(isim, telefon) values ('Ali', '90500400300') 
select * from isimler

-- Tablo sütun güncelleme
alter table isimler add adres varchar(100)
select * from isimler

-- sütun silme
alter table isimler drop column adres 
select * from isimler

-- sütun güncelleme
alter table isimler alter column isim varchar(15)
select * from isimler
