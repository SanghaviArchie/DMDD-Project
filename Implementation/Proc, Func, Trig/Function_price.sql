CREATE FUNCTION Total_Price
(@a varchar(11),
@b varchar(10)
)
RETURNS int
AS

BEGIN 

DECLARE @c int, @d int, @e int
SET @c = (SELECT Price FROM PRODUCT WHERE ProductID = @a);
SET @d = (SELECT ProductQuantity FROM ORDERDETAILS WHERE ProductID = @a AND OrderID = @b);

set @e = @c*@d

RETURN @e


END

drop function Total_Price

ALTER TABLE ORDERDETAILS
ADD TotalPrice AS (dbo.Total_Price(ProductID, OrderID))

select * from ORDERDETAILS