-- Evan Kurpiewski

 

USE northwind

 -- 1. For each product, show the categoryname, productname, unitprice and unitsOnOrder. Only include products that are not discontinued and have units on order.
 
SELECT   Products.ProductName,
         Categories.CategoryName,
         Products.UnitPrice,
         Products.UnitsOnOrder
FROM     Categories
   JOIN  Products ON Categories.CategoryID = Products.CategoryID
WHERE    Products.Discontinued = 0 AND Products.UnitsOnOrder != 0
ORDER BY Products.ProductName;

 -- 2. Show each category name, the number of products in the category, and the average unitprice. Only include products that are not discontinued.

SELECT   Categories.CategoryName,
         COUNT(Products.ProductID) AS [Number of Products],
         AVG(Products.UnitPrice) AS [Average Unit Price]
FROM     Categories
  JOIN   Products ON Categories.CategoryID = Products.CategoryID
WHERE    Products.Discontinued = 0
GROUP BY Categories.CategoryName
ORDER BY Categories.CategoryName;

 -- 3.  For each product, show the supplier company name, the productname, and unitprice. Only include products that are under $20.

SELECT   Products.ProductName,
         Suppliers.CompanyName,
         Products.UnitPrice
FROM     Products
   JOIN  Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE    Products.UnitPrice < 20
ORDER BY Products.ProductName;

 -- 4. For each suppliers, show the company name, Region, number of products supplied, and the average unitprice.

SELECT   Suppliers.CompanyName,
         Suppliers.Region,
         COUNT(Products.ProductID) AS [Products Supplied],
         AVG(products.unitPrice) AS [Average Unit Price]
FROM     Suppliers
   JOIN  Products ON Suppliers.SupplierID = Products.SupplierID
GROUP BY Suppliers.CompanyName, Suppliers.Region
ORDER BY Suppliers.CompanyName;

 -- 5. Give a list of suppliers that supply more than one product.

SELECT   Suppliers.CompanyName
FROM     Suppliers
   JOIN  Products ON Suppliers.SupplierID = Products.SupplierID
GROUP BY Suppliers.CompanyName
HAVING   COUNT(Products.ProductID) > 1
ORDER BY suppliers.companyName;

 -- 6. Give a list of categories that have average product unit price over $10.

SELECT   Categories.CategoryName
FROM     Categories
   JOIN  Products ON Categories.CategoryID = Products.CategoryID
GROUP BY Categories.CategoryName
HAVING   AVG(Products.UnitPrice) > 10
ORDER BY Categories.CategoryName;

 -- 7. For each product, show the categoryName, supplier company name, productname, and unitprice.

SELECT   Products.ProductName,
         Categories.CategoryName,
         Suppliers.CompanyName,
         Products.UnitPrice
FROM     Categories
   JOIN  Products ON Categories.CategoryID = Products.CategoryID
   JOIN  Suppliers ON Products.SupplierID = Suppliers.SupplierID

 -- 8. We want to see which categories each supplier has products for. Show the Supplier company name, the Category name, and the number of products in each Supplier/category combination.

SELECT   Suppliers.CompanyName,
         Categories.CategoryName,
         COUNT(Products.ProductID) AS [Number of Products]
FROM     Suppliers
   JOIN  Products ON Suppliers.SupplierID = Products.SupplierID
   JOIN  Categories ON Products.CategoryID = Categories.CategoryID
GROUP BY Suppliers.CompanyName, Categories.CategoryName
ORDER BY Suppliers.CompanyName;

 -- 9. We want pricing information for each category. Show each category name, the minimum, average, and maximum unitprice of all products in that category.

SELECT   Categories.CategoryName,
         MAX(Products.UnitPrice) AS [Maximum Price],
         MIN(Products.UnitPrice) AS [Minimum Price],
         AVG(Products.UnitPrice) AS [Average Price]
FROM     Categories
   JOIN  Products ON Categories.CategoryID = Products.CategoryID
GROUP BY Categories.CategoryName
ORDER BY Categories.CategoryName;

 -- 10. We want pricing information for products from each supplier. Show each supplier company name, the minimum, average, and maximum unitprice of all products from that supplier. Do not include products that have been discontinued.

SELECT   Suppliers.CompanyName,
         MIN(Products.UnitPrice) AS [Minimum Price],
         MAX(Products.UnitPrice) AS [Maximum Price],
         AVG(Products.UnitPrice) AS [Average Price]
FROM     Suppliers
   JOIN  Products ON Suppliers.SupplierID = Products.SupplierID
WHERE    Products.Discontinued = 0
GROUP BY Suppliers.CompanyName;