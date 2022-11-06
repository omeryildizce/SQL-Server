use BANKA
SELECT * FROM MONEYTRANSACTIONS
INSERT INTO MONEYTRANSACTIONS (ACCOUNTID,TRANTYPE, AMOUNT, DATE_, CURENCY, EFTCODE1, EFTCODE2)
VALUES (1,2,1000, '2020-04-14 14:21:36','TL','12345678','')
UPDATE ACCOUNTBALANCE SET BALANCE = BALANCE -1000 WHERE ACCOUNTID = 1 
INSERT INTO MONEYTRANSACTIONS (ACCOUNTID,TRANTYPE, AMOUNT, DATE_, CURENCY, EFTCODE1, EFTCODE2)
VALUES (2,1,1000, '2020-04-14 15:21:36','TL','12345678','098754321')
UPDATE ACCOUNTBALANCE SET BALANCE = BALANCE + 1000 WHERE ACCOUNTID = 2 
SELECT * FROM MONEYTRANSACTIONS


SELECT C.CUSTOMERNAME, A.ACCOUNTNO, A.ACCOUNTNAME, A.CURENCY, B.BALANCE FROM ACCOUNTBALANCE B
INNER JOIN ACCOUNTS A ON A.ID = B.ACCOUNTID
INNER JOIN CUSTOMERS C ON C.ID = A.CUSTOMERID

--------------------------------------------------------
TRUNCATE TABLE MONEYTRANSACTIONS
UPDATE ACCOUNTBALANCE SET BALANCE = 1000 WHERE ACCOUNTID = 1 
UPDATE ACCOUNTBALANCE SET BALANCE = 0 WHERE ACCOUNTID = 2


SELECT C.CUSTOMERNAME, A.ACCOUNTNO, A.ACCOUNTNAME, A.CURENCY, B.BALANCE FROM ACCOUNTBALANCE B
INNER JOIN ACCOUNTS A ON A.ID = B.ACCOUNTID
INNER JOIN CUSTOMERS C ON C.ID = A.CUSTOMERID

BEGIN TRANSACTION
	INSERT INTO MONEYTRANSACTIONS (ACCOUNTID,TRANTYPE, AMOUNT, DATE_, CURENCY, EFTCODE1, EFTCODE2)
	VALUES (1,2,1000, '2020-04-14 14:21:36','TL','12345678','')
	IF @@ERROR>0
	BEGIN
		ROLLBACK TRAN
		RETURN
	END
	UPDATE ACCOUNTBALANCE SET BALANCE = BALANCE -1000 WHERE ACCOUNTID = 1 
	IF @@ERROR>0
	BEGIN
		ROLLBACK TRAN
		RETURN
	END
	INSERT INTO MONEYTRANSACTIONS (ACCOUNTID,TRANTYPE, AMOUNT, DATE_, CURENCY, EFTCODE1, EFTCODE2)
	VALUES (2,1,1000, '2020-04-14 15:21:36','TL','12345678','ASADSAD098754321')
	IF @@ERROR>0
	BEGIN
		ROLLBACK TRAN
		RETURN
	END
	UPDATE ACCOUNTBALANCE SET BALANCE = BALANCE + 1000 WHERE ACCOUNTID = 2 
	IF @@ERROR>0
	BEGIN
		ROLLBACK TRAN
		RETURN
	END
COMMIT TRAN

SELECT * FROM MONEYTRANSACTIONS