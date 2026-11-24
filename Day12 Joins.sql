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

SELECT
    Customers.Customer_Name,
    Orders.Order_ID,
    Orders.Total_Amount
FROM Customers
INNER JOIN Orders
ON Customers.Customer_ID = Orders.Customer_ID;

SELECT
    Customers.Customer_Name,
    Orders.Order_ID
FROM Customers
LEFT JOIN Orders
ON Customers.Customer_ID = Orders.Customer_ID;

SELECT
    Customers.Customer_Name,
    Orders.Order_ID
FROM Customers
RIGHT JOIN Orders
ON Customers.Customer_ID = Orders.Customer_ID;

SELECT
    Customers.Customer_Name,
    Orders.Order_ID
FROM Customers
FULL OUTER JOIN Orders
ON Customers.Customer_ID = Orders.Customer_ID;

SELECT
    Customers.Customer_Name,
    Products.Product_Name
FROM Customers
CROSS JOIN Products;

SELECT
    Customers.Customer_Name,
    Orders.Order_ID,
    OrderDetails.Product_ID,
    OrderDetails.Quantity
FROM Customers
INNER JOIN Orders
ON Customers.Customer_ID = Orders.Customer_ID

INNER JOIN OrderDetails
ON Orders.Order_ID = OrderDetails.Order_ID;

SELECT
    Customers.Customer_Name,
    Orders.Order_ID,
    Products.Product_Name,
    OrderDetails.Quantity,
    Products.Price
FROM Customers

INNER JOIN Orders
ON Customers.Customer_ID = Orders.Customer_ID

INNER JOIN OrderDetails
ON Orders.Order_ID = OrderDetails.Order_ID

INNER JOIN Products
ON OrderDetails.Product_ID = Products.Product_ID;