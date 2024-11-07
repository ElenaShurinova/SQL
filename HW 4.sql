CREATE DATABASE Shop;

USE Shop;

CREATE TABLE Customers (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    rating DECIMAL(3, 2)
);

CREATE TABLE Products (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10, 2)
);

CREATE TABLE Sales (
    id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    sell_id INT,
    sell_date DATE,
    amt DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(id),
    FOREIGN KEY (product_id) REFERENCES Products(id)
);



INSERT INTO Customers (id, name, rating) VALUES
(1, 'Alice', 4.5),
(2, 'Bob', 3.8),
(3, 'Charlie', 4.2);

INSERT INTO Products (id, name, price) VALUES
(1, 'Laptop', 1000.00),
(2, 'Phone', 500.00),
(3, 'Tablet', 300.00);

INSERT INTO Sales (id, customer_id, product_id, sell_id, sell_date, amt) VALUES
(1, 1, 1, 101, '2022-06-15', 1000.00),
(2, 2, 2, 102, '2022-04-20', 500.00),
(3, 3, 3, 103, '2022-05-10', 300.00),
(4, 1, 1, 104, '2022-03-25', 1000.00);



SELECT * FROM Sales
WHERE MONTH(sell_date) = 6;



SELECT * FROM Sales
WHERE sell_date BETWEEN '2022-04-10' AND '2022-05-10';



SELECT COUNT(*) AS MarchPurchases FROM Sales
WHERE MONTH(sell_date) = 3;



SELECT AVG(amt) AS AverageMarchAmt FROM Sales
WHERE MONTH(sell_date) = 3;



SELECT MIN(c.rating) AS MinAprilRating FROM Sales s
JOIN Customers c ON s.customer_id = c.id
WHERE MONTH(sell_date) = 4 AND YEAR(sell_date) = 2022;



SELECT sell_id, SUM(amt) AS TotalAmt FROM Sales
WHERE sell_date BETWEEN '2022-03-01' AND '2022-05-01'
GROUP BY sell_id
ORDER BY TotalAmt DESC
LIMIT 1;



SELECT * FROM Sales
WHERE DAYOFWEEK(sell_date) = 3; 