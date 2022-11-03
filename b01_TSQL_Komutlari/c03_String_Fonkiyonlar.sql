-- Substring
declare @kelime as varchar(100)
set @kelime = 'Merhaba D�nya'
select SUBSTRING(@kelime, 1, 7)

-- 
declare @kelime as varchar(100)
set @kelime = 'Merhaba D�nya'
select SUBSTRING(@kelime,9,5)

-- Lower, Upper
declare @kelime as varchar(100)
set @kelime = 'Merhaba D�nya'
select Lower(@kelime), UPPER(@kelime)

-- String Birle�tirme
Declare @ad as varchar(100) = '�mer'
declare @soyad as varchar(100) = 'Y�ld�z'
select @ad + @soyad
select @ad + ' ' + @soyad

--Right , Left
declare @kelime as varchar(100)
set @kelime = 'Merhaba D�nya'
select left(@kelime, 7) ,right(@kelime , 5)

--Right , Left
declare @kelime as varchar(100)
set @kelime = '   Merhaba    D�nya     '
select ltrim(@kelime) ,rtrim(@kelime), TRIM(@kelime)
--Merhaba    D�nya     --
--   Merhaba    D�nya--
--Merhaba    D�nya--

--Replace
declare @kelime as varchar(100)
set @kelime = 'Merhaba D�nya'
select REPLACE(@kelime, '�', 'u')
select REPLACE( REPLACE(@kelime, 'Merhaba', 'Hello'), 'D�nya','World')

--Len
declare @kelime as varchar(100)
set @kelime = 'Merhaba D�nya'
select len(@kelime) 

-- string split
declare @kelime as varchar(100)
set @kelime = 'Merhaba D�nya'
select * from string_split(@kelime, ' ')

-- 
declare @kelime as varchar(100)
set @kelime =  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'
select * from string_split(@kelime, ' ')
