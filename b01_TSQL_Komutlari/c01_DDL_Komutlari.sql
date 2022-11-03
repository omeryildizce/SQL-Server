-- test veritaban�n� olu�turma
create database test

-- silmek i�in 
drop database test 

-- test veritaban�n� olu�turma
create database test

-- Tablo olu�turma
create table isimler (id int identity(1,1), isim varchar(20))
use test
select * from isimler

-- veri giri�i
insert into isimler(isim) values ('�mer') 
select * from isimler

-- Tablo silme
drop table isimler

-- Tablo olu�turma
create table isimler (id int identity(1,1), isim varchar(20))
use test
select * from isimler

-- veri giri�i
insert into isimler(isim) values ('�mer') 
select * from isimler


-- Tablo s�tun g�ncelleme
alter table isimler add telefon varchar(12)
select * from isimler

-- veri giri�i
insert into isimler(isim, telefon) values ('Ali', '90500400300') 
select * from isimler

-- Tablo s�tun g�ncelleme
alter table isimler add adres varchar(100)
select * from isimler

-- s�tun silme
alter table isimler drop column adres 
select * from isimler

-- s�tun g�ncelleme
alter table isimler alter column isim varchar(15)
select * from isimler
