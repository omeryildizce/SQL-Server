use crm2
select * from customers
where BIRTHDATE  = '1996-03-09' and namesurname = 'Ada Sözüer'

select count(*) from customers
where BIRTHDATE = '1996-03-09'

select count(*) from customers
where namesurname = 'Ada Sözüer'

-- istatistik güncelleme
sp_updatestats 
-- bir tablonun istatistiklerini güncelleme
update statistics customrs

