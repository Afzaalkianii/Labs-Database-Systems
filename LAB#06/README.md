# Lab 06 – Comparison & Logical Operators (Part A)

**Roll Number:** 2024-SE-40  
**Lab:** Database Systems  
**Topic:** Comparison and Logical Operators

## 1. Overview

This lab demonstrates the use of SQL **comparison operators** and **logical operators** with an Employee table.

The database used in this lab is:

- `filters_lab`

The main table is:

- `Employee`

The SQL file creates the database, creates the Employee table, inserts sample employee records, and then performs different filtering tasks using `WHERE` conditions.

---

## 2. Employee Table

The `Employee` table contains the following columns:

| Column | Description |
|---|---|
| `EmpID` | Unique employee ID |
| `EmpName` | Employee name |
| `Gender` | Employee gender |
| `Salary` | Employee salary |
| `HireDate` | Employee hiring date |
| `City` | Employee city |
| `JobTitle` | Employee job title |
| `DeptName` | Department name |

### Primary Key

The primary key is:

- `EmpID`

`EmpID` uniquely identifies each employee.

---

## 3. SQL Operators Used

The lab demonstrates these operators:

### Comparison Operators

- `>` — greater than
- `<=` — less than or equal to
- `=` — equal to
- `!=` — not equal to
- `>=` — greater than or equal to

### Logical Operators

- `AND` — all specified conditions must be true
- `OR` — at least one condition must be true

---

## 4. Lab Tasks

### Task A1 – Salary Greater Than 90,000

Finds employees whose salary is strictly greater than 90,000.

**Operator used:**
- `>`

### Task A2 – Salary 75,000 or Less

Finds employees earning 75,000 or less.

**Operator used:**
- `<=`

### Task A3 – Lahore Employees With Salary Above 90,000

Finds employees who:

- Work in Lahore
- Earn more than 90,000

**Operators used:**
- `=`
- `AND`
- `>`

### Task A4 – Karachi or Islamabad Employees

Finds employees located in either Karachi or Islamabad.

**Operator used:**
- `OR`

### Task A5 – Female Employees Outside Engineering

Finds female employees whose department is not Engineering.

**Operators used:**
- `=`
- `AND`
- `!=`

### Task A6 – Male Employees With Salary Between 70,000 and 90,000

Finds male employees whose salary is within the specified range.

**Operators used:**
- `=`
- `AND`
- `>=`
- `<=`

### Task A7 – Software Engineers or High Earners

Finds employees who are either:

- Software Engineers, or
- Earn more than 100,000

**Operator used:**
- `OR`

### Task A8 – Employees Outside Marketing and Sales

Excludes employees belonging to Marketing and Sales departments.

**Operators used:**
- `!=`
- `AND`

---

## 5. How to Run the SQL File

1. Open **MySQL Workbench** or another MySQL-compatible SQL editor.
2. Open the modified `Lab#6-Filters_modified.sql` file.
3. Run the complete script from top to bottom.
4. The database `filters_lab` will be created.
5. The `Employee` table will be created.
6. Employee sample data will be inserted.
7. Run the filtering queries to see their results.

---

## 6. Important Notes

- The SQL functionality has been preserved.
- Employee names were customized.
- Comments and task descriptions were changed.
- Table structure, columns, primary key, data values, filtering conditions, operators, and query logic were kept unchanged.
- The lab focuses on SQL `WHERE` filtering using comparison and logical operators.

## 7. Learning Outcomes

After completing this lab, the student should be able to:

- Create and use a database and table.
- Understand primary keys.
- Use the `WHERE` clause for filtering.
- Use comparison operators in SQL.
- Use `AND` and `OR` logical operators.
- Filter records using multiple conditions.
- Exclude records using the `!=` operator.
- Write basic SQL queries for retrieving specific records.
