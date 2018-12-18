CREATE DATABASE [TestDB]
GO
USE [TestDB]
GO
CREATE TABLE [TestTable]
(id int primary key identity (1,1), Categories varchar(50), Status varchar(50))
GO
INSERT INTO [TestTable]
VALUES('Shirts', NULL),('Pants', 'GOOD'),('Shoes', NULL), ('Pants',NULL),('Hats','GOOD'),('Shirts','GOOD'),('Shoes','GOOD'),('Hats',NULL)
GO

SELECT * FROM [TestTable]

SELECT *
FROM (
   SELECT *,
          ROW_NUMBER() OVER (PARTITION BY [Categories] ORDER BY id) AS ROW_NUMBER
   FROM [TestTable]
   ) AS ROWS
WHERE ROW_NUMBER = 1;