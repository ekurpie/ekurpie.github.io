--Evan Kurpiewski


USE Northwind


-- 1.   Show the OrderID, Order date, customerID, productname, quantity, and unitprice of every item on every order.

SELECT   Orders.OrderID,
         Orders.OrderDate,
         Orders.CustomerID,
         Products.ProductName,
         [Order Details].Quantity,
         [Order Details].UnitPrice
FROM     Orders 
   JOIN  [Order Details] ON Orders.OrderID = [Order Details].OrderID
   JOIN  Products ON [Order Details].ProductID = Products.ProductID
ORDER BY Orders.OrderID;

-- 2.   Give a count of the number of orders, by customer. Only include customers whose customerID does not start with the letter 'C'.

SELECT   Orders.CustomerID AS Customers, 
         COUNT(Orders.OrderID) AS Order_Count 
FROM     Orders 
WHERE    Orders.CustomerID NOT LIKE 'c%' 
GROUP BY Orders.CustomerID
ORDER BY Orders.CustomerID;

-- 3.   Show each Productname, how many orders it has been on, and the average price it is sold for. Only include products from SupplierIDs 1, 4, 5, and 7.

SELECT   Products.ProductName,
         COUNT(*) as OrderCount,
         AVG([Order Details].[UnitPrice]) AS [Unit Cost]
FROM     [Order Details] 
   JOIN  Products ON [Order Details].ProductID = Products.ProductID 
WHERE    Products.SupplierID IN (1,4,5,7)
GROUP BY Products.ProductName
ORDER BY Products.ProductName;

-- 4.   Show each orderID, CustomerID, and month of the orderdate, and the number of lines on the order.

SELECT   Orders.OrderID,
         Orders.CustomerID, MONTH(Orders.OrderDate) as [Month of Order],
         COUNT(*) as Lines 
FROM     Orders 
   JOIN  [Order Details] ON Orders.OrderID = [Order Details].OrderID 
GROUP BY Orders.OrderID,
         Orders.CustomerID,
         MONTH(Orders.OrderDate)
ORDER BY Orders.OrderID;

-- 5.   Give a count of the number of orders, by year and month (based on orderdate). Only include orders from 1997.

SELECT   YEAR(Orders.OrderDate) as Year,
         MONTH(Orders.OrderDate) as Month,
         COUNT(Orders.OrderID) as Orders 
FROM     Orders 
WHERE    YEAR(Orders.OrderDate) = 1997 
GROUP BY MONTH(Orders.OrderDate),
         YEAR(Orders.OrderDate)
ORDER BY MONTH(Orders.OrderDate) ASC;

-- 6.   Give a list of orderIDs that were shipped by the requireddate.

SELECT   Orders.OrderID as [Orders On Time],
         Orders.RequiredDate,
         Orders.ShippedDate 
FROM     Orders 
WHERE    DATEDIFF(DAY,Orders.RequiredDate,Orders.ShippedDate) < 0
ORDER BY [Orders On Time];

-- 7.   Give a list of orders and their total amount due for the order. Calculate amount due as (unitprice*quantity)*(1-discount). Do not include freight or deal with tax.

SELECT   [Order Details].OrderID, 
         SUM(
            ([Order Details].UnitPrice 
               * [Order Details].Quantity) 
               * (1 - [Order Details].Discount)
            ) as [Amount Due] 
FROM     [Order Details] 
GROUP BY [Order Details].OrderID
ORDER BY [Order Details].[OrderID];

-- 8.   Give a ranking of customers by total revenue for the year 1997. The customer with the highest total dollar amount ordered should be at the top. Only show customers whose orders total more than $500.

SELECT   Orders.CustomerID, 
         SUM(
            ([Order Details].UnitPrice 
               * [Order Details].Quantity) 
               * (1 - [Order Details].Discount)
            ) as AmountDue 
FROM     Orders 
   JOIN  [Order Details] on Orders.OrderID = [Order Details].OrderID
WHERE    YEAR(Orders.OrderDate) = 1997
GROUP BY Orders.CustomerID
HAVING   SUM(
            ([Order Details].UnitPrice 
               * [Order Details].Quantity) 
               * (1 - [Order Details].Discount)
            ) > 500
ORDER BY AmountDue

-- 9.   Show each productName, and the number of times, in 1997, that the product sold for the same unitprice as its list price. Only include products that are not discontinued.

SELECT   Products.ProductName,
         COUNT(*) as [Times Purchased with no Discount],
         Year(Orders.OrderDate) as year 
FROM     Orders 
   JOIN  [Order Details] on Orders.OrderID = [Order Details].OrderID
   JOIN  Products on [Order Details].ProductID = Products.ProductID
WHERE    [Order Details].UnitPrice = Products.UnitPrice 
            and Products.Discontinued = 0 
            and YEAR(Orders.OrderDate) = 1997
GROUP BY Products.ProductName,
         YEAR(Orders.OrderDate)
ORDER BY Products.ProductName;









