--------------------------------------- STORED PROCEDURE 1 ----------------------------------------
--------- This Procedure Checks if the Order is Already Exists in the ORDER table -----------

CREATE PROC SP_ADD @ProductID varchar(20), @CustomerID varchar(20), @Quantity int
AS

BEGIN

DECLARE @A varchar(20) , @B varchar(20), @C date, @D int, @F int

SET @A = (SELECT OrderID FROM ORDERS WHERE CustomerID = @CustomerID  AND OrderStatus = 'oncart' )
SET @B = (SELECT OrderDetailsID FROM ORDERDETAILS WHERE OrderID = @A)
SET @C = (SELECT CreatedDate FROM ORDERS WHERE OrderID = @A)
SET @D = (SELECT COUNT(OrderDetailsID) FROM ORDERDETAILS )
SET @F = (SELECT COUNT(OrderID) FROM ORDERS)


		IF EXISTS (SELECT OrderID FROM ORDERS WHERE CustomerID = @CustomerID)
		Begin
		INSERT INTO ORDERDETAILS(CreatedDate, UpdatedDate, OrderID, ProductID, ProductQuantity) VALUES (getDate(), getdate(), @A, @ProductID, @Quantity);
		End
		
		IF NOT EXISTS (SELECT @A FROM ORDERS WHERE CustomerID = @CustomerID)
		Begin
		--SET IDENTITY_INSERT [PROJECT].[dbo].[ORDERS] OFF
		INSERT INTO [ORDERS] (CreatedDate, UpdatedDate, CustomerID, OrderStatus, UpdatedBy) VALUES(getdate(), getdate(), @CustomerID, 'oncart', @CustomerID);
		
		SET @A = (SELECT OrderID FROM ORDERS WHERE CustomerID = @CustomerID );
		--SET IDENTITY_INSERT [PROJECT].[dbo].[ORDERDETIALS] OFF
		INSERT INTO ORDERDETAILS(CreatedDate, UpdatedDate, OrderID, ProductID, ProductQuantity) VALUES(getdate(), getdate(), @A, @ProductID, @Quantity);
		
		End

END

--------------------------------------- STORED PROCEDURE 2 ----------------------------------------
--------------This Procedure is Used to perform check out and update the Order Status--------------

CREATE PROCEDURE sp_checkout

@OID VARCHAR(20),
@CID varchar(20),
@Ptype varchar(10),
@ShipAdd varchar(40),
@BillAdd varchar(40)


AS

DECLARE @lastOID varchar(20)

INSERT INTO PAYMENT(OrderID, PaymentType, ShippingAddress, BillingAddress)
VALUES (@OID, @Ptype, @ShipAdd, @BillAdd)

SET @lastOID = SCOPE_IDENTITY()

IF (@lastOID IS NOT NULL)
	BEGIN
		UPDATE ORDERS
		SET
		OrderStatus = 'ordered',
		UpdatedDate = GETDATE(),
		UpdatedBy = @CID
		WHERE OrderID = @OID;
	END

--------------------------------------- STORED PROCEDURE 3 ---------------------------------------
 -------------This Stored Procedure Encrypts the Password Field in the Customer and Vendor Table -----------------

CREATE PROCEDURE SP_Encrypt
AS
BEGIN

    IF (SELECT COUNT(*) FROM sys.symmetric_keys WHERE name LIKE '%DatabaseMasterKey%') = 0
    BEGIN
        CREATE MASTER KEY ENCRYPTION BY   
        PASSWORD = 'Somepassword@123';
    END
	SELECT name KeyName,
	  symmetric_key_id KeyID,
	key_length KeyLength,
	algorithm_desc KeyAlgorithm
	FROM sys.symmetric_keys;
    IF NOT EXISTS(SELECT * FROM sys.certificates WHERE name = 'PWDENC')
    BEGIN
        CREATE CERTIFICATE PWDENC  
        WITH SUBJECT = 'User Password Encryption'; 
    END

   IF NOT EXISTS(SELECT * FROM sys.symmetric_keys WHERE name = 'PWD_Key_01')
    BEGIN
        CREATE SYMMETRIC KEY PWD_Key_01  
        WITH ALGORITHM = AES_256  
        ENCRYPTION BY CERTIFICATE PWDENC;
    END    

	OPEN SYMMETRIC KEY PWD_Key_01  
   DECRYPTION BY CERTIFICATE PWDENC;

    UPDATE CUSTOMER SET cencpwd = EncryptByKey(Key_GUID('PWD_Key_01'), Password);
    UPDATE VENDOR SET vencpwd = EncryptByKey(Key_GUID('PWD_Key_01'), Password);

	CLOSE SYMMETRIC KEY PWD_Key_01;

END

EXEC SP_Encrypt