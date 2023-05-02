DECLARE @ID UNIQUEIDENTIFIER
SET @ID = NEWID()
SELECT @ID AS RANDOM_ID
PRINT(@ID);


USE MASTER
GO
DROP DATABASE IF EXISTS LECTURE7_INDEX_DEMO
GO
CREATE DATABASE LECTURE7_INDEX_DEMO
GO
USE LECTURE7_INDEX_DEMO
GO
CREATE TABLE MyTable(	MyRandomString nvarchar(36) NOT NULL);DECLARE @i INT = 500000; -- 500K LOOP * 20 RECORD = 10.000.000 RECORDS
WHILE @i > 0
	BEGIN
		INSERT INTO MyTable(MyRandomString)
		VALUES
		(NEWID()), -- 1
		(NEWID()), -- 2
		(NEWID()), -- 3
		(NEWID()), -- 4
		(NEWID()), -- 5
		(NEWID()), -- 6
		(NEWID()), -- 7
		(NEWID()), -- 8
		(NEWID()), -- 9
		(NEWID()), -- 10
		(NEWID()), -- 11
		(NEWID()), -- 12
		(NEWID()), -- 13
		(NEWID()), -- 14
		(NEWID()), -- 15
		(NEWID()), -- 16
		(NEWID()), -- 17
		(NEWID()), -- 18
		(NEWID()), -- 19
		(NEWID()) -- 20
		SET @i = @i - 1;
	END;
PRINT('DONE');


-- count the record
SELECT COUNT(*) FROM MyTable

-- insert a special record
INSERT INTO MyTable(MyRandomString) VALUES (N'XIN CH픏 INDEX')

-- copy data to MyTableIndex
SELECT *
INTO MyTableIndex
FROM MyTable

-- check data are the same record count
SELECT COUNT(*) FROM MyTable
SELECT COUNT(*) FROM MyTableIndex

-- take the same time to process
SELECT MyRandomString FROM MyTable WHERE MyRandomString = N'XIN CH픏 INDEX';
SELECT MyRandomString FROM MyTableIndex WHERE MyRandomString = N'XIN CH픏 INDEX';

-- create an index on MyTableIndex
CREATE INDEX IDX_HELLO_INDEXON MyTableIndex (MyRandomString);-- try it againSELECT MyRandomString FROM MyTable WHERE MyRandomString = N'XIN CH픏 INDEX';
SELECT MyRandomString FROM MyTableIndex WHERE MyRandomString = N'XIN CH픏 INDEX';