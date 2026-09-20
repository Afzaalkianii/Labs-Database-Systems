-- LAB 07: PATTERN MATCHING AND ADVANCED FILTERING

-- ==============================================================================
-- SECTION 1: EMPLOYEE DATABASE AND FILTERING TASKS
-- ==============================================================================
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
(101,'Hassan Riaz', 'M',120000,'2018-03-15','Lahore', 'Senior Engineer','Engineering'),
(102,'Areeba Shah', 'F', 95000,'2019-06-01','Lahore', 'Software Engineer','Engineering'),
(103,'Saad Ahmed', 'M', 85000,'2020-01-20','Karachi', 'Software Engineer','Engineering'),
(104,'Maham Ali', 'F',110000,'2017-11-10','Karachi', 'Marketing Lead', 'Marketing'),
(105,'Danish Khan', 'M', 70000,'2021-04-05','Karachi', 'Marketing Exec', 'Marketing'),
(106,'Eman Tariq', 'F', 90000,'2019-09-12','Islamabad','Accountant', 'Finance'),
(107,'Haris Malik', 'M', 78000,'2022-02-18','Islamabad','Accountant', 'Finance'),
(108,'Iqra Javed', 'F',115000,'2016-07-22','Lahore', 'Research Lead', 'Research'),
(109,'Rayan Abbas', 'M', 60000,'2023-01-09','Lahore', 'Research Analyst','Research'),
(110,'Hira Yousaf', 'F', 72000,'2022-08-30',NULL, 'Research Analyst','Research'),
(111,'Faizan Akhtar', 'M', 88000,'2020-05-14','Lahore', 'QA Engineer', 'Engineering'),
(112,'Laiba Malik', 'F',102000,'2018-12-01','Karachi', 'Sales Manager', 'Sales'),
(113,'Waleed Hussain', 'M', 65000,'2023-07-18','Islamabad','Sales Exec', 'Sales'),
(114,'Anaya Anwar', 'F', 80000,'2021-10-25','Lahore', 'HR Officer', 'HR'),
(115,'Kamran Shafi', 'M',125000,'2015-04-30',NULL, 'Director', 'Engineering');

-- Task B1: Select employees in the given salary range and sort by salary.
SELECT *
FROM Employee
WHERE Salary BETWEEN 75000 AND 100000
ORDER BY Salary ASC;

-- Task B2: Select employees hired during the specified period.
SELECT *
FROM Employee
WHERE HireDate BETWEEN '2020-01-01' AND '2022-12-31';

-- Task B3: Exclude employees whose salaries are in the specified range.
SELECT *
FROM Employee
WHERE Salary NOT BETWEEN 80000 AND 100000;

-- Task B4: Filter selected cities and apply multiple-column sorting.
SELECT *
FROM Employee
WHERE City IN ('Lahore', 'Islamabad')
ORDER BY City ASC, Salary DESC;

-- Task B5: Exclude the listed departments using NOT IN.
SELECT *
FROM Employee
WHERE DeptName NOT IN ('Engineering', 'Sales', 'HR');

-- Task B6: Find employee names beginning with the letter 'M'.
SELECT EmpName
FROM Employee
WHERE EmpName LIKE 'M%';

-- Task B7: Find names containing the letter 'a'.
SELECT *
FROM Employee
WHERE EmpName LIKE '%a%';

-- Task B8: Find names ending with the sequence 'an'.
SELECT *
FROM Employee
WHERE EmpName LIKE '%an';

-- Task B9: Find engineer job titles outside the Engineering department.
SELECT *
FROM Employee
WHERE JobTitle LIKE '%Engineer%' AND DeptName != 'Engineering';

-- Task B10: Find employees whose city information is missing.
SELECT EmpName
FROM Employee
WHERE City IS NULL;

-- Task B11: Show employees with available city information and sort by city.
SELECT *
FROM Employee
WHERE City IS NOT NULL
ORDER BY City ASC;

-- Task B12: Display the three highest-paid employees.
SELECT EmpName, Salary
FROM Employee
ORDER BY Salary DESC
LIMIT 3;

-- Task B13: Display the five most recently hired employees.
SELECT *
FROM Employee
ORDER BY HireDate DESC
LIMIT 5;

-- Task B14: Display the three employees with the lowest salaries.
SELECT EmpName, Salary
FROM Employee
ORDER BY Salary ASC
LIMIT 3;

-- Task B15: Sort employees by department and then by hire date.
SELECT *
FROM Employee
ORDER BY DeptName ASC, HireDate ASC;


-- ==============================================================================
-- SECTION 2: BOOKSTORE FILTERING ASSESSMENT
-- ==============================================================================
CREATE DATABASE IF NOT EXISTS bookstore_lab;
USE bookstore_lab;

DROP TABLE IF EXISTS Book;

CREATE TABLE Book (
    BookID       INT          PRIMARY KEY,
    Title        VARCHAR(80)  NOT NULL,
    Author       VARCHAR(60),
    Genre        VARCHAR(30),
    Price        DECIMAL(8,2),
    StockQty     INT,
    PublishedYear INT,
    Publisher    VARCHAR(40),
    Language     VARCHAR(20)
);

INSERT INTO Book VALUES
(1,  'Pride and Prejudice',       'Jane Austen',       'Fiction',   850,  12, 1813, 'Penguin',       'English'),
(2,  'Emma',                      'Jane Austen',       'Fiction',   900,   8, 1815, 'Penguin',       'English'),
(3,  'Things Fall Apart',         'Chinua Achebe',     'Fiction',  1100,   5, 1958, 'Heinemann',     'English'),
(4,  'Norwegian Wood',            'Haruki Murakami',   'Fiction',  1500,   3, 1987, 'Vintage',       'English'),
(5,  'Kafka on the Shore',        'Haruki Murakami',   'Fiction',  1700,   0, 2002, 'Vintage',       'English'),
(6,  'Ice-Candy-Man',             'Bapsi Sidhwa',      'Fiction',  1200,  15, 1988, 'Penguin',       'English'),
(7,  'The Reluctant Fundamentalist','Mohsin Hamid',    'Fiction',  1300,   9, 2007, 'Penguin',       'English'),
(8,  'Exit West',                 'Mohsin Hamid',      'Fiction',  1450,   6, 2017, 'Riverhead',     'English'),
(9,  'Atomic Habits',             'James Clear',       'Self-help',1800,  20, 2018, 'Avery',         'English'),
(10, 'The Power of Habit',        'Charles Duhigg',    'Self-help',1600,  11, 2012, 'Random House',  'English'),
(11, 'Sapiens',                   'Yuval Harari',      'History',  2200,   7, 2011, 'Harper',        'English'),
(12, 'Rich Dad Poor Dad',         'Robert Kiyosaki',   'Finance',  1100,  25, 1997, 'Plata',         'English'),
(13, 'Aab-e-Hayat',               'Ibn-e-Safi',        'Mystery',   650,  18, 1955, 'Asrar',         'Urdu'),
(14, 'Raja Gidh',                 'Bano Qudsia',       'Fiction',   900,  14, 1981, 'Sang-e-Meel',   'Urdu'),
(15, 'Mystery Title',             NULL,                'Mystery',   950,   4, 2020, NULL,            'English');

-- Q1: Find books priced above 1500 PKR.
SELECT Title, Price
FROM Book
WHERE Price > 1500;

-- Q2: Find books published from 1900 to 2000 and sort by year.
SELECT Title, PublishedYear
FROM Book
WHERE PublishedYear BETWEEN 1900 AND 2000
ORDER BY PublishedYear ASC;

-- Q3: Find selected genres with stock greater than 5.
SELECT *
FROM Book
WHERE Genre IN ('Fiction', 'Mystery')
  AND StockQty > 5;

-- Q4: Find titles containing the pattern 'the'.
SELECT Title, Author
FROM Book
WHERE Title LIKE '%the%';

-- Q5: Find titles beginning with 'A' or ending with 't'.
SELECT Title
FROM Book
WHERE Title LIKE 'A%'
   OR Title LIKE '%t';

-- Q6: Find books where the author information is missing.
SELECT Title
FROM Book
WHERE Author IS NULL;

-- Q7: Find books with zero stock or no publisher information.
SELECT *
FROM Book
WHERE StockQty = 0
   OR Publisher IS NULL;

-- Q8: Display the three most expensive books that are in stock.
SELECT *
FROM Book
WHERE StockQty > 0
ORDER BY Price DESC
LIMIT 3;

-- Q9: Display Urdu books in publication-year order.
SELECT *
FROM Book
WHERE Language = 'Urdu'
ORDER BY PublishedYear ASC;

-- Q10: Filter affordable older books and sort by genre and title.
SELECT *
FROM Book
WHERE PublishedYear < 2000
  AND Price < 1200
ORDER BY Genre ASC, Title ASC;