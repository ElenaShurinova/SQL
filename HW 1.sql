
CREATE DATABASE homeworks;
USE homeworks;

CREATE TABLE staff (
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    position VARCHAR(255),
    age INT CHECK (age >= 0 AND age <= 110),
    has_child CHAR(1) DEFAULT 'N',
    username VARCHAR(255) UNIQUE NOT NULL
);

INSERT INTO staff (firstname, lastname, position, age, has_child, username) VALUES
('John', 'Doe', 'Manager', 35, 'Y', 'johndoe'),
('Alice', 'Smith', 'Developer', 28, 'N', 'alicesmith'),
('Bob', 'Johnson', 'Analyst', 42, 'Y', 'bobjohnson'),
('Eve', 'Adams', 'Designer', 25, 'N', 'eveadams'),
('Charlie', 'Brown', 'Tester', 38, 'Y', 'charliebrown');


DROP TABLE staff;

DROP DATABASE homeworks;

CREATE DATABASE tasks;
USE tasks;

CREATE TABLE Staff (
    ID INT PRIMARY KEY,
    LastName VARCHAR(255),
    FirstName VARCHAR(255),
    Department VARCHAR(255),
    Position VARCHAR(255),
    Address VARCHAR(255),
    Birthday DATE
);

SELECT * FROM Staff
WHERE TIMESTAMPDIFF(YEAR, Birthday, CURDATE()) > 20
  AND TIMESTAMPDIFF(YEAR, Birthday, CURDATE()) < 40;
  
  
SELECT * FROM Staff
WHERE TIMESTAMPDIFF(YEAR, Birthday, CURDATE()) < 30
   OR TIMESTAMPDIFF(YEAR, Birthday, CURDATE()) > 45;
   
   
SELECT FirstName, LastName, TIMESTAMPDIFF(YEAR, Birthday, CURDATE()) AS Age
FROM Staff
WHERE ID IN (3, 7, 10);


SELECT * FROM Staff
WHERE FirstName LIKE 'A%'
  AND LastName LIKE '%S';


