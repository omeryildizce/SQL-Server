use crm2
select * from customers
where BIRTHDATE  = '1996-03-09' and namesurname = 'Ada S�z�er'

select count(*) from customers
where BIRTHDATE = '1996-03-09'

select count(*) from customers
where namesurname = 'Ada S�z�er'

-- istatistik g�ncelleme
sp_updatestats 
-- bir tablonun istatistiklerini g�ncelleme
update statistics customrs

