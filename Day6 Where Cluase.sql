CREATE DATABASE ECommerceDB;
CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(50),
    City VARCHAR(30),
    Email VARCHAR(50)
);
CREATE TABLE Products (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(50),
    Price INT,
    Category VARCHAR(30)
);
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Order_Date DATE,
    Total_Amount INT,

    FOREIGN KEY (Customer_ID)
    REFERENCES Customers(Customer_ID)
);
CREATE TABLE OrderDetails (
    Detail_ID INT PRIMARY KEY,
    Order_ID INT,
    Product_ID INT,
    Quantity INT,

    FOREIGN KEY (Order_ID)
    REFERENCES Orders(Order_ID),

    FOREIGN KEY (Product_ID)
    REFERENCES Products(Product_ID)
);
INSERT INTO Customers VALUES
(1, 'Aman', 'Agra', 'aman@gmail.com'),
(2, 'Rahul', 'Delhi', 'rahul@gmail.com'),
(3, 'Arjun', 'Meerut', 'arjun@gmail.com');

INSERT INTO Products VALUES
(101, 'Laptop', 45000, 'Electronics'),
(102, 'Mobile', 15000, 'Electronics'),
(103, 'Shoes', 2000, 'Fashion');

INSERT INTO Orders VALUES
(1001, 1, '2026-11-20', 45000),
(1002, 2, '2026-11-21', 17000),
(1003, 1, '2026-11-22', 2000);

INSERT INTO OrderDetails VALUES
(1, 1001, 101, 1),
(2, 1002, 102, 1),
(3, 1002, 103, 1),
(4, 1003, 103, 1);

-- All customers
SELECT * FROM Customers;

-- Agra ke customers
SELECT * FROM Customers
WHERE City = 'Agra';

-- Customer ID 2 ka record
SELECT * FROM Customers
WHERE Customer_ID = 2;

-- 10000 se jyada price wale products
SELECT * FROM Products
WHERE Price > 10000;

-- 2000 price wala product
SELECT * FROM Products
WHERE Price = 2000;

-- 20000 se kam price wale products
SELECT * FROM Products
WHERE Price < 20000;

-- Electronics category ke products
SELECT * FROM Products
WHERE Category = 'Electronics';

SELECT * FROM Products
WHERE Category = 'Electronics'
AND Price > 20000;

SELECT * FROM Products
WHERE Category = 'Fashion'
OR Price > 20000;

SELECT * FROM Products
WHERE Price BETWEEN 2000 AND 20000;

SELECT * FROM Customers
WHERE City IN ('Agra', 'Delhi');

-- A se start hone wale names
SELECT * FROM Customers
WHERE Customer_Name LIKE 'A%';

-- a par end hone wale names
SELECT * FROM Customers
WHERE Customer_Name LIKE '%a';

-- Name mein 'man' hone wale customers
SELECT * FROM Customers
WHERE Customer_Name LIKE '%man%';

SELECT * FROM Customers
WHERE City != 'Agra';
