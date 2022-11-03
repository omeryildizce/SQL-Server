-- dateadd
declare @tarih as datetime 
set @tarih = '2019-01-01 19:01:01'
select @tarih

--
declare @tarih as datetime 
set @tarih = '2019-01-01 19:01:01'
declare @tarih2 as datetime
set @tarih2 = DATEADD(MONTH, 6 , @tarih)
select @tarih, @tarih2

--
declare @tarih as datetime 
set @tarih = '2019-01-01 19:01:01'
declare @tarih2 as datetime
set @tarih2 = DATEADD(DAY, 6 , @tarih)
select @tarih, @tarih2

--
declare @tarih as datetime 
set @tarih = '2019-01-01 19:01:01'
declare @tarih2 as datetime
set @tarih2 = DATEADD(HOUR, 6 , @tarih)
select @tarih, @tarih2

-- datediff
SELECT DATEDIFF(year,        '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF(quarter,     '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF(month,       '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF(dayofyear,   '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF(day,         '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF(week,        '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF(hour,        '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF(minute,      '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF(second,      '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF(millisecond, '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');
SELECT DATEDIFF(microsecond, '2005-12-31 23:59:59.9999999', '2006-01-01 00:00:00.0000000');

-- datefromparts
select DATEFROMPARTS(2020,11,3)

-- datepart 
declare @tarih as datetime 
set @tarih = '2019-01-01 19:01:01' 
select datepart (month, @tarih)
select datepart (year, @tarih)
select datepart (day, @tarih)
select datepart (DW, @tarih)
select datepart (WEEK, @tarih)
select datepart (HOUR, @tarih)

select year(@tarih)

-- getdate
declare @tarih as datetime 
set @tarih = '1990-12-25' 
select DATEDIFF(year, @tarih, GETDATE())

