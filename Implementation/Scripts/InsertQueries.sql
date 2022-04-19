USE [PROJECT]
GO

INSERT INTO [dbo].[CUSTOMER]
           ([FirstName] ,[LastName],[Address],[PostalCode] ,[Email],[PhoneNo] ,[City])
  
     VALUES
           ('Alpha', 'Don', '1 Pond St','02567', 'alpha@ok.com',1234567890,'Boston'),
		   ('Beta', 'Cook', '12 Walnut St','02898', 'beta@yahoo.com',1960690000,'Boston'),
		   ('Charles', 'Vit', '90 Hallway Ave','02896', 'vit@ok.com',1111111111,'NewYork'),
		   ('Rev', 'Ant', '89 Dalby St','02898', 'rev@in.com',1999999999,'Boston'),
		   ('Nik', 'Dalli', '55 City View','07849', 'nik@ok.com',1827292889,'NewYork'),
		   ('Yack', 'Joe', '90 Chesnut Ave','07849', 'yajo@ok.com',1768494897,'NewYork'),
		   ('John', 'Bond', '153 Tremond St','02567', 'jb@ok.com',1939393939,'DC'),
		   ('Jack', 'Fiz', '45 Pond St','02567', 'jf@ok.com',199029230,'DC'),
		   ('Alex', 'Tud', '66 Palace St','02567', 'at@ok.com',1467493873,'Boston'),
		   ('Zil', 'low', '893 Main St','02567', 'zil@ok.com',1976543215,'Boston')
GO
INSERT INTO [dbo].[ORDERS]
           ([CustomerID],[OrderStatus],[GrandTotal],[UpdatedBy])
     VALUES
          ('CID0003','delivered',NULL,NULL),
		   ('CID0005','ordered',NULL,NULL),
		   ('CID00010','shipped',NULL,NULL),
		   ('CID0001','delivered',NULL,NULL),
		   ('CID0007','ordered',NULL,NULL),
		   ('CID0008','shipped',NULL,NULL)

GO
INSERT INTO [dbo].[ORDERDETAILS]
           ([OrderID],[ProductID],[ProductQuantity])
     VALUES
           ('OID0001','PID00011',2),('OID0002','PID00011',1),('OID0003','PID00010',3),('OID0004','PID00025',5),
		   ('OID0005','PID0001',1),('OID0006','PID0006',1),('OID0002','PID00017',1),('OID0003','PID0002',1),
		   ('OID0003','PID0009',1),('OID0001','PID0002',10)
GO


/*Altering address to varchar(40) */

ALTER TABLE DELIVERY
ALTER COLUMN ShippingAddress varchar(40);
ALTER TABLE DELIVERY
ALTER COLUMN BillingAddress varchar(40);
ALTER TABLE PAYMENT
ALTER COLUMN BillingAddress varchar(40);
ALTER TABLE PAYMENT
ALTER COLUMN ShippingAddress varchar(40);


INSERT INTO [dbo].[DELIVERY]
           ([OrderID],[Location],[DeliveryDate] ,[DeliveryType],[ShippingAddress],[CreatedBy],[UpdatedBy],[BillingAddress])
     VALUES
           ('OID0001','NewYork','2022-04-19',NULL,'90 Hallway Ave',NULL,NULL,'90 Hallway Ave'),
		   ('OID0003','Boston',NULL,NULL,'893 Main St',NULL,NULL,'893 Main St'),
		   ('OID0004','Boston','2022-04-19',NULL,'1 Pond St',NULL,NULL,'90 Hallway Ave'),
		   ('OID0006','DC',NULL,NULL,'45 Pond St',NULL,NULL,'8 chocolate road')
GO
INSERT INTO [dbo].[PAYMENT]
           ([OrderID]
           ,[PaymentType]
           ,[ShippingAddress]
           ,[PaymentStatus]
           ,[BillingAddress]
           ,[PaymentDate])
     VALUES
           ('OID0001','COD','90 Hallway Ave','Paid','90 Hallway Ave','2022-04-19'),
		   ('OID0003','Card','893 Main St','Paid','893 Main St','2022-04-19'),
		   ('OID0004','COD','1 Pond St','Paid','90 Hallway Ave','2022-04-19'),
		   ('OID0006','COD','90 Hallway Ave','Due','90 Hallway Ave',NULL),
		   ('OID0002','COD','55 City View','Due','55 City View',NULL),
		   ('OID0005','Paytm','153 Tremond St','Paid','153 Tremond St','2022-04-19')


GO



