CREATE TRIGGER trg_Prod_SKU
ON PROJECT.dbo.ORDERDETAILS
AFTER INSERT
AS
BEGIN
	
	DECLARE @a int
	set @a = (SELECT ProductQuantity FROM inserted);

	UPDATE PRODUCT SET QUANTITY = QUANTITY - @a where ProductID=(SELECT ProductID from inserted);
	
END;