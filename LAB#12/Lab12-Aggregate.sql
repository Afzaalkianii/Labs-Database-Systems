

-- ==============================================================================
-- SECTION 1: STORE DATABASE SETUP AND SAMPLE DATA
-- ==============================================================================
CREATE DATABASE IF NOT EXISTS agg_lab;
USE agg_lab;
DROP TABLE IF EXISTS OrderItem, Product, Customer;

CREATE TABLE Customer (
    CustID INT PRIMARY KEY,
    CustName VARCHAR(60) NOT NULL,
    City VARCHAR(30),
    JoinDate DATE
);

CREATE TABLE Product (
    ProdID INT PRIMARY KEY,
    ProdName VARCHAR(60) NOT NULL,
    Category VARCHAR(30),
    Price DECIMAL(10,2),
    StockQty INT
);

CREATE TABLE OrderItem (
    OrderID INT PRIMARY KEY,
    CustID INT,
    ProdID INT,
    Quantity INT,
    OrderDate DATE,
    FOREIGN KEY (CustID) REFERENCES Customer(CustID),
    FOREIGN KEY (ProdID) REFERENCES Product(ProdID)
);

INSERT INTO Customer VALUES
(1, 'Hamza Khan', 'Lahore', '2022-01-15'),
(2, 'Areeba Iqbal', 'Karachi', '2022-04-22'),
(3, 'Saad Raza', 'Lahore', '2023-02-10'),
(4, 'Maham Noor', 'Islamabad', '2023-05-18'),
(5, 'Usman Ahmed', 'Karachi', '2023-09-01'),
(6, 'Hania Sheikh', NULL, '2024-01-12'),
(7, 'Danish Tariq', 'Lahore', '2024-06-30'),
(8, 'Eman Javed', 'Islamabad', '2024-08-25');

INSERT INTO Product VALUES
(101,'Laptop Pro 15', 'Electronics', 185000.00, 12),
(102,'Wireless Mouse', 'Electronics', 2500.00, 50),
(103,'USB-C Cable', 'Electronics', 800.00, 100),
(104,'Office Chair', 'Furniture', 18500.00, 8),
(105,'Standing Desk', 'Furniture', 45000.50, 5),
(106,'Notebook A4', 'Stationery', 350.00, 200),
(107,'Ballpoint Pen 10pk','Stationery', 450.00, 150),
(108,'Coffee Beans 1kg', 'Grocery', 1899.99, 30),
(109,'Green Tea Box', 'Grocery', 650.00, 45),
(110,'Bluetooth Speaker', 'Electronics', 7500.00, 18);

INSERT INTO OrderItem VALUES
(1001, 1, 101, 1, '2023-03-10'),
(1002, 1, 102, 2, '2023-03-10'),
(1003, 2, 104, 1, '2023-05-22'),
(1004, 2, 106, 5, '2023-05-22'),
(1005, 3, 101, 1, '2023-08-15'),
(1006, 3, 110, 1, '2023-08-15'),
(1007, 4, 108, 3, '2023-11-02'),
(1008, 5, 103, 4, '2024-01-20'),
(1009, 5, 102, 1, '2024-01-20'),
(1010, 6, 105, 1, '2024-02-14'),
(1011, 7, 107, 2, '2024-04-08'),
(1012, 7, 106, 10,'2024-04-08'),
(1013, 7, 109, 3, '2024-07-19'),
(1014, 2, 110, 1, '2024-09-05'),
(1015, 3, 108, 2, '2024-10-11');


-- ==============================================================================
-- SECTION 2: PART A - BASIC AGGREGATE FUNCTIONS
-- ==============================================================================

-- Task A1: Counting records from the main store tables.
SELECT 
    (SELECT COUNT(*) FROM Customer) AS TotalCustomers,
    (SELECT COUNT(*) FROM Product) AS TotalProducts,
    (SELECT COUNT(*) FROM OrderItem) AS TotalOrders;

-- Task A2: Finding the minimum and maximum product prices.
SELECT MIN(Price) AS MinPrice, MAX(Price) AS MaxPrice 
FROM Product;

-- Task A3: Calculating the average price of all products.
SELECT ROUND(AVG(Price), 2) AS AvgPrice 
FROM Product;

-- Task A4: Calculating the total available stock.
SELECT SUM(StockQty) AS TotalStock 
FROM Product;

-- Task A5: Counting different customer cities while ignoring NULL values.
SELECT COUNT(DISTINCT City) AS DistinctCities 
FROM Customer;

-- Task A6: Counting different product categories.
SELECT COUNT(DISTINCT Category) AS DistinctCategories 
FROM Product;

-- Task A7: Comparing customers with city data and customers without city data.
SELECT COUNT(City) AS CustomersWithCity FROM Customer;
SELECT COUNT(*) AS CustomersWithoutCity FROM Customer WHERE City IS NULL;

-- Task A8: Finding the earliest and latest order dates.
SELECT MIN(OrderDate) AS EarliestOrder, MAX(OrderDate) AS LatestOrder 
FROM OrderItem;

-- Task A9: Calculating total revenue from ordered products.
SELECT SUM(o.Quantity * p.Price) AS TotalRevenue 
FROM OrderItem o
INNER JOIN Product p ON o.ProdID = p.ProdID;

-- Task A10: Finding the average quantity per order.
SELECT ROUND(AVG(Quantity), 2) AS AvgQuantityPerOrder 
FROM OrderItem;


-- ==============================================================================
-- SECTION 3: PART B - GROUPING, HAVING, AND JOINED AGGREGATES
-- ==============================================================================

-- Task B1: Grouping customers by city.
SELECT City, COUNT(CustID) AS NumCustomers
FROM Customer
GROUP BY City
ORDER BY NumCustomers DESC;

-- Task B2: Counting products within each category.
SELECT Category, COUNT(ProdID) AS NumProducts
FROM Product
GROUP BY Category
ORDER BY NumProducts DESC;

-- Task B3: Comparing category price statistics.
SELECT Category, ROUND(AVG(Price), 2) AS AvgPrice, MIN(Price) AS MinPrice, MAX(Price) AS MaxPrice
FROM Product
GROUP BY Category
ORDER BY AvgPrice DESC;

-- Task B4: Summarizing stock by category.
SELECT Category, SUM(StockQty) AS TotalStock
FROM Product
GROUP BY Category
ORDER BY TotalStock DESC;

-- Task B5: Counting orders by year.
SELECT YEAR(OrderDate) AS Year, COUNT(OrderID) AS NumOrders
FROM OrderItem
GROUP BY YEAR(OrderDate)
ORDER BY Year;

-- Task B6: Counting orders by month for 2024.
SELECT MONTH(OrderDate) AS Month, COUNT(OrderID) AS NumOrders
FROM OrderItem
WHERE YEAR(OrderDate) = 2024
GROUP BY MONTH(OrderDate)
ORDER BY Month;

-- Task B7: Finding categories with a high average price.
SELECT Category
FROM Product
GROUP BY Category
HAVING AVG(Price) > 5000;

-- Task B8: Finding cities with multiple customers.
SELECT City
FROM Customer
WHERE City IS NOT NULL
GROUP BY City
HAVING COUNT(CustID) > 1;

-- Task B9: Counting orders for every customer.
SELECT c.CustName, COUNT(o.OrderID) AS NumOrders
FROM Customer c
LEFT JOIN OrderItem o ON c.CustID = o.CustID
GROUP BY c.CustID, c.CustName;

-- Task B10: Calculating product quantities sold.
SELECT p.ProdName, COALESCE(SUM(o.Quantity), 0) AS TotalQty
FROM Product p
LEFT JOIN OrderItem o ON p.ProdID = o.ProdID
GROUP BY p.ProdID, p.ProdName
ORDER BY TotalQty DESC;

-- Task B11: Calculating revenue by category.
SELECT p.Category, COALESCE(SUM(o.Quantity * p.Price), 0) AS TotalRevenue
FROM Product p
LEFT JOIN OrderItem o ON p.ProdID = o.ProdID
GROUP BY p.Category
ORDER BY TotalRevenue DESC;

-- Task B12: Calculating total spending for each customer.
SELECT c.CustName, COALESCE(SUM(o.Quantity * p.Price), 0) AS TotalSpend
FROM Customer c
LEFT JOIN OrderItem o ON c.CustID = o.CustID
LEFT JOIN Product p ON o.ProdID = p.ProdID
GROUP BY c.CustID, c.CustName
ORDER BY TotalSpend DESC;

-- Task B13: Finding customers with spending above 50,000.
SELECT c.CustName, SUM(o.Quantity * p.Price) AS TotalSpend
FROM Customer c
INNER JOIN OrderItem o ON c.CustID = o.CustID
INNER JOIN Product p ON o.ProdID = p.ProdID
GROUP BY c.CustID, c.CustName
HAVING SUM(o.Quantity * p.Price) > 50000;

-- Task B14: Comparing customers and revenue by city.
SELECT c.City, COUNT(DISTINCT c.CustID) AS NumCustomers, COALESCE(SUM(o.Quantity * p.Price), 0) AS TotalRevenue
FROM Customer c
LEFT JOIN OrderItem o ON c.CustID = o.CustID
LEFT JOIN Product p ON o.ProdID = p.ProdID
WHERE c.City IS NOT NULL
GROUP BY c.City
HAVING COUNT(DISTINCT c.CustID) > 1;

-- Task B15: Finding the three highest-selling products.
SELECT p.ProdName, SUM(o.Quantity) AS TotalQty
FROM Product p
INNER JOIN OrderItem o ON p.ProdID = o.ProdID
GROUP BY p.ProdID, p.ProdName
ORDER BY TotalQty DESC
LIMIT 3;

-- Task B16: Summarizing revenue by year.
SELECT YEAR(o.OrderDate) AS Year, SUM(o.Quantity * p.Price) AS Revenue
FROM OrderItem o
INNER JOIN Product p ON o.ProdID = p.ProdID
GROUP BY YEAR(o.OrderDate)
ORDER BY Year;

-- Task B17: Calculating the average value of an order.
SELECT ROUND(AVG(OrderValue), 2) AS AverageOrderValue
FROM (
    SELECT o.OrderID, SUM(o.Quantity * p.Price) AS OrderValue
    FROM OrderItem o
    INNER JOIN Product p ON o.ProdID = p.ProdID
    GROUP BY o.OrderID
) AS OrderTotals;


-- ==============================================================================
-- SECTION 4: ASSESSMENT - UNIVERSITY DATABASE
-- ==============================================================================
CREATE DATABASE IF NOT EXISTS uni_lab;
USE uni_lab;
DROP TABLE IF EXISTS Enrollment, Course, Student;

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    FullName VARCHAR(60) NOT NULL,
    City VARCHAR(30),
    EnrollDate DATE
);

CREATE TABLE Course (
    CourseID VARCHAR(10) PRIMARY KEY,
    CourseName VARCHAR(60) NOT NULL,
    Department VARCHAR(30),
    Credits INT,
    Fee DECIMAL(10,2)
);

CREATE TABLE Enrollment (
    EnrollID INT PRIMARY KEY,
    StudentID INT,
    CourseID VARCHAR(10),
    Marks INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

INSERT INTO Student VALUES
(1001, 'Saif Raza', 'Lahore', '2022-09-01'),
(1002, 'Iqra Imran', 'Karachi', '2022-09-01'),
(1003, 'Huzaifa Khan', 'Lahore', '2023-09-01'),
(1004, 'Laiba Ali', 'Islamabad', '2022-09-01'),
(1005, 'Aiman Yousaf', NULL, '2024-09-01'),
(1006, 'Rayan Abbas', 'Karachi', '2023-09-01'),
(1007, 'Eman Anwar', 'Lahore', '2022-09-01'),
(1008, 'Danish Hussain', 'Islamabad', '2024-09-01'),
(1009, 'Anaya Yasin', 'Lahore', '2023-09-01');

INSERT INTO Course VALUES
('CS101', 'Intro to Programming', 'Computer Science', 3, 25000),
('CS201', 'Database Systems', 'Computer Science', 3, 28000),
('CS301', 'Operating Systems', 'Computer Science', 4, 30000),
('MT101', 'Calculus I', 'Mathematics', 3, 22000),
('EE201', 'Digital Logic', 'Electrical Engg', 3, 26000),
('BB301', 'Marketing Basics', 'Business', 3, 24000);

INSERT INTO Enrollment VALUES
(1, 1001, 'CS101', 78, '2022-09-15'),
(2, 1001, 'CS201', 85, '2023-09-15'),
(3, 1001, 'MT101', 90, '2022-09-15'),
(4, 1002, 'CS101', 65, '2022-09-15'),
(5, 1002, 'CS201', 72, '2023-09-15'),
(6, 1003, 'CS101', 88, '2023-09-15'),
(7, 1003, 'EE201', 80, '2023-09-15'),
(8, 1004, 'MT101', 95, '2022-09-15'),
(9, 1004, 'CS201', 70, '2023-09-15'),
(10, 1005, 'CS101', 55, '2024-09-15'),
(11, 1006, 'CS101', 82, '2023-09-15'),
(12, 1006, 'CS301', 76, '2024-09-15'),
(13, 1007, 'CS201', 91, '2023-09-15'),
(14, 1007, 'CS301', 86, '2024-09-15'),
(15, 1008, 'CS101', 60, '2024-09-15'),
(16, 1008, 'MT101', 68, '2024-09-15');

-- Q1: Counting students and courses.
SELECT 
    (SELECT COUNT(*) FROM Student) AS TotalStudents,
    (SELECT COUNT(*) FROM Course) AS TotalCourses;

-- Q2: Counting different student cities.
SELECT COUNT(DISTINCT City) AS DistinctCities 
FROM Student 
WHERE City IS NOT NULL;

-- Q3: Calculating overall marks statistics.
SELECT 
    ROUND(AVG(Marks), 2) AS AvgMarks, 
    MIN(Marks) AS MinMarks, 
    MAX(Marks) AS MaxMarks 
FROM Enrollment;

-- Q4: Counting students by city.
SELECT City, COUNT(StudentID) AS NumStudents
FROM Student
GROUP BY City
ORDER BY City IS NULL ASC, NumStudents DESC;

-- Q5: Counting courses by department.
SELECT Department, COUNT(CourseID) AS NumCourses
FROM Course
GROUP BY Department
ORDER BY NumCourses DESC;

-- Q6: Showing enrollment count and average marks for each course.
SELECT c.CourseName, COUNT(e.StudentID) AS EnrolledStudents, ROUND(AVG(e.Marks), 2) AS AvgMarks
FROM Course c
LEFT JOIN Enrollment e ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.CourseName
ORDER BY AvgMarks DESC;

-- Q7: Finding courses with an average mark above 80.
SELECT c.CourseName, ROUND(AVG(e.Marks), 2) AS AvgMarks
FROM Course c
INNER JOIN Enrollment e ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.CourseName
HAVING AVG(e.Marks) > 80;

-- Q8: Calculating course fee totals by department.
SELECT c.Department, SUM(c.Fee) AS TotalRevenue
FROM Course c
INNER JOIN Enrollment e ON c.CourseID = e.CourseID
GROUP BY c.Department
ORDER BY TotalRevenue DESC;

-- Q9: Showing course count and average marks for each student.
SELECT s.FullName, COUNT(e.EnrollID) AS NumCourses, ROUND(AVG(e.Marks), 2) AS AvgMarks
FROM Student s
LEFT JOIN Enrollment e ON s.StudentID = e.StudentID
GROUP BY s.StudentID, s.FullName;

-- Q10: Finding students with a highest mark above 85.
SELECT s.FullName, MAX(e.Marks) AS HighestMark
FROM Student s
INNER JOIN Enrollment e ON s.StudentID = e.StudentID
GROUP BY s.StudentID, s.FullName
HAVING MAX(e.Marks) > 85;

-- Q11: Finding departments with an average below 75.
SELECT c.Department, ROUND(AVG(e.Marks), 2) AS OverallAvgMarks
FROM Course c
INNER JOIN Enrollment e ON c.CourseID = e.CourseID
GROUP BY c.Department
HAVING AVG(e.Marks) < 75;

-- Q12: Finding the top three students by total course fees.
SELECT s.FullName, SUM(c.Fee) AS TotalFee
FROM Student s
INNER JOIN Enrollment e ON s.StudentID = e.StudentID
INNER JOIN Course c ON e.CourseID = c.CourseID
GROUP BY s.StudentID, s.FullName
ORDER BY TotalFee DESC
LIMIT 3;