SELECT CompanyName, ContactName, ContactTitle, Phone
FROM `customers`
WHERE Country = "France"

SELECT ProductName, UnitPrice 
FROM `products` 
JOIN suppliers ON suppliers.SupplierID= products.SupplierID 
WHERE CompanyName= "Exotic Liquids"

SELECT CompanyName, COUNT(UnitsOnOrder) 
FROM `suppliers`
JOIN products ON products.SupplierID = suppliers.SupplierID
WHERE country= "france" GROUP BY CompanyName DESC

SELECT CompanyName, COUNT(OrderID) 
FROM `customers` 
JOIN orders ON orders.CustomerID = customers.CustomerID 
WHERE country= "france" GROUP BY CompanyName HAVING COUNT(OrderID)>10

SELECT CompanyName, Country, SUM(UnitPrice*Quantity) ca 
FROM `customers` 
INNER JOIN orders ON orders.CustomerID = customers.CustomerID JOIN `order details` ON orders.OrderID= `order details`.`OrderID` 
GROUP BY CompanyName HAVING SUM(UnitPrice*Quantity) > 30000 ORDER BY ca DESC

-- 6- Liste des pays dans lesquels des produits fournis par "Exotic Liquids" ont été livrés : 
SELECT ShipCountry 
FROM `orders` 
JOIN `order details` ON orders.OrderID= `order details`.`OrderID` JOIN products ON products.ProductID=`order details`.ProductID JOIN suppliers ON products.SupplierID = suppliers.SupplierID 
WHERE CompanyName = "Exotic Liquids" GROUP BY ShipCountry; 

SELECT SUM(UnitPrice * Quantity) 
FROM `order details` 
JOIN orders ON `order details`.`OrderID`= orders.OrderID 
WHERE YEAR(OrderDate)= 1997

SELECT SUM(UnitPrice * Quantity), MONTH(OrderDate) 
FROM `order details` 
JOIN orders ON `order details`.`OrderID`= orders.OrderID 
WHERE YEAR(OrderDate)= 1997 GROUP BY MONTH(OrderDate)

SELECT MAX(OrderDate) 
FROM `orders` 
JOIN customers ON customers.CustomerID= orders.CustomerID 
WHERE CompanyName="Du monde entier"

SELECT AVG(DATEDIFF(ShippedDate, OrderDate)) 
FROM `orders`