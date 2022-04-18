CREATE TABLE CUSTOMER
(
[CustomerID][varchar] (10) NOT NULL,
[FirstName] [varchar] (20) NOT NULL,
[LastName] [varchar] (20) NOT NULL,
[Address] [varchar] (40) NULL,
[PostalCode][varchar] (10) NULL,
[Email] [varchar](15) NULL,
[PhoneNo] [int] NULL ,
[City] [varchar] (10) NULL,
CONSTRAINT [primary_CustID] PRIMARY KEY CLUSTERED
([CustomerID] ASC )
ON [PRIMARY]
)
CREATE TABLE ORDERS
(
[OrderID] [varchar] (10) NOT NULL,
[CustomerID] [varchar] (10) NOT NULL,
[OrderStatus] [varchar] (10) NULL,
[OrderDate] [date] NULL,
[GrandTotal] [float] NULL,
[CreatedDate] [date] NULL,
[UpdatedBy] [varchar] (10) NULL,
[UpdatedDate] [date] NULL,
CONSTRAINT [primary_OrderID] PRIMARY KEY CLUSTERED
([OrderID] ASC )
ON [PRIMARY]
)
CREATE TABLE ORDERDETAILS
(
[OrderDetailsID] [varchar] (10) NOT NULL,
[OrderID] [varchar] (10) NOT NULL,
[ProductID] [varchar] (10) NOT NULL,
[ProductQuantity] [int] NULL,
[UpdatedDate] [date] NULL,
CONSTRAINT [primary_OrderDetID] PRIMARY KEY CLUSTERED
([OrderDetailsID] ASC )
ON [PRIMARY] )
CREATE TABLE PRODUCT
(
[ProductID] [varchar] (10) NOT NULL,
[ProductName] [varchar] (20) NOT NULL,
[Price] [float] NOT NULL,
[Category] [varchar] (10) NULL,
[Dimensions] [varchar](10) NULL,
[Brand] [varchar](10) NULL,
[Color] [varchar](10) NULL,
[Size] [char](2) NULL,
[UpdatedBy] [varchar] (10) NULL,
[UpdatedDate] [date] NULL,
[CreatedDat] [date] NULL,
--[ProductImage] [varbinary(max)] NULL,
[CreatedBy] [varchar] (10) NULL,
CONSTRAINT [primary_ProductID] PRIMARY KEY CLUSTERED
([ProductID] ASC )
ON [PRIMARY]
)
CREATE TABLE PAYMENT
(
[OrderID] [varchar] (10) NOT NULL,
[PaymentType] [varchar] (10) NOT NULL,
[ShippingAddress] [varchar] (10) NULL,
[PaymentStatus] [varchar](10) NULL,
[BillingAddress] [varchar](10) NULL,
[PaymentDate] [date] NULL,
[CreatedBy] [varchar] (10) NULL,
CONSTRAINT [primary_OrderID1] PRIMARY KEY CLUSTERED
([OrderID] ASC )
ON [PRIMARY]
)
CREATE TABLE DELIVERY
(
[DeliveryID] [varchar] (10) NOT NULL,
[OrderID] [varchar] (10) NOT NULL,
[Location] [varchar] (10) NULL,
[DeliveryDate] [date] NULL,
[DeliveryType] [varchar] (10) NULL,
[ShippingAddress] [varchar] (10) NULL,
[CreatedBy] [varchar] (10) NULL,
[CreatedDate] [date] NULL,
[UpdatedBy] [varchar] (10) NULL,
[UpdatedDate] [date] NULL,
[BillingAddress] [varchar] (10) NULL,
CONSTRAINT [primary_DeliveryID] PRIMARY KEY CLUSTERED
([DeliveryID] ASC )
ON [PRIMARY]
)
CREATE TABLE RETURNEXCHANGE
(
[RequestID] [varchar] (10) NOT NULL,
[OrderDetailsID] [varchar] (10) NOT NULL,
[CreatedBy] [varchar] (10) NULL,
[CreatedDate] [date] NULL,
[UpdatedBy] [varchar] (10) NULL,
[UpdatedDate] [date] NULL,
[Comments] [varchar] (100) NULL,
CONSTRAINT [primary_ReqID] PRIMARY KEY CLUSTERED
([RequestID] ASC )
ON [PRIMARY]
)
CREATE TABLE WISHLIST
(
[ProductID] [varchar] (10) NOT NULL,
[CustomerID] [varchar] (10) NOT NULL,
[CreatedDate] [date] NULL,
)
CREATE TABLE VENDOR
(
[VendorID] [varchar] (10) NOT NULL,
[Name] [varchar] (40) NOT NULL,
[VendorType] [varchar] (10) NULL,
[Email] [varchar] (10) NULL,
[PostalCode] [varchar] (10) NULL,
[PhoneNo] [int] NULL,
CONSTRAINT [primary_VendorID] PRIMARY KEY CLUSTERED
([VendorID] ASC )
ON [PRIMARY]
)
CREATE TABLE PRODUCTVENDOR
(
[ProductVendorID] [varchar] (10) NOT NULL,
[ProductID] [varchar] (10) NOT NULL,
[VendorID] [varchar] (10) NOT NULL,
[CreatedDate] [date] NULL,
[UpdatedDate] [date] NULL,
[UpdatedBy] [varchar] (10) NULL,
CONSTRAINT [primary_ProductVendorID] PRIMARY KEY CLUSTERED
([ProductVendorID] ASC )
)