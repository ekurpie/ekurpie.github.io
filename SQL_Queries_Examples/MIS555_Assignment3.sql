-- Evan Kurpiewski
-- MIS 555
-- Assignment 3

USE northwind


-- 1. Give a count of how many products are supplied by each supplier. Be sure to include suppliers who do not supply us any products. In other words, their product count will be zero.

SELECT         Suppliers.CompanyName,
               COUNT(Products.ProductID) AS [Number of Products]
FROM           Suppliers
   LEFT JOIN   Products ON Suppliers.SupplierID = Products.SupplierID
GROUP BY       Suppliers.CompanyName
ORDER BY       Suppliers.CompanyName;

-- 2. Give a list of products that have not appeared on any order. Use the common form to accomplish this: LEFT JOIN where IS NULL. Do not use COUNT to do this.

SELECT         Products.ProductName
FROM           Products
   LEFT JOIN   [Order Details] ON [Order Details].[ProductID] = Products.ProductID
WHERE          [Order Details].OrderID IS NULL
ORDER BY       Products.ProductName;

-- 3. Give a list of customers who have not placed an order. Use LEFT JOIN where IS NULL.

SELECT         Orders.CustomerID
FROM           [Order Details]
   LEFT JOIN   Orders ON [Order Details].OrderID = Orders.OrderID
WHERE          [Order Details].[OrderID] IS NULL
ORDER BY       Orders.CustomerID;

-- 4. Give a list of Products, and their category name. Where a product is not in a category, still list the product, just show NULL for the category name.

SELECT         Products.ProductName,
               Categories.CategoryName
FROM           Products
   LEFT JOIN   Categories ON Products.CategoryID = categories.CategoryID
ORDER BY       Products.ProductName;

-- 5. Give a list of Suppliers that don't supply us a product.

SELECT         Suppliers.CompanyName
FROM           Suppliers
   LEFT JOIN   Products on Suppliers.SupplierID = Products.SupplierID
WHERE          Products.ProductID IS NULL
ORDER BY       Suppliers.CompanyName;

-- 6. Give a list of Employees that haven't sold anything.

SELECT          Employees.EmployeeID
FROM            Employees
   LEFT JOIN    Orders ON Employees.EmployeeID = Orders.EmployeeID
WHERE           Orders.EmployeeID IS NULL
ORDER BY        Employees.EmployeeID

-- 7. Give a list of Employees and the total that they have sold for 1997. Include even employees that have not sold anything.

SELECT          Orders.EmployeeID,
                Employees.FirstName,
                Employees.LastName,
                SUM([Order Details].UnitPrice) as [Total Sold]
FROM            Orders 
    LEFT JOIN   [Order Details] on Orders.OrderID = [Order Details].OrderID
    JOIN        Employees on Orders.EmployeeID = Employees.EmployeeID
WHERE           YEAR(orders.OrderDate) = 1997
GROUP BY        Orders.EmployeeID,Employees.FirstName,Employees.LastName
ORDER BY        Orders.EmployeeID
                               
-- 8. Give a list of Employees that have not sold any of productID = 7.

SELECT      Employees.EmployeeID
FROM        Employees
where       Employees.EmployeeID NOT IN
            (
            SELECT     orders.EmployeeID
            FROM        Orders
               JOIN    [Order Details] ON Orders.OrderID = [Order Details].OrderID
            WHERE       ProductID = 7
            )
ORDER BY    Employees.EmployeeID

-- 9. Give a list of Orders that don't have anything from CategoryID = 1

SELECT     Distinct([Order Details].OrderID)
from       [Order Details]
   JOIN    Products ON [Order Details].ProductID = Products.ProductID
WHERE      [Order Details].OrderID NOT IN 
           ( 
           Select [Order Details].OrderID
           FROM Products
           jOIN [Order Details] ON [Order Details].ProductID = Products.ProductID
           WHERE Products.CategoryID = 1  
           )
ORDER BY   [Order Details].OrderID

-- 10.Give a list of Products, and the total sold for that product. Include even products that haven't sold.

SELECT         Products.ProductName,
               SUM([Order Details].UnitPrice) as [Total Sold]
FROM           Products
   LEFT JOIN   [Order Details] ON Products.ProductID = [Order Details].ProductID
GROUP BY       Products.ProductName
ORDER BY       Products.ProductName

