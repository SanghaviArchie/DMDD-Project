-- Create View to Display Product based on sales

GO
CREATE OR ALTER VIEW [dbo].[ProdSalesDetails] AS

SELECT P.ProductID,P.ProductName, SUM(OD.ProductQuantity) AS TotalQuantity, SUM(OD.ProductQuantity*P.Price) AS Revenue
FROM ORDERDETAILS AS OD
JOIN PRODUCT AS P ON OD.ProductID = P.ProductID
JOIN ORDERS AS O ON O.OrderID = OD.OrderID
WHERE O.OrderStatus = 'DELIVERED'
GROUP BY P.ProductID, P.ProductName



GO

SELECT * FROM ProdSalesDetails ORDER BY Revenue DESC


-- Create View to Display Sales by Region 

GO
CREATE OR ALTER VIEW [dbo].[ProdSalesByRegion] AS

SELECT P.ProductID, P.ProductName, C.City , SUM(OD.ProductQuantity) AS TotalQuantity FROM ORDERDETAILS AS OD
JOIN PRODUCT AS P ON OD.ProductID = P.ProductID
JOIN ORDERS AS O ON O.OrderID = OD.OrderID
JOIN CUSTOMER AS C ON C.CustomerID = O.CustomerID
WHERE O.OrderStatus = 'DELIVERED'
GROUP BY C.City, P.ProductID, P.ProductName

GO

SELECT * FROM ProdSalesByRegion ORDER BY TotalQuantity DESC

-- Create View to Display Sales by category and Brand

GO
CREATE OR ALTER VIEW [dbo].[ProdSalesByCategory] AS

SELECT P.ProductID, P.ProductName, P.Price, P.Category, P.Brand, SUM(OD.ProductQuantity) AS TotalQuantity FROM ORDERDETAILS AS OD
JOIN PRODUCT AS P ON OD.ProductID = P.ProductID
JOIN ORDERS AS O ON O.OrderID = OD.OrderID
WHERE O.OrderStatus = 'DELIVERED'
GROUP BY P.Category, P.Brand ,P.ProductID, P.ProductName, P.Price, P.Category, P.Brand

GO

SELECT * FROM ProdSalesByCategory ORDER BY TotalQuantity DESC


-- Create View to Display Top 10 Customers based on their Purchase history

GO
CREATE OR ALTER VIEW [dbo].[CustSalesView] AS

SELECT C.CustomerID, C.FirstName, C.LastName, SUM(O.GrandTotal) AS TotalSpend FROM CUSTOMER AS C
JOIN ORDERS AS O ON O.CustomerID = C.CustomerID
WHERE O.OrderStatus = 'Delivered'
GROUP BY C.CustomerID, C.FirstName, C.LastName


GO

SELECT * FROM CustSalesView ORDER BY TotalSpend DESC


-- Create View to Display Out Of Stock Product

GO
CREATE OR ALTER VIEW [dbo].[ProdOutOfStock] AS

SELECT P.ProductID, V.VendorID, P.Quantity FROM PRODUCT AS P
JOIN VENDOR AS V ON V.VendorID = P.CreatedBy
WHERE P.Quantity <= 0.0

GO

SELECT * FROM ProdOutOfStock

