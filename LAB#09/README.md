# README – Lab 09: SQL Joins – Part B

## 1. Overview

This lab focuses on **SQL Joins – Part B**. It provides practical examples of different types of joins, including self joins, employee-manager relationships, department and project relationships, and aggregate queries.

The lab also contains a separate **Library Database** section that uses joins between authors, books, members, and loans.

The SQL functionality and database logic are preserved. Person/author/member names and comments were customized.

---

## 2. Databases Used

### Database 1: `joins_lab`

This database contains employee, department, project, and assignment information.

### Database 2: `library_lab`

This database contains library information such as authors, books, members, and loans.

---

# Part A – `joins_lab`

## 3. Main Tables

### Department
Stores department information.

- **Primary Key:** `DeptID`
- Important column: `DeptName`

### Employee
Stores employee information.

- **Primary Key:** `EmpID`
- **Foreign Key:** `DeptID` → `Department(DeptID)`
- **Self Foreign Key:** `ManagerID` → `Employee(EmpID)`

The self-reference allows an employee to be connected with their manager.

### Project
Stores project information.

- **Primary Key:** `ProjectID`
- **Foreign Key:** `DeptID` → `Department(DeptID)`

### Assignment
Connects employees with projects.

- **Composite Primary Key:** `(EmpID, ProjectID)`
- **Foreign Key:** `EmpID` → `Employee(EmpID)`
- **Foreign Key:** `ProjectID` → `Project(ProjectID)`

---

## 4. Tasks Covered in `joins_lab`

### B1 – Employee and Manager
Uses a **Self Join** to display employees together with their managers.

### B2 – Employees with Higher Salary
Compares employees with their managers to find salary relationships.

### B3 – Department and Employee
Uses joins to connect employees with their departments.

### B4 – Department and Project
Connects departments with their related projects.

### B5 – Employee and Project
Uses employee, project, and assignment information to show project assignments.

### B6 – Manager Relationships
Uses a self join to work with employee-manager relationships.

### B7 – Department/Project Information
Combines related tables to retrieve department and project details.

### B8 – Employee/Manager Comparison
Uses joins and conditions to compare employee information with manager information.

### B9 – Project Assignment Information
Uses assignment data to connect employees and projects.

### B10 – Assignment Hours
Uses joins and aggregation to work with employee project hours.

---

# Part B – `library_lab`

## 5. Library Tables

### Author
Stores author information.

- **Primary Key:** `AuthorID`

### Book
Stores book information.

- **Primary Key:** `BookID`
- **Foreign Key:** `AuthorID` → `Author(AuthorID)`

### Member
Stores library member information.

- **Primary Key:** `MemberID`

### Loan
Stores information about books borrowed by members.

- **Primary Key:** `LoanID`
- **Foreign Key:** `MemberID` → `Member(MemberID)`
- **Foreign Key:** `BookID` → `Book(BookID)`

---

## 6. Library Queries

### Q1 – Book and Author
Uses a join to display books together with their authors.

### Q2 – Library Members and Loans
Connects members with their borrowed books.

### Q3 – Books with Loan Information
Uses joins to retrieve book borrowing information.

### Q4 – Author and Book Information
Displays related author and book records.

### Q5 – Member Loan Details
Shows information about members and their loans.

### Q6 – Borrowed Book Information
Connects loan records with book information.

### Q7 – Author/Book/Loan Relationship
Combines multiple tables to retrieve related library information.

### Q8 – Member and Book Details
Uses joins to show which members are connected with which books.

### Q9 – Library Records with Conditions
Uses joins together with filtering conditions.

### Q10 – Combined Library Information
Combines multiple related tables to produce a complete result.

---

## 7. SQL Concepts Practiced

This lab provides practice with:

- `INNER JOIN`
- `LEFT JOIN`
- `RIGHT JOIN`
- `SELF JOIN`
- Joining multiple tables
- Foreign key relationships
- Composite primary keys
- `GROUP BY`
- Aggregate functions
- `SUM()`
- `COUNT()`
- `COALESCE()`
- Filtering joined results
- Employee-manager relationships
- Many-to-many relationships through an assignment table

---

## 8. Key Relationship Summary

| Table | Primary Key | Foreign Key / Relationship |
|---|---|---|
| Department | `DeptID` | Referenced by Employee and Project |
| Employee | `EmpID` | `DeptID`, `ManagerID` |
| Project | `ProjectID` | `DeptID` |
| Assignment | `(EmpID, ProjectID)` | `EmpID`, `ProjectID` |
| Author | `AuthorID` | Referenced by Book |
| Book | `BookID` | `AuthorID` |
| Member | `MemberID` | Referenced by Loan |
| Loan | `LoanID` | `MemberID`, `BookID` |

---

## 9. How to Run the SQL File

1. Open **MySQL Workbench**, phpMyAdmin, or another MySQL-compatible SQL environment.
2. Open the file:
   `JOINS PART B_modified.sql`
3. Run the database/table creation statements first.
4. Insert the sample data.
5. Execute the queries section by section.
6. Check the result tables returned by each query.

---

## 10. Learning Outcomes

After completing this lab, students should be able to:

- Understand how SQL joins connect related tables.
- Use `INNER JOIN` to retrieve matching records.
- Use `LEFT JOIN` and `RIGHT JOIN` for outer join operations.
- Perform a `SELF JOIN`.
- Understand employee-manager relationships.
- Join more than two tables.
- Work with many-to-many relationships.
- Use composite primary keys.
- Use aggregate functions with joined tables.
- Understand how foreign keys connect database tables.
- Retrieve useful information from a relational database.

---

## 11. Customization Note

The names of persons/authors/members and comments in the modified SQL file were customized for personalization.

**Important:** The database structure, keys, relationships, SQL functionality, and query logic were kept unchanged.
