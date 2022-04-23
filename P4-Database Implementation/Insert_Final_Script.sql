USE PROJECT

--Insert queries for all the tables--
INSERT INTO [dbo].[CUSTOMER]
           ([FirstName] ,[LastName],[Address],[PostalCode] ,[Email],[Password],[PhoneNo] ,[City])
  
     VALUES
           ('Alpha', 'Don', '1 Pond St','02567', 'alpha@ok.com','abc@121',1234567890,'Boston'),
		   ('Beta', 'Cook', '12 Walnut St','02898', 'beta@yahoo.com','abc@122',1960690000,'Boston'),
		   ('Charles', 'Vit', '90 Hallway Ave','02896', 'vit@ok.com','abc@123',1111111111,'NewYork'),
		   ('Rev', 'Ant', '89 Dalby St','02898', 'rev@in.com','abc@124',1999999999,'Boston'),
		   ('Nik', 'Dalli', '55 City View','07849', 'nik@ok.com','abc@125',1827292889,'NewYork'),
		   ('Yack', 'Joe', '90 Chesnut Ave','07849', 'yajo@ok.com','abc@126',1768494897,'NewYork'),
		   ('John', 'Bond', '153 Tremond St','02567', 'jb@ok.com','abc@127',1939393939,'DC'),
		   ('Jack', 'Fiz', '45 Pond St','02567', 'jf@ok.com','abc@128',1990292300,'DC'),
		   ('Alex', 'Tud', '66 Palace St','02567', 'at@ok.com','abc@129',1467493873,'Boston'),
		   ('Zil', 'low', '893 Main St','02567', 'zil@ok.com','aaa@123',1976543215,'Boston'),
		   ('Alice', 'Bil', '1712 JV Apt','02555', 'bil@yahoo.com','abb@123',1938927203,'Dallas'),
		   ('Tim', 'Cook', '12 Walnut St','02666', 'tim@cook.com','acc@123',1490900001,'Seattle'),
		   ('Abc', 'Efg', '90 Hallway Ave','02896', 'abc@ok.com','add@123',1111122222,'Los Angles'),
		   ('Sak', 'Eth', '89 Dalby St','07808', 'sak@in.com','bdd@123',1999999999,'SF'),
		   ('Nan', 'Qil', '55 City View','02020', 'nanl@ok.com','cdd@123',1827292889,'Seattle'),
		   ('Kyun', 'Jun', '90 Chesnut Ave','02121', 'kyun@ok.com','def@123',1768494897,'Seattle'),
		   ('Hello', 'Bond', '153 Tremond St','02567', 'hellob@ok.com','aed@123',1939393939,'Missiouri'),
		   ('Gin', 'Kin', '45 Pond St','02567', 'kin@ok.com','jkf@123',1990292308,'Dallas'),
		   ('June', 'Cill', '66 Palace St','02567', 'june@ok.com','jdn@123',1467493873,'LOS Angles'),
		   ('Flan', 'Now', '893 Main St','02567', 'flan@ok.com','dhj@123',1976543215,'Seattle');

INSERT INTO [dbo].[ORDERS]
           ([CustomerID],[OrderStatus])
     VALUES
          ('CID0003','delivered'),
		   ('CID0005','ordered'),
		   ('CID00010','shipped'),
		   ('CID0001','delivered'),
		   ('CID0007','ordered'),
		   ('CID0008','shipped'),
		   ('CID0002', 'oncart'),
		   ('CID0003','ordered'),
		   ('CID0006', 'oncart'),
		   ('CID00011','shipped'),
		   ('CID00012', 'delivered'),
		   ('CID00013','ordered'),
		   ('CID00016', 'delivered'),
		   ('CID00018','oncart'),
		   ('CID00019','shipped'),
		   ('CID00012','oncart'),
		   ('CID0001','shipped')
GO
INSERT INTO [dbo].[VENDOR]
([Name],[Email], [PostalCode],[Password],[PhoneNo])
VALUES('Shiv', 'av@gmail.com','02120','abcd', 1987654321),
( 'Harry', 'bc@gmail.com','02121','a12',1987654322),
( 'Steve', 'de@gmail.com','02122','tjjhga',1987654323),
( 'Mick', 'bn@gmail.com','02123','rty8',1987654324),
( 'Raaz', 'an@gmail.com','02124','67yy',1987654325),
( 'Tim',  'kav@gmail.com','02125','yu8',1987654326),
( 'Wals',  'tv@gmail.com','02126','ab8j',1987654327),
('Chris', 'wv@gmail.com','02127','ab8h',1987654328),
('Kat', 'yh@gmail.com','02128','17cd',1987654329),
('Ross', 'kv@gmail.com','02129','gfs92',1987654388);



INSERT INTO [dbo].[PRODUCT]
([ProductName],[Price],[Category],[Dimensions],[Brand],[Color],[Size],[CreatedBy],[UpdatedBy],[QUANTITY])
VALUES('T-shirt', 100, 'Apparel', ' ', 'ABC', 'Red', 'S', ' VID0001', 'VID0001',15),
('Shirt', 109, 'Apparel', ' ', 'Levis', 'Blue', 'L', ' VID0002', ' VID0002',20),
('Jeans', 110, 'Apparel', ' ', 'Nike', 'Black', 'M', 'VID0003 ', ' VID0003',30),
('Trousers', 140, 'Apparel', ' ', 'Adidas', 'Pink', 'L', 'VID0004', 'VID0004 ',15),
('Jackets', 160, 'Apparel', ' ', 'MK', 'Violet', 'S', ' VID0005', ' VID0005',10),
('Laptop', 150, 'Electronics', '8*8*4', 'Dell', 'Grey', 'L', ' VID0006', 'VID0006 ',25),
('Mobile', 170, 'Electronics', '8*11*4', 'Samsung', 'Yellow', '', ' VID0007', 'VID0007 ',30),
('Watches', 190, 'Electronics', '8*9*4', 'MK', 'Black', ' ', 'VID0008 ', 'VID0008 ',50),
('headphones', 199, 'Electronics', '8*6*4', 'Apple', 'Blue', ' ', ' VID0009', 'VID0009 ',20),
('Keyboard', 150, 'Electronics', '8*8*4', 'HP', 'White', ' ', 'VID00010 ', 'VID00010 ',10),
('Glasses', 599, 'Accessories', ' ', 'Guess', 'Green', ' ', 'VID0001 ',' VID0001',20),
('Hairband', 699, 'Accessories', ' ', 'Forever21', 'Grey', ' ', 'VID0002 ', 'VID0002 ',30),
('Clips', 899, 'Accessories', ' ', 'Aber', 'Black', ' ', ' VID0003', ' VID0003',10),
('Rings', 599, 'Accessories', ' ', 'XYZ', 'Pink', ' ', ' VID0004', ' VID0004',5),
('Shoes', 1399, 'Footwear', ' ', 'UndArmo', 'Grey', 'L', ' VID0005', 'VID0005 ',20),
('Flipflops', 150, 'Footwear', ' ', 'AmEagle', 'Grey', 'L', 'VID00010 ', 'VID00010 ',30),
('sandals', 299, 'Footwear', ' ', 'AmEagle', 'Red', 'L', ' VID0009', 'VID0009 ',15),
('Sneakers', 149, 'Footwear', ' ', 'Holister', 'Blue', 'S', ' VID0008', 'VID0008 ',20),
('Loafers', 150, 'Footwear', ' ', 'Altrd', 'Grey', 'L', 'VID0007 ', 'VID0007 ',10),
('Wedges', 999, 'Footwear', ' ', 'Puma', 'Grey', 'L', 'VID0006', 'VID0006 ',15),
('Stilettos', 1999, 'Footwear', ' ', 'Zara', 'Black', 'S', 'VID0005 ', ' VID0005',10),
('Couch', 999, 'Furniture', '6*10*4', 'Wayfair', 'Blue', ' ', 'VID0004 ', 'VID0004 ',10),
('Bed', 2999, 'Furniture', '6*14*4', 'Ikea', 'Blue', ' ', 'VID0003 ', ' VID0003',20),
('Table', 5999, 'Furniture', '6*10*4', 'Kartell', 'Blue','', ' VID0002', 'VID0002 ',30),
('Chair', 1999, 'Furniture', '6*11*4', 'Tuft', 'Black', ' ', 'VID0001 ', 'VID0001 ',15);



INSERT INTO [dbo].[ORDERDETAILS]
([OrderID],[ProductID],[ProductQuantity])
 VALUES
 ('OID0001','PID0001',7),
('OID0002','PID00010',5),
('OID0003','PID00011',11),
('OID0004','PID00012',15),		   
('OID0005','PID00013',6),
('OID0006','PID00014',2),
('OID0007','PID00015',17),
('OID0008','PID00016',21),
('OID0009','PID0001',7),
('OID00010','PID00010',5),
('OID00011','PID00011',1),
('OID00012','PID00012',15),
('OID00013','PID00013',2),
('OID00014','PID00014',2),
('OID00015','PID00015',2),
('OID00016','PID00016',7),
('OID0002','PID0002',11),
('OID00016','PID0003',18),
('OID0001','PID0006',20),
('OID0002','PID0007',18),
('OID0003','PID0008',42),
('OID0004','PID0009',17),
('OID0005','PID00017',14),
('OID0006','PID00018',10),
('OID0007','PID00019',8),
('OID0008','PID00020',10),
('OID0009','PID00021',8),
('OID00010','PID00022',6),
('OID00017', 'PID00024', 1);




INSERT INTO [dbo].[DELIVERY]
           ([OrderID],[Location],[DeliveryType],[ShippingAddress],[BillingAddress])
     VALUES
           ('OID0001','NewYork','Express','90 Hallway Ave','90 Hallway Ave'),
           ('OID0002','Boston','Standard','55 City View','55 City View'),
		   ('OID0003','Boston','Standard','893 Main St','893 Main St'),
		   ('OID0004','Boston','Express','1 Pond St','1 Pond St'),
		   ('OID0005','DC','Standard','153 Tremond St','153 Tremond St'),
           ('OID0006','DC','Express','45 Pond St','45 Pond St'),
		   ('OID0008','NewYork','Standard','90 Hallway Ave','90 Hallway Ave'),
		   ('OID00010','Dallas','Standard','1712 JV Apt','1712 JV Apt'),
           ('OID00011','Seattle','Express','12 Walnut St','12 Walnut St'),
           ('OID00012','Los Angles','Standard','90 Hallway Ave','90 Hallway Ave'),
		   ('OID00013','Seattle','Standard','90 Chesnut Ave','90 Chesnut Ave'),
		   ('OID00015','Los Angles','Express','66 Palace St','66 Palace St'),
		   ('OID00017','Boston','Standard','1 Pond St','1 Pond St'),
           ('OID00016','Seattle','Express','893 Main St','893 Main St');


INSERT INTO [dbo].[PAYMENT]
           ([OrderID]
           ,[PaymentType]
           ,[ShippingAddress]
           ,[BillingAddress]
           )
     VALUES
          

        ('OID0001','Credit','90 Hallway Ave','90 Hallway Ave'),
           ('OID0002','Debit','55 City View','55 City View'),
		   ('OID0003','Paypal','893 Main St','893 Main St'),
		   ('OID0004','Paypal','1 Pond St','1 Pond St'),
		   ('OID0005','Credit','153 Tremond St','153 Tremond St'),
           ('OID0006','Debit','45 Pond St','45 Pond St'),
		   ('OID0008','Credit','90 Hallway Ave','90 Hallway Ave'),
		   ('OID00010','Paypal','1712 JV Apt','1712 JV Apt'),
           ('OID00011','credit','12 Walnut St','12 Walnut St'),
           ('OID00012','Debit','90 Hallway Ave','90 Hallway Ave'),
		   ('OID00013','Credit','90 Chesnut Ave','90 Chesnut Ave'),
		   ('OID00015','Debit','66 Palace St','66 Palace St'),
		   ('OID00017','Paypal','1 Pond St','1 Pond St'),
           ('OID00016','Credit','893 Main St','893 Main St');



Insert into WISHLIST(ProductID, CustomerID)
values ('PID0001','CID0001'),
('PID0002','CID0001'),
('PID0003','CID0001'),
('PID0001','CID0002'),
('PID0004','CID0002'),
('PID0003','CID0003'),
('PID0004','CID0003'),
('PID0005','CID0004'),
('PID0006','CID0007'),
('PID00010','CID0008'),
('PID00011','CID0009'),
('PID00011','CID0009'),
('PID00012','CID00010'),
('PID00018','CID00015'),
('PID00019','CID00016');


Insert into RETURNEXCHANGE(OrderDetailsID, CreatedBy, UpdatedBy, Comments)
values ('ODID0001','CID0003','CID0003','Does not like it' ),
('ODID00024','CID0001','CID0001','Does not like it' );


Insert into PRODUCTVENDOR(ProductID, VendorID)
values('PID0001','VID0001'),
('PID0002','VID0002'),
('PID0003','VID0003'),
('PID0004','VID0004'),
('PID0005','VID0005'),
('PID0006','VID0006'),
('PID0007','VID0007'),
('PID0008','VID0008'),
('PID0009','VID0009'),
('PID00010','VID00010'),
('PID00011','VID0001'),
('PID00012','VID0002'),
('PID00013','VID0003'),
('PID00014','VID0004'),
('PID00015','VID0005'),
('PID00016','VID00010'),
('PID00017','VID0009'),
('PID00018','VID0008'),
('PID00019','VID0007'),
('PID00020','VID0006'),
('PID00021','VID0005'),
('PID00022','VID0004'),
('PID00023','VID0003'),
('PID00024','VID0002'),
('PID00025','VID0001');