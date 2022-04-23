----------------------- USER DEFINED FUNCTIONS 1 -----------------------------------
-------------------- This Function Calculates the Total Amount of the Cart----------

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

ALTER TABLE ORDERDETAILS
ADD TotalPrice AS (dbo.Total_Price(ProductID, OrderID))

----------------------- USER DEFINED FUNCTIONS 2 -----------------------------------
-------------------- This Function Calculates the Total Amount of the Cart----------

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


UPDATE ORDERS
SET GrandTotal = (dbo.Grand_Total(OrderID))

Select * FROM ORDERS
select * from ORDERDETAILS