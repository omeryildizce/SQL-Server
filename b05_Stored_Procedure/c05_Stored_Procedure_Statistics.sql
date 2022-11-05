SELECT * FROM sys.dm_exec_procedure_stats

SELECT 
DB_NAME(database_id) AS DBNAME,
OBJECT_NAME(object_id) AS PROCNAME ,* FROM sys.dm_exec_procedure_stats
WHERE DB_NAME(database_id) = 'ETRADE' 


SET STATISTICS IO ON
SET STATISTICS TIME ON
EXEC SP_SATISLAR '20190101', '20190131', '%' 