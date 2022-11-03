-- Substring
declare @kelime as varchar(100)
set @kelime = 'Merhaba Dünya'
select SUBSTRING(@kelime, 1, 7)

-- 
declare @kelime as varchar(100)
set @kelime = 'Merhaba Dünya'
select SUBSTRING(@kelime,9,5)

-- Lower, Upper
declare @kelime as varchar(100)
set @kelime = 'Merhaba Dünya'
select Lower(@kelime), UPPER(@kelime)

-- String Birleþtirme
Declare @ad as varchar(100) = 'Ömer'
declare @soyad as varchar(100) = 'Yýldýz'
select @ad + @soyad
select @ad + ' ' + @soyad

--Right , Left
declare @kelime as varchar(100)
set @kelime = 'Merhaba Dünya'
select left(@kelime, 7) ,right(@kelime , 5)

--Right , Left
declare @kelime as varchar(100)
set @kelime = '   Merhaba    Dünya     '
select ltrim(@kelime) ,rtrim(@kelime), TRIM(@kelime)
--Merhaba    Dünya     --
--   Merhaba    Dünya--
--Merhaba    Dünya--

--Replace
declare @kelime as varchar(100)
set @kelime = 'Merhaba Dünya'
select REPLACE(@kelime, 'ü', 'u')
select REPLACE( REPLACE(@kelime, 'Merhaba', 'Hello'), 'Dünya','World')

--Len
declare @kelime as varchar(100)
set @kelime = 'Merhaba Dünya'
select len(@kelime) 

-- string split
declare @kelime as varchar(100)
set @kelime = 'Merhaba Dünya'
select * from string_split(@kelime, ' ')

-- 
declare @kelime as varchar(100)
set @kelime =  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'
select * from string_split(@kelime, ' ')
