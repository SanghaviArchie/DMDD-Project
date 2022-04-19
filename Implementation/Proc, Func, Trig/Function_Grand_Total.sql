CREATE FUNCTION Grand_Total
(
@b varchar(10)
)
RETURNS int
AS

BEGIN 

DECLARE @c int, @d int

SET @d = (SELECT sum(TotalPrice) FROM ORDERDETAILS WHERE OrderID = @b group by OrderID );


RETURN @d


END

DROP FUNCTION Grand_Total
UPDATE ORDERS
SET GrandTotal = (dbo.Grand_Total(OrderID))

