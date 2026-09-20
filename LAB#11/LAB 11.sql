
-- LAB 11: Scalar Functions - Numeric and Date/Time Operations + Assessment


-- ==============================================================================
-- SECTION 1: DATABASE SETUP AND SAMPLE DATA FOR PART B
-- ==============================================================================
CREATE DATABASE IF NOT EXISTS scalar_lab_b;
USE scalar_lab_b;
DROP TABLE IF EXISTS Product, Customer;

CREATE TABLE Customer (
    CustID INT PRIMARY KEY,
    CustName VARCHAR(60) NOT NULL,
    Email VARCHAR(80),
    City VARCHAR(30),
    Phone VARCHAR(20),
    JoinDate DATE,
    DOB DATE
);

CREATE TABLE Product (
    ProdID INT PRIMARY KEY,
    ProdName VARCHAR(60) NOT NULL,
    Category VARCHAR(30),
    Price DECIMAL(10,2),
    StockQty INT,
    LaunchDate DATE
);

INSERT INTO Customer VALUES
(1, ' Hamza Khan ', 'hamza.khan@MAIL.com', 'Lahore', '0300-1112233','2022-01-15','1995-04-12'),
(2, 'Areeba Iqbal', 'areeba@example.com', 'Karachi', '0301-4445566','2022-04-22','1998-11-20'),
(3, 'Saad Raza', 'saad@example.com', 'Lahore', '0302-7778899','2023-02-10','1997-08-05'),
(4, 'Maham Noor', NULL, 'Islamabad', '0303-1234567','2023-05-18','1999-02-14'),
(5, 'usman ahmed', 'usman@MAIL.COM', 'Karachi', '0304-2345678','2023-09-01','2000-06-30'),
(6, 'Hania Sheikh', 'hania@example.com', NULL, '0305-3456789','2024-01-12','1996-10-25'),
(7, 'Danish Tariq', 'danish@example.com', 'Lahore', NULL, '2024-06-30','2001-03-18'),
(8, 'Eman Javed', 'eman@example.com', 'Islamabad', '0307-5678901','2024-08-25','1994-12-09');

INSERT INTO Product VALUES
(101,'Laptop Pro 15', 'Electronics', 185000.00, 12, '2023-03-10'),
(102,'Wireless Mouse', 'Electronics', 2500.00, 50, '2022-07-22'),
(103,'USB-C Cable', 'Electronics', 800.00, 100,'2021-11-05'),
(104,'Office Chair', 'Furniture', 18500.00, 8, '2023-01-15'),
(105,'Standing Desk', 'Furniture', 45000.50, 5, '2024-02-28'),
(106,'Notebook A4', 'Stationery', 350.00, 200,'2020-04-01'),
(107,'Ballpoint Pen 10pk','Stationery', 450.00, 150,'2020-04-01'),
(108,'Coffee Beans 1kg', 'Grocery', 1899.99, 30, '2023-09-20'),
(109,'Green Tea Box', 'Grocery', 650.00, 45, '2022-12-12'),
(110,'Bluetooth Speaker', 'Electronics', 7500.00, 18, '2024-05-18');


-- ==============================================================================
-- SECTION 2: PART B TASKS (NUMERIC AND DATE/TIME FUNCTIONS)
-- ==============================================================================

-- Task B1: Apply the discount calculation and round the resulting price to two decimal places.
SELECT ProdName, Price, ROUND(Price * 0.85, 2) AS DiscountedPrice
FROM Product;

-- Task B2: Calculate sales tax and display the price including tax.
SELECT ProdName, ROUND(Price * 0.17, 2) AS Tax, ROUND(Price * 1.17, 2) AS PriceWithTax
FROM Product;

-- Task B3: Show the floor and ceiling values after dividing product prices.
SELECT ProdName, Price, FLOOR(Price / 1000) AS FloorVal, CEIL(Price / 1000) AS CeilVal
FROM Product;

-- Task B4: Round product prices to the nearest hundred.
SELECT ProdName, ROUND(Price, -2) AS RoundedPrice
FROM Product;

-- Task B5: Use MOD to select products with odd-numbered IDs.
SELECT * 
FROM Product
WHERE MOD(ProdID, 2) != 0;

-- Task B6: Extract the year, month name, and day name from join dates.
SELECT YEAR(JoinDate) AS JoinYear, MONTHNAME(JoinDate) AS JoinMonth, DAYNAME(JoinDate) AS JoinDay
FROM Customer;

-- Task B7: Format dates into a readable text representation.
SELECT DATE_FORMAT(DOB, '%d-%M-%Y') AS FormattedDOB
FROM Customer;

-- Task B8: Calculate customer age using the current system date.
SELECT CustName, DOB, TIMESTAMPDIFF(YEAR, DOB, CURDATE()) AS Age
FROM Customer;

-- Task B9: Find the number of days since each customer joined.
SELECT CustName, JoinDate, DATEDIFF(CURDATE(), JoinDate) AS DaysSinceJoin
FROM Customer;

-- Task B10: Filter customers by the year of their join date.
SELECT * 
FROM Customer
WHERE YEAR(JoinDate) = 2023;

-- Task B11: Find products launched in the fourth quarter.
SELECT * 
FROM Product
WHERE QUARTER(LaunchDate) = 4;

-- Task B12: Find customers who joined within the last six months.
SELECT * 
FROM Customer
WHERE JoinDate >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

-- Task B13: Calculate product age in days from the launch date.
SELECT ProdName, LaunchDate, DATEDIFF(CURDATE(), LaunchDate) AS AgeInDays
FROM Product;

-- Task B14: Calculate the date 90 days after each product launch.
SELECT ProdName, LaunchDate, DATE_ADD(LaunchDate, INTERVAL 90 DAY) AS NinetyDaysLater
FROM Product;

-- Task B15: Combine multiple scalar and date functions into one customer summary.
SELECT CONCAT('Hello ', UPPER(TRIM(CustName)), ', age ', TIMESTAMPDIFF(YEAR, DOB, CURDATE()), ', joined ', DATE_FORMAT(JoinDate, '%b %Y')) AS Summary
FROM Customer;


-- ==============================================================================
-- SECTION 3: EMPLOYEE SCALAR FUNCTIONS ASSESSMENT
-- ==============================================================================
CREATE DATABASE IF NOT EXISTS emp_lab;
USE emp_lab;
DROP TABLE IF EXISTS Employee;

CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    FullName VARCHAR(60) NOT NULL,
    Email VARCHAR(80),
    Phone VARCHAR(20),
    DOB DATE,
    HireDate DATE,
    Salary DECIMAL(10,2),
    City VARCHAR(30),
    JobTitle VARCHAR(40)
);

INSERT INTO Employee VALUES
(2001,' saif raza', 'saif@firm.com', '0300-1112233','1990-04-12','2018-09-01', 120000.50,'Lahore', 'Senior Engineer'),
(2002,'Iqra Imran', 'IQRA@FIRM.COM', '0301-4445566','1992-11-20','2019-03-15', 95000.00,'Karachi', 'Software Engineer'),
(2003,'HUZAIFA KHAN', 'huzaifa@firm.com', '0302-7778899','1993-08-05','2020-01-20', 85000.75,'Lahore', 'QA Engineer'),
(2004,'Laiba Ali', NULL, '0303-1234567','1991-02-14','2017-11-10', 110000.00,'Islamabad','Manager'),
(2005,'Aiman Yousaf', 'aiman@firm.com', NULL, '1995-06-30','2021-04-05', 70000.00,NULL, 'Accountant'),
(2006,'Rayan Abbas ', 'rayan@firm.com', '0305-3456789','1994-10-25','2022-08-30', 78000.40,'Karachi', 'Designer'),
(2007,'Anaya Anwar', 'anaya@FIRM.com', '0306-4567890','1989-12-09','2016-07-22', 125000.00,'Lahore', 'Director'),
(2008,'Fahad Hussain', 'fahad@firm.com', '0307-5678901','1996-03-18','2023-01-09', 60000.00,'Islamabad','HR Officer'),
(2009,'Iqra Yasin', 'iqra@firm.com', '0308-6789012','1990-07-22','2019-09-12', 90000.99,'Lahore', 'Analyst'),
(2010,'Danish Ahmed', 'danish@firm.com', '0309-7890123','1997-01-30','2024-02-18', 65000.00,'Karachi', 'Junior Developer');

-- Q1: Clean employee names and convert them to uppercase.
SELECT EmpID, FullName, UPPER(TRIM(FullName)) AS CleanedName 
FROM Employee;

-- Q2: Extract the username portion from employee emails.
SELECT FullName, SUBSTRING_INDEX(Email, '@', 1) AS Username 
FROM Employee 
WHERE Email IS NOT NULL;

-- Q3: Mask the sensitive portion of employee phone numbers.
SELECT FullName, CONCAT(LEFT(Phone, 4), '-XXX-XXXX') AS MaskedPhone 
FROM Employee 
WHERE Phone IS NOT NULL;

-- Q4: Generate standardized company email addresses from employee names.
SELECT FullName, CONCAT(REPLACE(LOWER(TRIM(FullName)), ' ', '.'), '@company.com') AS GeneratedEmail 
FROM Employee;

-- Q5: Calculate a 12.5% salary increase and round the result.
SELECT FullName, Salary, ROUND(Salary * 1.125, 2) AS NewSalary 
FROM Employee;

-- Q6: Group salary values into thousand-based rounded figures.
SELECT FullName, Salary, FLOOR(Salary / 1000) * 1000 AS RoundedSalary 
FROM Employee;

-- Q7: Calculate current employee age and years of service.
SELECT FullName, 
       TIMESTAMPDIFF(YEAR, DOB, CURDATE()) AS AgeYears, 
       TIMESTAMPDIFF(YEAR, HireDate, CURDATE()) AS YearsOfService 
FROM Employee;

-- Q8: Display hire dates in a readable format.
SELECT FullName, DATE_FORMAT(HireDate, '%d-%b-%Y') AS FormattedHireDate 
FROM Employee;

-- Q9: Filter employees hired from 2019 onward.
SELECT * 
FROM Employee 
WHERE YEAR(HireDate) >= 2019;

-- Q10: Build a complete employee profile using string, date, and NULL-handling functions.
SELECT CONCAT(
           UPPER(TRIM(FullName)), ' | ', 
           COALESCE(City, 'N/A'), ' | ', 
           JobTitle, ' | Joined: ', 
           DATE_FORMAT(HireDate, '%d-%b-%Y'), ' | Age: ', 
           TIMESTAMPDIFF(YEAR, DOB, CURDATE())
       ) AS Profile 
FROM Employee;