-- Create Database
CREATE DATABASE PROJECT

--creating sequences for primary key auto increment 

USE PROJECT

CREATE SEQUENCE  custcount
MINVALUE 1
START WITH 1
INCREMENT BY 1
No cache
no cycle;

CREATE SEQUENCE  ordercount
MINVALUE 1
START WITH 1
INCREMENT BY 1
No cache
no cycle;

CREATE SEQUENCE  productcount
MINVALUE 1
START WITH 1
INCREMENT BY 1
No cache
no cycle;


CREATE SEQUENCE  orderdetailcount
MINVALUE 1
START WITH 1
INCREMENT BY 1
No cache
no cycle;

CREATE SEQUENCE  paymentcount
MINVALUE 1
START WITH 1
INCREMENT BY 1
No cache
no cycle;

CREATE SEQUENCE  deliverycount
MINVALUE 1
START WITH 1
INCREMENT BY 1
No cache
no cycle;

CREATE SEQUENCE exchangecount
MINVALUE 1
START WITH 1
INCREMENT BY 1
No cache
no cycle;

CREATE SEQUENCE  wishlistcount
MINVALUE 1
START WITH 1
INCREMENT BY 1
No cache
no cycle;

CREATE SEQUENCE  vendorcount
MINVALUE 1
START WITH 1
INCREMENT BY 1
No cache
no cycle;

CREATE SEQUENCE  prdvencount
MINVALUE 1
START WITH 1
INCREMENT BY 1
No cache
no cycle;

USE PROJECT;

-- Create Tables
CREATE TABLE CUSTOMER
(
CustomerID  varchar(20) not null constraint DF_ccon default 'CID000' + CAST(next value for custcount as varchar(10)),
CreatedDate DATETIME2 not null DEFAULT GETDATE(),
UpdatedDate DATETIME2 not null DEFAULT GETDATE(),
[FirstName] [varchar] (20) NOT NULL,
[LastName] [varchar] (20) NOT NULL,
[Address] [varchar] (40) NULL,
[PostalCode][varchar] (10) NULL,
[Password] [varchar] (40) NOT NULL,
[cencpwd] varbinary(128) NULL,
[Email] [varchar](15) NULL CHECK (Email like '%_@__%.__%') UNIQUE,
[PhoneNo] [int] NULL CHECK (PhoneNo >= 1000000000 AND PhoneNo <= 9999999999 ),
[City] [varchar] (10) NULL,
CONSTRAINT [primary_CustID] PRIMARY KEY CLUSTERED
([CustomerID] ASC )
ON [PRIMARY]
)
CREATE TABLE ORDERS
(
OrderID [varchar](20) not null constraint DF_ocon default 'OID000' + CAST(next value for ordercount as varchar(10)),
CreatedDate DATETIME2 not null DEFAULT GETDATE(),
UpdatedDate DATETIME2 not null DEFAULT GETDATE(),
[CustomerID] [varchar] (20) NOT NULL FOREIGN KEY REFERENCES CUSTOMER(CUSTOMERID),
[OrderStatus] [varchar] (10) NULL,
[GrandTotal] [float] NULL,
[UpdatedBy] [varchar] (10) NULL,
CONSTRAINT [primary_OrderID] PRIMARY KEY CLUSTERED
([OrderID] ASC )
ON [PRIMARY]
)


CREATE TABLE PRODUCT
(
ProductID varchar(20) not null constraint DF_pcon default 'PID000' + CAST(next value for productcount as varchar(10)),
CreatedDate DATETIME2 not null DEFAULT GETDATE(),
UpdatedDate DATETIME2 not null DEFAULT GETDATE(),  
[ProductName] [varchar] (20) NOT NULL,
[Price] [float] NOT NULL CHECK (PRICE > 0.0),
Quantity INT NOT NULL,
[Category] [varchar] (20) NULL,
[Dimensions] [varchar](10) NULL,
[Brand] [varchar](20) NULL,
[Color] [varchar](10) NULL,
[Size] [char](2) NULL,
[UpdatedBy] [varchar] (10) NULL,
[ProductImage] varbinary(MAX) NULL,
[CreatedBy] [varchar] (10) NULL,
CONSTRAINT [primary_ProductID] PRIMARY KEY CLUSTERED
([ProductID] ASC )
ON [PRIMARY]
)

CREATE TABLE ORDERDETAILS
(
OrderDetailsID  varchar(20) not null constraint DF_odcon default 'ODID000' + CAST(next value for orderdetailcount as varchar(10)),
CreatedDate DATETIME2 NOT NULL DEFAULT GETDATE(),
UpdatedDate DATETIME2 NOT NULL DEFAULT GETDATE(),
[OrderID] [varchar] (20) NOT NULL FOREIGN KEY REFERENCES ORDERS(ORDERID),
[ProductID] [varchar] (20) NOT NULL FOREIGN KEY REFERENCES PRODUCT(PRODUCTID),
[ProductQuantity] [int] NOT NULL CHECK (ProductQuantity != 0),
CONSTRAINT [primary_OrderDetID] PRIMARY KEY CLUSTERED
([OrderDetailsID] ASC )
ON [PRIMARY] )

CREATE TABLE PAYMENT
(
PAYMENTID varchar(20) not null constraint DF_pycon default 'PYID000' + CAST(next value for paymentcount as varchar(10)),
[OrderID] [varchar] (20) NOT NULL FOREIGN KEY REFERENCES ORDERS(ORDERID),
[PaymentType] [varchar] (10) NOT NULL,
[ShippingAddress] [varchar] (40) NULL,
[BillingAddress] [varchar](40) NULL,
CreatedDate DATETIME2 not null DEFAULT GETDATE(),
CONSTRAINT [primary_PaymentID] PRIMARY KEY CLUSTERED
([PaymentID] ASC )
ON [PRIMARY]
)
CREATE TABLE DELIVERY
(
DeliveryID varchar(20) not null constraint DF_dcon default 'DID000' + CAST(next value for deliverycount as varchar(10)),
CreatedDate DATETIME2 not null DEFAULT GETDATE(),
UpdatedDate DATETIME2 not null DEFAULT GETDATE(), 
[OrderID] [varchar] (20) NOT NULL FOREIGN KEY REFERENCES ORDERS(ORDERID),
[Location] [varchar] (10) NULL,
[DeliveryType] [varchar] (10) NULL,
[ShippingAddress] [varchar] (40) NULL,
[BillingAddress] [varchar] (40) NULL,
CONSTRAINT [primary_DeliveryID] PRIMARY KEY CLUSTERED
([DeliveryID] ASC )
ON [PRIMARY]
)
CREATE TABLE RETURNEXCHANGE
(
RequestID varchar(20) not null constraint DF_rcon default 'RID000' + CAST(next value for exchangecount as varchar(10)),
CreatedDate DATETIME2 not null DEFAULT GETDATE(),
UpdatedDate DATETIME2 not null DEFAULT GETDATE(), 
[OrderDetailsID] [varchar] (20) NOT NULL FOREIGN KEY REFERENCES ORDERDETAILS(OrderDetailsID),
[CreatedBy] [varchar] (10) NULL,
[UpdatedBy] [varchar] (10) NULL,
[Comments] [varchar] (100) NULL,
CONSTRAINT [primary_ReqID] PRIMARY KEY CLUSTERED
([RequestID] ASC )
ON [PRIMARY]
)
CREATE TABLE WISHLIST
(
WishlistID varchar(20) not null constraint DF_wcon default 'WID000' + CAST(next value for wishlistcount as varchar(10)),
CreatedDate DATETIME2 not null DEFAULT GETDATE(),
[ProductID] [varchar] (20) NOT NULL FOREIGN KEY REFERENCES PRODUCT(ProductID),
[CustomerID] [varchar] (20) NOT NULL FOREIGN KEY REFERENCES CUSTOMER(CustomerID),
CONSTRAINT [primary_WishlistID] PRIMARY KEY CLUSTERED
([WishlistID] ASC )
ON [PRIMARY]
)

CREATE TABLE VENDOR
(
VendorID varchar(20) not null constraint DF_vcon default 'VID000' + CAST(next value for vendorcount as varchar(10)),
CreatedDate DATETIME2 not null DEFAULT GETDATE(),
UpdatedDate DATETIME2 not null DEFAULT GETDATE(),
[Name] [varchar] (40) NOT NULL,
[Email] [varchar] (40) NULL CHECK (Email like '%_@__%.__%') UNIQUE,
[Password] [varchar] (40) NOT NULL,
[vencpwd] varbinary(128) NULL,
[PostalCode] [varchar] (10) NULL,
[PhoneNo] [int] NOT NULL CHECK (PhoneNo >= 1000000000 AND PhoneNo <= 9999999999 ),
CONSTRAINT [primary_VendorID] PRIMARY KEY CLUSTERED
([VendorID] ASC )
ON [PRIMARY]
)
CREATE TABLE PRODUCTVENDOR
(
ProductVendorID  varchar(20) not null constraint DF_pvcon default 'PVID000' + CAST(next value for prdvencount as varchar(10)),
CreatedDate DATETIME2 not null DEFAULT GETDATE(),
UpdatedDate DATETIME2 not null DEFAULT GETDATE(),
[ProductID] [varchar] (20) NOT NULL FOREIGN KEY REFERENCES PRODUCT(ProductID),
[VendorID] [varchar] (20) NOT NULL FOREIGN KEY REFERENCES VENDOR(VendorID),
[UpdatedBy] [varchar] (10) NULL,
CONSTRAINT [primary_ProductVendorID] PRIMARY KEY CLUSTERED
([ProductVendorID] ASC )
)

--Creating non clustered index--
create NonClustered index IX_Customer_FirstName
on Customer (FirstName ASC)

create NonClustered index IX_Product_ProductName
on Product (ProductName ASC)

create NonClustered index IX_Vendor_Name
on Vendor ([Name] ASC)