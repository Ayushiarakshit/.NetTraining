SELECT TOP 5 ProductID, ProductName,UnitPrice 
FROM Products ORDER BY UnitPrice

SELECT ProductID, ProductName
FROM
(
SELECT tbl.*, ROW_NUMBER() OVER (ORDER BY ProductID) rownum
FROM Products as tbl
) seq
 WHERE seq.rownum BETWEEN 6 AND 10