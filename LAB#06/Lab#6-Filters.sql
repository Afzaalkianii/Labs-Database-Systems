-- LAB 06: COMPARISON AND LOGICAL OPERATORS - PART A

CREATE DATABASE IF NOT EXISTS filters_lab;
USE filters_lab;

DROP TABLE IF EXISTS Employee;

CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50) NOT NULL,
    Gender CHAR(1),
    Salary DECIMAL(10,2),
    HireDate DATE,
    City VARCHAR(30),
    JobTitle VARCHAR(40),
    DeptName VARCHAR(40)
);

INSERT INTO Employee VALUES
(101,'Hamza Qureshi', 'M',120000,'2018-03-15','Lahore', 'Senior Engineer','Engineering'),
(102,'Areeba Nawaz', 'F', 95000,'2019-06-01','Lahore', 'Software Engineer','Engineering'),
(103,'Saad Mirza', 'M', 85000,'2020-01-20','Karachi', 'Software Engineer','Engineering'),
(104,'Maham Sheikh', 'F',110000,'2017-11-10','Karachi', 'Marketing Lead', 'Marketing'),
(105,'Danish Malik', 'M', 70000,'2021-04-05','Karachi', 'Marketing Exec', 'Marketing'),
(106,'Eman Raza', 'F', 90000,'2019-09-12','Islamabad','Accountant', 'Finance'),
(107,'Haris Ahmed', 'M', 78000,'2022-02-18','Islamabad','Accountant', 'Finance'),
(108,'Hina Qureshi', 'F',115000,'2016-07-22','Lahore', 'Research Lead', 'Research'),
(109,'Faizan Khan', 'M', 60000,'2023-01-09','Lahore', 'Research Analyst','Research'),
(110,'Mehwish Raza', 'F', 72000,'2022-08-30',NULL, 'Research Analyst','Research'),
(111,'Talha Siddiqui', 'M', 88000,'2020-05-14','Lahore', 'QA Engineer', 'Engineering'),
(112,'Ayesha Malik', 'F',102000,'2018-12-01','Karachi', 'Sales Manager', 'Sales'),
(113,'Usman Shah', 'M', 65000,'2023-07-18','Islamabad','Sales Exec', 'Sales'),
(114,'Laiba Ahmed', 'F', 80000,'2021-10-25','Lahore', 'HR Officer', 'HR'),
(115,'Farhan Ali', 'M',125000,'2015-04-30',NULL, 'Director', 'Engineering');

-- ==============================================================================
-- LAB 06 TASKS - PART A
-- ==============================================================================

-- Task A1: Find employees whose salary is strictly greater than 90,000.
SELECT EmpID, EmpName, Salary
FROM Employee
WHERE Salary > 90000;

-- Task A2: Find employees whose salary is 75,000 or less.
SELECT EmpName, Salary
FROM Employee
WHERE Salary <= 75000;

-- Task A3: Find employees in Lahore with salary above 90,000.
SELECT *
FROM Employee
WHERE City = 'Lahore' AND Salary > 90000;

-- Task A4: Find employees working in Karachi or Islamabad.
SELECT EmpName, City
FROM Employee
WHERE City = 'Karachi' OR City = 'Islamabad';

-- Task A5: Find female employees who are not in the Engineering department.
SELECT *
FROM Employee
WHERE Gender = 'F' AND DeptName != 'Engineering';

-- Task A6: Find male employees with salary between 70,000 and 90,000.
SELECT *
FROM Employee
WHERE Gender = 'M' AND Salary >= 70000 AND Salary <= 90000;

-- Task A7: Find software engineers or employees earning above 100,000.
SELECT *
FROM Employee
WHERE JobTitle = 'Software Engineer' OR Salary > 100000;

-- Task A8: Exclude employees from Marketing and Sales departments.
SELECT *
FROM Employee
WHERE DeptName != 'Marketing' AND DeptName != 'Sales';