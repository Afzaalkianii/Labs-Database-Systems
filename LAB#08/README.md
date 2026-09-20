# Lab 08 – SQL Joins

**Roll Number:** 2024-SE-40  
**Lab:** Database Systems  
**Topic:** INNER JOIN, LEFT JOIN, RIGHT JOIN and UNION

## 1. Overview

This lab demonstrates how SQL `JOIN` operations are used to combine related data from multiple tables.

The database used in this lab is:

- `joins_lab`

The main tables are:

- `Department`
- `Employee`
- `Project`
- `Assignment`

The lab also demonstrates how foreign keys connect these tables and how different JOIN operations retrieve related records.

---

## 2. Database Tables

### `Department`

Stores department information.

**Primary Key:**
- `DeptID`

**Columns:**
- `DeptID`
- `DeptName`
- `Location`
- `Budget`

### `Employee`

Stores employee information.

**Primary Key:**
- `EmpID`

**Foreign Keys:**
- `DeptID` → `Department(DeptID)`
- `ManagerID` → `Employee(EmpID)`

**Columns:**
- `EmpID`
- `EmpName`
- `Gender`
- `Salary`
- `HireDate`
- `City`
- `ManagerID`
- `DeptID`

### `Project`

Stores project information.

**Primary Key:**
- `ProjectID`

**Foreign Key:**
- `DeptID` → `Department(DeptID)`

**Columns:**
- `ProjectID`
- `ProjectName`
- `StartDate`
- `EndDate`
- `DeptID`

### `Assignment`

Connects employees with projects.

**Composite Primary Key:**
- `EmpID`
- `ProjectID`

**Foreign Keys:**
- `EmpID` → `Employee(EmpID)`
- `ProjectID` → `Project(ProjectID)`

**Column:**
- `HoursPerWeek`

---

## 3. Relationships

The main relationships are:

- A department can have multiple employees.
- An employee belongs to a department.
- An employee can manage other employees.
- A department can have multiple projects.
- Employees can be assigned to projects.
- `Assignment` connects employees and projects using a composite key.

---

## 4. Part A – JOIN Tasks

### Task A1 – Employee and Department Details

Uses an **INNER JOIN** to display employees together with their department name and location.

Only matching employee and department records are returned.

### Task A2 – All Employees With Department Details

Uses a **LEFT JOIN**.

All employees are displayed, even if a matching department record is not available.

### Task A3 – All Departments and Employees

Uses a **LEFT JOIN** starting from the Department table.

This keeps all departments, including departments that do not currently have employees.

### Task A4 – Projects and Departments

Uses a **LEFT JOIN** to display project information with department details.

Projects without an assigned department are also retained.

### Task A5 – Employees Without Project Assignments

Uses a `LEFT JOIN` between Employee and Assignment and checks:

```sql
WHERE a.ProjectID IS NULL
```

This identifies employees who currently have no project assignment.

### Task A6 – Projects Without Assigned Employees

Uses a `LEFT JOIN` between Project and Assignment and checks:

```sql
WHERE a.EmpID IS NULL
```

This identifies projects that have no assigned employees.

### Task A7 – Engineering Employees

Uses an **INNER JOIN** to find employees belonging to the Engineering department.

The results are sorted by salary in descending order.

### Task A8 – Employees Working in Lahore

Uses an **INNER JOIN** to find employees whose department location is Lahore.

### Task A9 – Employee Count Per Department

Uses a **LEFT JOIN** and:

```sql
COUNT(e.EmpID)
```

to calculate the number of employees in each department.

The query also includes departments with zero employees.

### Task A10 – Simulated Full Outer Join

MySQL does not directly use a `FULL OUTER JOIN` in this script.

Instead, the query combines:

- `LEFT JOIN`
- `RIGHT JOIN`
- `UNION`

This simulates a full outer join and includes matching and non-matching records from both sides.

---

## 5. JOIN Types Used

### INNER JOIN

Returns only records that have matching values in both tables.

### LEFT JOIN

Returns all records from the left table and matching records from the right table.

If no match exists, the right-side columns contain `NULL`.

### RIGHT JOIN

Returns all records from the right table and matching records from the left table.

If no match exists, the left-side columns contain `NULL`.

### UNION

Combines the results of two compatible `SELECT` queries and removes duplicate rows.

---

## 6. Keys Summary

| Table | Primary Key | Foreign Key(s) |
|---|---|---|
| `Department` | `DeptID` | None |
| `Employee` | `EmpID` | `DeptID`, `ManagerID` |
| `Project` | `ProjectID` | `DeptID` |
| `Assignment` | `EmpID, ProjectID` | `EmpID`, `ProjectID` |

---

## 7. How to Run

1. Open **MySQL Workbench** or another MySQL-compatible SQL editor.
2. Open `Joins_A_modified.sql`.
3. Run the complete script from top to bottom.
4. The `joins_lab` database will be created.
5. The four tables will be created with their keys and relationships.
6. Sample data will be inserted.
7. Run the Part A queries to view the JOIN results.

---

## 8. Important Notes

- The SQL functionality has been preserved.
- Sample employee names were customized.
- Comments and task descriptions were modified.
- Table structures, primary keys, foreign keys, relationships, JOIN types, conditions, `GROUP BY`, and `UNION` logic were kept functionally unchanged.

## 9. Learning Outcomes

After completing this lab, the student should be able to:

- Understand SQL JOIN operations.
- Use `INNER JOIN`.
- Use `LEFT JOIN`.
- Use `RIGHT JOIN`.
- Understand primary and foreign key relationships.
- Work with composite primary keys.
- Find records without matching relationships.
- Count related records using `COUNT()`.
- Combine query results using `UNION`.
- Understand how multiple related tables work together in a relational database.
