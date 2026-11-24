USE Practice;
CREATE TABLE Employees (
    Emp_ID INT,
    Emp_Name VARCHAR(30),
    Age INT,
    Department VARCHAR(30),
    Salary INT
);
INSERT INTO Employees VALUES
(102, 'Rahul', 25, 'HR', 30000),
(103, 'Sameer', 22, 'IT', 28000),
(104, 'Aman', 26, 'Finance', 35000),
(105, 'Rohit', 24, 'Marketing', 32000),
(106, 'Karan', 27, 'HR', 40000);
SELECT * FROM Employees;

