USE [HR]
INSERT INTO WORKERS (WORKERCODE,WORKERNAME,GENDER,BIRTHDATE,TCNO,WORKERBARCODE)
SELECT TOP 1000 
TCNO AS WORKERCODE, NAMESURNAME AS WORKERNAME, GENDER, BIRTHDATE,TCNO,NEWID() AS WORKERBARCODE
FROM CRM2.DBO.CUSTOMERS

SELECT * FROM WORKERS



GO
/****** Object:  StoredProcedure [dbo].[GENERATE_WORKER_TRANSACTION]    Script Date: 13.04.2020 18:35:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROC [dbo].[GENERATE_WORKER_TRANSACTION]
@WORKERID AS INT
AS
BEGIN
DECLARE @I AS INT=0
DECLARE @BEGDATE AS DATETIME='2019-01-01 08:00:00'
DECLARE @IOTYPE AS VARCHAR(1)='G'
DECLARE @DATE AS DATETIME=@BEGDATE
	WHILE @I<365

		BEGIN
			IF DATEPART(DW,@BEGDATE)<>1 AND RAND()>0.2
			BEGIN
			--SABAH G?R?? 
			SET @DATE=DATEADD(MINUTE,CONVERT(INT,RAND()*30),@DATE)
			INSERT INTO HR.DBO.WORKERTRANSACTIONS (WORKERID,DATE_,IOTYPE,GATEID)
			VALUES (@WORKERID,@DATE,'G',ROUND(RAND()*20,0)) 
 
			--?LK MOLA ?IKI? SAAT? SAAT 10:00
			SET @DATE=DATEADD(HOUR,2,@BEGDATE)
			SET @DATE=DATEADD(MINUTE,CONVERT(INT,RAND()*15),@DATE)

			INSERT INTO HR.DBO.WORKERTRANSACTIONS (WORKERID,DATE_,IOTYPE,GATEID)
			VALUES (@WORKERID,@DATE,'C',ROUND(RAND()*20,0)) 

			--?LK MOLADAN GEL??
			SET @DATE=DATEADD(MINUTE,8+CONVERT(INT,RAND()*10),@DATE)
 
			INSERT INTO HR.DBO.WORKERTRANSACTIONS (WORKERID,DATE_,IOTYPE,GATEID)
			VALUES (@WORKERID,@DATE,'G',ROUND(RAND()*20,0))
 
			 --??LE YEME??NE ?IKI? 12:00
			SET @DATE=DATEADD(HOUR,4,@BEGDATE)
			SET @DATE=DATEADD(MINUTE,CONVERT(INT,RAND()*15),@DATE)
			INSERT INTO HR.DBO.WORKERTRANSACTIONS (WORKERID,DATE_,IOTYPE,GATEID)
			VALUES (@WORKERID,@DATE,'C',ROUND(RAND()*20,0))
			--??LE YEME??NDEN GEL??
			SET @DATE=DATEADD(MINUTE,55+CONVERT(INT,RAND()*15),@DATE)
			INSERT INTO HR.DBO.WORKERTRANSACTIONS (WORKERID,DATE_,IOTYPE,GATEID)
			VALUES (@WORKERID,@DATE,'G',ROUND(RAND()*20,0)) 

			 --?K?NC? MOLAYA ?IKI? YEME??NE ?IKI? 15:00
			SET @DATE=DATEADD(HOUR,7,@BEGDATE)
			SET @DATE=DATEADD(MINUTE,CONVERT(INT,RAND()*15),@DATE)
			INSERT INTO HR.DBO.WORKERTRANSACTIONS (WORKERID,DATE_,IOTYPE,GATEID)
			VALUES (@WORKERID,@DATE,'C',ROUND(RAND()*20,0)) 
			--?K?NC? MOLADAN GEL??
			SET @DATE=DATEADD(MINUTE,8+CONVERT(INT,RAND()*10),@DATE)
			INSERT INTO HR.DBO.WORKERTRANSACTIONS (WORKERID,DATE_,IOTYPE,GATEID)
			VALUES (@WORKERID,@DATE,'G',ROUND(RAND()*20,0)) 

			 --MESA? B?T??? 17:00
			SET @DATE=DATEADD(HOUR,9,@BEGDATE)
			SET @DATE=DATEADD(MINUTE,-10+CONVERT(INT,RAND()*20),@DATE)
			INSERT INTO HR.DBO.WORKERTRANSACTIONS (WORKERID,DATE_,IOTYPE,GATEID)
			VALUES (@WORKERID,@DATE,'C',ROUND(RAND()*20,0))
		
		END
		SET @I=@I+1
 
		SET @BEGDATE=DATEADD(DAY,1,@BEGDATE)
 
	
 END

END 

----------------------------
EXEC GENERATE_WORKER_TRANSACTION 1

SELECT * FROM WORKERTRANSACTIONS

---------------------------------------------------
---------------------------------------------------
---------------------------------------------------
DECLARE @I AS INT = 1
WHILE @I <= 1000
BEGIN
	EXEC GENERATE_WORKER_TRANSACTION @I
	SET @I = @I + 1
END

SELECT * FROM WORKERTRANSACTIONS
SELECT COUNT(*) FROM WORKERTRANSACTIONS
SELECT MAX(WORKERID), COUNT(*) FROM WORKERTRANSACTIONS

-----------------------
SET STATISTICS IO ON
SELECT *, 
(SELECT TOP 1 IOTYPE FROM WORKERTRANSACTIONS WHERE WORKERID = W.ID ORDER BY DATE_ DESC) SONHAREKETTURU,
(SELECT MAX(DATE_) FROM WORKERTRANSACTIONS WHERE WORKERID = W.ID) SONHAREKATZAMANI
FROM WORKERS W
WHERE ID = 1

-------------------------
CREATE TABLE WORKER_LAST_TRANSACTIONS
(
	ID INT PRIMARY KEY IDENTITY(1,1),
	WORKERID INT,
	LASTDATE DATETIME,
	LASTIOTYPE 	VARCHAR(1)
)

INSERT INTO WORKER_LAST_TRANSACTIONS
(WORKERID) 
SELECT ID FROM WORKERS

SELECT * FROM WORKER_LAST_TRANSACTIONS

