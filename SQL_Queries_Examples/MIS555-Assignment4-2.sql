--Evan Kurpiewski
--Assignment 4

USE northwind


--1. Give all details of the highest price product.

SELECT      *
FROM        Products
WHERE       Products.UnitPrice IN
            (
            SELECT  MAX(Products.UnitPrice)
            FROM    Products
            )
ORDER BY    Products.ProductID

--2. Give all details of products that have an above average price.

SELECT      *
FROM        Products
WHERE       Products.UnitPrice  >   (
                                    SELECT  AVG(Products.UnitPrice)
                                    FROM    Products
                                    )
ORDER BY    Products.ProductID

--3. Give all details of products that have a price higher than average compared to other products in their category.

select      *
FROM        Products
WHERE       [Products].[UnitPrice] > (
                                    SELECT  AVG(UnitPrice) as[Average]
                                    FROM    Products as ProdCat
                                    where   ProdCat.CategoryID = Products.CategoryID
                                    ) 
ORDER BY    Products.ProductName

--4. For each product, show the name, unitprice, and the average of unitprice of products in the same category.

;WITH   AveragePerProduct (CategoryID, Average) AS
(
    SELECT      Products.CategoryID,
                AVG(Products.UnitPrice) as [Average]
    FROM        Products
    GROUP BY    Products.CategoryID
)

SELECT      Products.ProductName,
            Products.UnitPrice,
            AveragePerProduct.Average,
            Products.CategoryID
FROM        AveragePerProduct
    JOIN    Products on Products.CategoryID = AveragePerProduct.CategoryID
ORDER BY    Products.ProductName

--5. Show full details of the biggest order ever. Biggest in terms of revenue: the sum of all lines on the order, accounting for discounts. Full details includes the orderID, orderdate, customerID, productID, productname, quantity, unitprice, and discount.

;WITH OrderTotals (OrderID,Totals) AS
(
SELECT      [Order Details].OrderID,
            SUM([Order Details].Quantity 
            * ([Order Details].UnitPrice 
            * (1-[Order Details].Discount))) 
            + Orders.Freight AS Total
FROM        [Order Details]
    JOIN    Orders ON [Order Details].OrderID = Orders.OrderID
GROUP BY    [Order Details].OrderID,
            Orders.Freight
)

SELECT      [Order Details].OrderID,
            Orders.OrderDate,
            Orders.CustomerID,
            [Orders].OrderDate,
            Products.ProductID,
            [Order Details].Quantity,
            [Order Details].Discount,
            [Order Details].UnitPrice
FROM        [Order Details]
    JOIN    OrderTotals on [Order Details].OrderID = OrderTotals.OrderID
    JOIN    Orders ON Orders.OrderID = [Order Details].OrderID
    JOIN    Products ON [Order Details].ProductID = Products.ProductID
WHERE       OrderTotals.Totals =    (
                                    SELECT MAX(OrderTotals.Totals)
                                    FROM OrderTotals
                                    )

--6. Give a list of every product with their supplier. In the last column, show the average number of units sold per order in 1997.

;WITH AverageOrder (ProductID, [Average in 1997 per product]) AS
(
    SELECT      [Order Details].ProductID,
                AVG([Order Details].Quantity)
    FROM        [Order Details]
        JOIN    Orders ON [Order Details].OrderID = Orders.OrderID
    WHERE       YEAR(Orders.OrderDate) = 1997
    GROUP BY    [Order Details].ProductID
)

SELECT      Products.ProductName,
            Suppliers.CompanyName,
            AverageOrder.[Average in 1997 per product]
FROM        AverageOrder
    JOIN    Products ON Products.ProductID = AverageOrder.ProductID
    JOIN    Suppliers ON Products.SupplierID = Suppliers.SupplierID
ORDER BY    Products.ProductName

--7. Give all details of products that have a price higher than average compared to other products from the same supplier.

;WITH AverageProduct (SupplierID, [Average Price From Supplier]) AS
(
    SELECT      Products.SupplierID,
                AVG(Products.UnitPrice) AS  [Average Price]
    FROM        Products
    GROUP BY    Products.SupplierID
)

SELECT      Products.ProductID,
            Products.ProductName,
            Products.SupplierID,
            Products.CategoryID,
            Products.QuantityPerUnit,
            Products.UnitPrice,
            Products.UnitsInStock,
            Products.UnitsOnOrder,
            Products.ReorderLevel,
            Products.Discontinued,
            AverageProduct.[Average Price From Supplier]
FROM        Products
    JOIN    AverageProduct ON Products.SupplierID = AverageProduct.SupplierID
WHERE       Products.UnitPrice > AverageProduct.[Average Price From Supplier]

--8. For each product, show the biggest number of units sold on an order in 1997.

;WITH   OrderMax (ProductID,ProductName,OrderID,Quantity, OrderDate) AS
(
SELECT      Products.ProductID,
            Products.ProductName,
            [Order Details].[OrderID],
            [Order Details].Quantity,
            Orders.OrderDate
FROM        Products
    JOIN    [Order Details] ON [Order Details].ProductID = Products.ProductID
    JOIN    Orders on [Order Details].OrderID = Orders.OrderID
WHERE       YEAR(Orders.OrderDate) = 1997
)

SELECT      [OrderMax].ProductName,
            MAX(OrderMax.Quantity) AS [Max Quantity of an Order in 1997]
FROM        [Order Details]
    JOIN    OrderMax ON [Order Details].OrderID = OrderMax.OrderID
WHERE       [OrderMax].Quantity=    (
                                    SELECT  MAX(OrderMax.Quantity)
                                    FROM    OrderMax
                                    WHERE   OrderMax.ProductID = [Order Details].ProductID
                                    )
GROUP BY    OrderMax.ProductName
ORDER BY    [OrderMax].ProductName

