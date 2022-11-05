use ETRADE
create function dbo.TOPLA(@sayi1 as int, @sayi2 as int)
returns int
as 
begin
	declare @sonuc as int
	set @sonuc = @sayi1 + @sayi2
	return @sonuc
end


--------------------
select dbo.TOPLA(10,15)
select dbo.TOPLA(110,215)


-------------
use CRM2
create function dbo.CALCULATE_AGE(@BIRTHDATE AS DATE)
returns int
begin
	declare @RESULT as int
	set @RESULT = DATEDIFF(YEAR, @BIRTHDATE, GETDATE())
	return @RESULT
end

-----------------------
SELECT DBO.CALCULATE_AGE('19901010')


------------
SELECT TOP 1000
*, DBO.CALCULATE_AGE(BIRTHDATE) AGE
FROM CUSTOMERS