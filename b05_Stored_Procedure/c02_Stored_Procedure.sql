use hr
SELECT * FROM WORKERS
where WORKERBARCODE = 'B3CEEB5F-9BB9-4D29-B807-B412473C3EAC'

--------------------------------------------------------------------
---------------------  PROCEDURE  ----------------------------------
--------------------------------------------------------------------
CREATE PROCEDURE SP_CARD_CONTROL
@WORKERBARCODE AS VARCHAR(50)
AS
BEGIN
	SELECT * FROM WORKERS WHERE WORKERBARCODE =  @WORKERBARCODE 
	
END

-----------------------
EXEC SP_CARD_CONTROL @WORKERBARCODE = 'B3CEEB5F-9BB9-4D29-B807-B412473C3EAC'


--------------------------------------------------------------------
---------------------  PROCEDURE  ----------------------------------
--------------------------------------------------------------------
ALTER PROCEDURE SP_CARD_CONTROL
@WORKERBARCODE AS VARCHAR(50)
AS
BEGIN
	DECLARE @WORKERNAME AS VARCHAR(100)
	SELECT @WORKERNAME = WORKERNAME FROM WORKERS WHERE WORKERBARCODE = @WORKERBARCODE
	IF @WORKERNAME IS NULL
	BEGIN
		-- SELECT 'KART GE�ERS�Z'
		RAISERROR('KART GE�ERS�Z',16,1)
		RETURN
	END
	ELSE
	BEGIN
		SELECT @WORKERNAME AS �ALI�AN
	END
	
END

-----------------------
EXEC SP_CARD_CONTROL @WORKERBARCODE = 'B3CEEB5F-9BB9-4D29-B807-B412473C3EAC'






