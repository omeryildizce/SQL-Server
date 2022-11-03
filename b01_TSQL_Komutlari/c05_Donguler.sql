declare @i as int = 0
while @i < 10
begin
print @i
select @i
set @i = @i +1
end

--
use test
create table tarihler(
id int identity(1,1),
tarih datetime2(7)
)
select * from tarihler

---------
declare @i as int = 0
while @i < 10
begin
insert into tarihler(tarih) values (getdate())
set @i = @i +1
end
select * from tarihler

-----------------------------
truncate table tarihler
declare @i as int = 0
while @i < 10
begin
	insert into tarihler(tarih) values (getdate())
	waitfor delay '00:00:01'
	set @i = @i +1
end
select * from tarihler
