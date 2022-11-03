-- crm.bak  
use CRM
select count(*) from CUSTOMERS

select * from CUSTOMERS
where NAMESURNAME like 'ömer çolakoðlu'

------
set statistics io on 
select * from CUSTOMERS
where NAMESURNAME like 'ömer çolakoðlu'


--- Tablo boyutu
sp_spaceused 'customers'

----
set statistics io on 
select * from CUSTOMERS
where NAMESURNAME = 'ömer çolakoðlu'

----- index
USE [CRM]
GO

SET ANSI_PADDING ON
GO

/****** Object:  Index [IX1]    Script Date: 3.11.2022 16:17:22 ******/
CREATE NONCLUSTERED INDEX [IX1] ON [dbo].[CUSTOMERS]
(
	[NAMESURNAME] ASC,
	[ID] ASC,
	[GENDER] ASC,
	[BIRTHDATE] ASC,
	[CITY] ASC,
	[TOWN] ASC,
	[TELNR] ASC,
	[NAME_] ASC,
	[SURNAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO


