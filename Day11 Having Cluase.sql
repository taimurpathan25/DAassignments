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
        REFERENCES Customers (Customer_ID)
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

SELECT Category, COUNT(*) AS Total_Products
FROM Products;

SELECT Category, SUM(Price) AS Total_Price
FROM Products
GROUP BY Category
HAVING SUM(Price) > 10000;

SELECT Category, AVG(Price) AS Average_Price
FROM Products
GROUP BY Category
HAVING AVG(Price) > 10000;

SELECT Category, MAX(Price) AS Highest_Price
FROM Products
GROUP BY Category
HAVING MAX(Price) > 20000;

SELECT Category, COUNT(*) AS Total_Products
FROM Products
WHERE Price > 1000
GROUP BY Category
HAVING COUNT(*) >= 1;

SELECT Category, COUNT(*) AS Total_Products
FROM Products
GROUP BY Category
HAVING COUNT(*) >= 1
ORDER BY Total_Products DESC;