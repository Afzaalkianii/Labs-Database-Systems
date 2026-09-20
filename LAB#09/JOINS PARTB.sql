
-- LAB 09: SQL JOINS – PART B


USE joins_lab;

-- ==============================================================================
-- SECTION 1: PART B JOIN TASKS 
-- ==============================================================================

-- Task B1: Displaying each employee together with their manager using a self join.
SELECT e.EmpName AS EmployeeName, m.EmpName AS ManagerName
FROM Employee e
LEFT JOIN Employee m ON e.ManagerID = m.EmpID;

-- Task B2: Comparing employee salaries with their managers' salaries.
SELECT e.EmpName AS EmployeeName, e.Salary AS EmployeeSalary, 
       m.EmpName AS ManagerName, m.Salary AS ManagerSalary
FROM Employee e
INNER JOIN Employee m ON e.ManagerID = m.EmpID
WHERE e.Salary > m.Salary;

-- Task B3: Finding employees and managers who belong to different departments.
SELECT e.EmpName, m.EmpName AS ManagerName, 
       ed.DeptName AS EmployeeDept, md.DeptName AS ManagerDept
FROM Employee e
INNER JOIN Employee m ON e.ManagerID = m.EmpID
INNER JOIN Department ed ON e.DeptID = ed.DeptID
INNER JOIN Department md ON m.DeptID = md.DeptID
WHERE e.DeptID != m.DeptID;

-- Task B4: Showing employee project assignments and weekly working hours.
SELECT e.EmpName, p.ProjectName, a.HoursPerWeek
FROM Employee e
INNER JOIN Assignment a ON e.EmpID = a.EmpID
INNER JOIN Project p ON a.ProjectID = p.ProjectID;

-- Task B5: Combining employee, assignment, project, and department information.
SELECT e.EmpName, p.ProjectName, d.DeptName
FROM Assignment a
INNER JOIN Employee e ON a.EmpID = e.EmpID
INNER JOIN Project p ON a.ProjectID = p.ProjectID
LEFT JOIN Department d ON p.DeptID = d.DeptID;

-- Task B6: Displaying employees assigned to the 'Mobile App' project.
SELECT e.EmpName, a.HoursPerWeek
FROM Employee e
INNER JOIN Assignment a ON e.EmpID = a.EmpID
INNER JOIN Project p ON a.ProjectID = p.ProjectID
WHERE p.ProjectName = 'Mobile App';

-- Task B7: Listing project assignments for employees located in Lahore.
SELECT e.EmpName, p.ProjectName, a.HoursPerWeek
FROM Employee e
LEFT JOIN Assignment a ON e.EmpID = a.EmpID
LEFT JOIN Project p ON a.ProjectID = p.ProjectID
WHERE e.City = 'Lahore';

-- Task B8: Finding employees working on projects of another department.
SELECT e.EmpName
FROM Employee e
INNER JOIN Assignment a ON e.EmpID = a.EmpID
INNER JOIN Project p ON a.ProjectID = p.ProjectID
WHERE e.DeptID != p.DeptID;

-- Task B9: Showing departments and projects that started during 2024.
SELECT d.DeptName, p.ProjectName
FROM Department d
LEFT JOIN Project p ON d.DeptID = p.DeptID 
    AND p.StartDate >= '2024-01-01' 
    AND p.StartDate <= '2024-12-31';

-- Task B10: Calculating each employee's total weekly project hours.
SELECT e.EmpName, COALESCE(SUM(a.HoursPerWeek), 0) AS TotalHours
FROM Employee e
LEFT JOIN Assignment a ON e.EmpID = a.EmpID
GROUP BY e.EmpID, e.EmpName;


-- ==============================================================================
-- SECTION 2: LIBRARY ASSESSMENT PROBLEM
-- ==============================================================================
CREATE DATABASE IF NOT EXISTS library_lab;
USE library_lab;
DROP TABLE IF EXISTS Loan, Book, Member, Author;

CREATE TABLE Author (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(60) NOT NULL,
    Country VARCHAR(30)
);

CREATE TABLE Book (
    BookID INT PRIMARY KEY,
    Title VARCHAR(80) NOT NULL,
    Genre VARCHAR(30),
    Price DECIMAL(8,2),
    AuthorID INT,
    PublishedYear INT,
    FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID)
);

CREATE TABLE Member (
    MemberID INT PRIMARY KEY,
    MemberName VARCHAR(60) NOT NULL,
    City VARCHAR(30),
    JoinDate DATE
);

CREATE TABLE Loan (
    LoanID INT PRIMARY KEY,
    MemberID INT,
    BookID INT,
    LoanDate DATE,
    ReturnDate DATE, 
    FOREIGN KEY (MemberID) REFERENCES Member(MemberID),
    FOREIGN KEY (BookID) REFERENCES Book(BookID)
);

INSERT INTO Author VALUES
(1,'Emily Austen', 'UK'), (2,'Kofi Achebe', 'Nigeria'), (3,'Kenji Murakami', 'Japan'),
(4,'Sadia Sidhwa', 'Pakistan'), (5,'Arman Hamid', 'Pakistan'), (6,'Unknown Author', NULL); 

INSERT INTO Book VALUES
(101,'Pride and Prejudice','Fiction', 850.00, 1, 1813), (102,'Emma', 'Fiction', 900.00, 1, 1815),
(103,'Things Fall Apart', 'Fiction', 1100.00, 2, 1958), (104,'Norwegian Wood', 'Fiction', 1500.00, 3, 1987),
(105,'Kafka on the Shore', 'Fiction', 1700.00, 3, 2002), (106,'Ice-Candy-Man', 'Fiction', 1200.00, 4, 1988),
(107,'The Reluctant Fundamentalist','Fiction',1300.00, 5, 2007), (108,'Exit West', 'Fiction', 1450.00, 5, 2017),
(109,'Mystery Title', 'Mystery', 950.00, NULL, 2020); 

INSERT INTO Member VALUES
(201,'Saif Raza', 'Lahore', '2023-01-15'), (202,'Iqra Imran', 'Karachi', '2023-03-20'),
(203,'Huzaifa Khan', 'Lahore', '2024-02-10'), (204,'Laiba Ali', 'Islamabad', '2022-09-05'),
(205,'Aiman Yousaf', NULL, '2024-05-01'); 

INSERT INTO Loan VALUES
(1, 201, 101, '2024-03-01', '2024-03-15'), (2, 201, 104, '2024-04-10', NULL),
(3, 202, 103, '2024-02-20', '2024-03-05'), (4, 202, 107, '2024-05-01', NULL),
(5, 203, 105, '2024-04-25', '2024-05-15'), (6, 204, 102, '2024-01-10', '2024-01-30'),
(7, 204, 108, '2024-06-01', NULL);

-- Q1: Displaying books together with their author information.
SELECT b.Title, a.AuthorName, a.Country
FROM Book b
INNER JOIN Author a ON b.AuthorID = a.AuthorID;

-- Q2: Showing all authors, including authors without books.
SELECT a.AuthorName, b.Title
FROM Author a
LEFT JOIN Book b ON a.AuthorID = b.AuthorID;

-- Q3: Finding members with no loan record.
SELECT m.MemberName
FROM Member m
LEFT JOIN Loan l ON m.MemberID = l.MemberID
WHERE l.LoanID IS NULL;

-- Q4: Combining loan, member, book, and author information.
SELECT l.LoanID, m.MemberName, b.Title, a.AuthorName
FROM Loan l
INNER JOIN Member m ON l.MemberID = m.MemberID
INNER JOIN Book b ON l.BookID = b.BookID
LEFT JOIN Author a ON b.AuthorID = a.AuthorID;

-- Q5: Finding currently active loans and their members.
SELECT b.Title, m.MemberName, m.City
FROM Loan l
INNER JOIN Book b ON l.BookID = b.BookID
INNER JOIN Member m ON l.MemberID = m.MemberID
WHERE l.ReturnDate IS NULL;

-- Q6: Displaying books written by Pakistani authors.
SELECT a.AuthorName, b.Title
FROM Author a
LEFT JOIN Book b ON a.AuthorID = b.AuthorID
WHERE a.Country = 'Pakistan';

-- Q7: Showing all books with their loan history, including never-loaned books.
SELECT b.Title, m.MemberName
FROM Book b
LEFT JOIN Loan l ON b.BookID = l.BookID
LEFT JOIN Member m ON l.MemberID = m.MemberID;

-- Q8: Finding authors whose books have no loan history.
SELECT DISTINCT a.AuthorName
FROM Author a
INNER JOIN Book b ON a.AuthorID = b.AuthorID
LEFT JOIN Loan l ON b.BookID = l.BookID
WHERE l.LoanID IS NULL;

-- Q9: Simulating a full outer join between authors and books.
SELECT a.AuthorName, b.Title
FROM Author a
LEFT JOIN Book b ON a.AuthorID = b.AuthorID
UNION
SELECT a.AuthorName, b.Title
FROM Author a
RIGHT JOIN Book b ON a.AuthorID = b.AuthorID;

-- Q10: Displaying loan history for books by Pakistani authors.
SELECT m.MemberName, b.Title, a.AuthorName
FROM Loan l
INNER JOIN Member m ON l.MemberID = m.MemberID
INNER JOIN Book b ON l.BookID = b.BookID
INNER JOIN Author a ON b.AuthorID = a.AuthorID
WHERE a.Country = 'Pakistan';