CREATE TRIGGER trg_Product_change
ON PROJECT.dbo.PRODUCT
AFTER INSERT, DELETE
AS

BEGIN
INSERT INTO PROJECT.dbo.PRODUCT_AUDIT(
		ID,
		ProductID,
		ProductName,
		Price,
		Category,
		Dimensions,
		Brand,
		Color,
		Size,
		ProductImage,
		operation
)
	SELECT 
		i.ProductID,
		ProductName,
		Price,
		Category,
		Dimensions,
		Brand,
		Color,
		Size,
		GETDATE(),
		i.ProductImage
		'INS'
	FROM 
		inserted AS i
	
	UNION ALL
		
		SELECT 
			d.ProductID,
			ProductName,
			Price,
			Category,
			Dimensions,
			Brand,
			Color,
			Size,
			d.ProductImage,
			GETDATE()
			'DEL'
		FROM 
			deleted AS d
END;