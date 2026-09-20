# Lab 07 – Pattern, Range, NULL and Sorting Queries

**Roll Number:** 2024-SE-40  
**Lab:** Database Systems  
**Topic:** SQL Pattern Matching, Range Filtering, NULL Handling, IN/NOT IN, Sorting and LIMIT

## 1. Overview

This lab contains two sections:

1. **Employee Database – Part B**
2. **Bookstore Assessment Problem**

The lab demonstrates different SQL filtering and sorting techniques, including:

- `BETWEEN`
- `NOT BETWEEN`
- `IN`
- `NOT IN`
- `LIKE`
- `IS NULL`
- `IS NOT NULL`
- `ORDER BY`
- `LIMIT`
- `AND`
- `OR`

---

## 2. Section 1 – Employee Database

### Database

`filters_lab`

### Table

`Employee`

### Primary Key

- `EmpID`

### Main Columns

| Column | Description |
|---|---|
| `EmpID` | Unique employee ID |
| `EmpName` | Employee name |
| `Gender` | Employee gender |
| `Salary` | Employee salary |
| `HireDate` | Hiring date |
| `City` | Employee city |
| `JobTitle` | Job title |
| `DeptName` | Department name |

---

## 3. Employee Tasks

### Task B1 – Salary Range

Uses `BETWEEN` to find employees whose salary is between 75,000 and 100,000 and sorts the result by salary.

### Task B2 – Hiring Date Range

Uses `BETWEEN` to find employees hired from 2020 to 2022.

### Task B3 – Excluding a Salary Range

Uses `NOT BETWEEN` to exclude salaries from 80,000 to 100,000.

### Task B4 – Specific Cities

Uses `IN` to find employees from Lahore or Islamabad.

The results are sorted by city and then salary.

### Task B5 – Excluding Departments

Uses `NOT IN` to exclude employees from Engineering, Sales, and HR.

### Task B6 – Names Starting With M

Uses:

```sql
LIKE 'M%'
```

This finds employee names beginning with the letter `M`.

### Task B7 – Names Containing A

Uses:

```sql
LIKE '%a%'
```

This finds names containing the letter `a`.

### Task B8 – Names Ending With "an"

Uses:

```sql
LIKE '%an'
```

This finds names ending with `an`.

### Task B9 – Engineers Outside Engineering Department

Uses `LIKE` and `!=` to find employees whose job title contains `Engineer` but whose department is not Engineering.

### Task B10 – Missing City Information

Uses:

```sql
IS NULL
```

to find employees whose city information is missing.

### Task B11 – Confirmed City Locations

Uses:

```sql
IS NOT NULL
```

to display employees who have a city value.

The results are sorted by city.

### Task B12 – Top 3 Highest Earners

Uses:

```sql
ORDER BY Salary DESC
LIMIT 3
```

to retrieve the three employees with the highest salaries.

### Task B13 – Five Most Recently Hired Employees

Sorts employees by hiring date in descending order and displays the first five records.

### Task B14 – Three Lowest Salaries

Sorts salaries in ascending order and displays the first three employees.

### Task B15 – Department and Seniority Sorting

Sorts employees first by department and then by hire date.

---

## 4. Section 2 – Bookstore Assessment

### Database

`bookstore_lab`

### Table

`Book`

### Primary Key

- `BookID`

### Main Columns

| Column | Description |
|---|---|
| `BookID` | Unique book ID |
| `Title` | Book title |
| `Author` | Author name |
| `Genre` | Book genre |
| `Price` | Book price |
| `StockQty` | Available stock |
| `PublishedYear` | Publication year |
| `Publisher` | Publisher name |
| `Language` | Book language |

---

## 5. Bookstore Tasks

### Q1 – Books Above 1500 PKR

Uses `>` to find books with a price greater than 1500 PKR.

### Q2 – 20th-Century Publications

Uses `BETWEEN` to find books published between 1900 and 2000 and sorts them by publication year.

### Q3 – Fiction or Mystery With Stock

Uses `IN` with `AND` to find Fiction or Mystery books having stock greater than 5.

### Q4 – Titles Containing "the"

Uses:

```sql
LIKE '%the%'
```

to find titles containing `the`.

### Q5 – Titles Starting With A or Ending With t

Uses `LIKE` with `OR` to find titles that either start with `A` or end with `t`.

### Q6 – Missing Author

Uses `IS NULL` to find books where the author information is missing.

### Q7 – Zero Stock or Missing Publisher

Uses `OR` to find books that either have zero stock or do not have publisher information.

### Q8 – Top 3 Most Expensive Available Books

Filters books with stock greater than zero, sorts them by price from highest to lowest, and displays the top three.

### Q9 – Urdu Books

Finds books whose language is Urdu and sorts them by publication year.

### Q10 – Affordable Classic Books

Finds books published before 2000 with a price below 1200 and sorts them by genre and title.

---

## 6. Important SQL Concepts

### `BETWEEN`
Checks whether a value falls within a specified range.

### `IN`
Checks whether a value matches one of several specified values.

### `NOT IN`
Excludes specified values.

### `LIKE`
Used for pattern matching.

Common patterns:

- `M%` → starts with M
- `%a%` → contains a
- `%an` → ends with an

### `IS NULL`
Finds missing values.

### `IS NOT NULL`
Finds values that are not missing.

### `ORDER BY`
Sorts query results.

- `ASC` → ascending
- `DESC` → descending

### `LIMIT`
Restricts the number of records returned.

---

## 7. How to Run

1. Open **MySQL Workbench** or another MySQL-compatible SQL editor.
2. Open `Lab07-Pattern_modified.sql`.
3. Run the complete SQL script.
4. The `filters_lab` database and Employee table will be created.
5. The employee queries can then be executed.
6. The script then creates the `bookstore_lab` database and Book table.
7. Run the bookstore queries to view their results.

---


## 9. Learning Outcomes

After completing this lab, the student should be able to:

- Use `BETWEEN` and `NOT BETWEEN`.
- Use `IN` and `NOT IN`.
- Perform pattern matching with `LIKE`.
- Handle missing values with `IS NULL` and `IS NOT NULL`.
- Sort results using `ORDER BY`.
- Limit results using `LIMIT`.
- Combine conditions using `AND` and `OR`.
- Write SQL queries for practical employee and bookstore data.
