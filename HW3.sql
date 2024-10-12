 -- Вывести имя продавца и сумму его заказов.

SELECT s.Name AS SellerName, SUM(o.Amount) AS TotalAmount
FROM Seller s
LEFT JOIN Orders o ON s.SellerID = o.SellerID
GROUP BY s.Name;


 -- Вывести имя клиента и сумму его заказов.

SELECT c.Name AS CustomerName, SUM(o.Amount) AS TotalAmount
FROM Customer c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.Name;


 -- Вывести всех продавцов, включая тех, у кого нет заказов.

SELECT s.Name AS SellerName, COALESCE(SUM(o.Amount), 0) AS TotalAmount
FROM Seller s
LEFT JOIN Orders o ON s.SellerID = o.SellerID
GROUP BY s.Name;


 -- Вывести все заказы, включая информацию о продавцах, даже если не все продавцы сделали заказы.

SELECT o.OrderID, o.Amount, s.Name AS SellerName
FROM Orders o
RIGHT JOIN Seller s ON o.SellerID = s.SellerID;


 --  Вывести продавцов и их начальников.

SELECT s.Name AS SellerName, b.Name AS BossName
FROM Seller s
LEFT JOIN Seller b ON s.BossID = b.SellerID;


 -- Найти всех клиентов из города “Москва” и суммы их заказов.

SELECT c.Name AS CustomerName, SUM(o.Amount) AS TotalAmount
FROM Customer c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE c.City = 'Москва'
GROUP BY c.Name;


 --  Найти всех продавцов из города “Сочи” и их заказы, если таковые имеются.

SELECT s.Name AS SellerName, o.OrderID, o.Amount
FROM Seller s
LEFT JOIN Orders o ON s.SellerID = o.SellerID
WHERE s.City = 'Сочи';


 --  Найти всех клиентов с заказами выше 5000 и информацию о продавцах, которые их обслуживали.

SELECT c.Name AS CustomerName, o.Amount, s.Name AS SellerName
FROM Customer c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Seller s ON o.SellerID = s.SellerID
WHERE o.Amount > 5000;


 --  Найти всех продавцов, у которых есть начальники.

SELECT s.Name AS SellerName, b.Name AS BossName
FROM Seller s
JOIN Seller b ON s.BossID = b.SellerID;


 -- Вывести пары покупателей и обслуживших их продавцов из одного города.

SELECT c.Name AS CustomerName, s.Name AS SellerName
FROM Customer c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Seller s ON o.SellerID = s.SellerID
WHERE c.City = s.City;
