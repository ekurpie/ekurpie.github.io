SELECT   Orders.OrderID,
         Orders.CustomerID, MONTH(Orders.OrderDate) AS [Month of Order],
         COUNT(*) AS Lines 
FROM     Orders 
   JOIN  [Order Details] ON Orders.OrderID = [Order Details].OrderID 
GROUP BY Orders.OrderID,
         Orders.CustomerID,
         Orders.OrderDate
ORDER BY [Month of Order]