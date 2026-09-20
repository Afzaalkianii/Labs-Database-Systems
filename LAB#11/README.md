# README – Lab 11: Scalar Functions – Numeric & Date/Time (Part B) + Assessment

## 1. Overview

This lab focuses on **SQL Scalar Functions for Numeric and Date/Time operations**.

It contains two main parts:

1. **Part B:** Numeric and Date/Time scalar function tasks using `Customer` and `Product`.
2. **Employee Assessment:** Practical questions using string, numeric, and date/time functions on an `Employee` table.

**Roll Number:** 2024-SE_40

---

# 2. Database 1 – `scalar_lab_b`

The first section creates and uses the database:

```sql
scalar_lab_b
```

It contains two tables:

- `Customer`
- `Product`

---

## 3. Customer Table

The `Customer` table stores customer information.

| Column | Data Type | Description |
|---|---|---|
| CustID | INT | Unique customer ID |
| CustName | VARCHAR(60) | Customer name |
| Email | VARCHAR(80) | Customer email |
| City | VARCHAR(30) | Customer city |
| Phone | VARCHAR(20) | Customer phone number |
| JoinDate | DATE | Date the customer joined |
| DOB | DATE | Customer date of birth |

### Primary Key

- `CustID`

---

## 4. Product Table

The `Product` table stores product information.

| Column | Data Type | Description |
|---|---|---|
| ProdID | INT | Unique product ID |
| ProdName | VARCHAR(60) | Product name |
| Category | VARCHAR(30) | Product category |
| Price | DECIMAL(10,2) | Product price |
| StockQty | INT | Available stock |
| LaunchDate | DATE | Product launch date |

### Primary Key

- `ProdID`

---

# 5. Part B – Numeric & Date/Time Tasks

Part B contains **15 tasks (B1–B15)**.

### B1 – Discount Calculation

Calculates a 15% discount on product prices and rounds the result to two decimal places.

Functions:

```sql
ROUND()
```

---

### B2 – Sales Tax

Calculates 17% sales tax and the final price including tax.

Functions:

```sql
ROUND()
```

---

### B3 – Floor and Ceiling

Divides product prices by 1000 and demonstrates the lower and upper integer values.

Functions:

```sql
FLOOR()
CEIL()
```

---

### B4 – Price Rounding

Rounds product prices to the nearest hundred.

Function:

```sql
ROUND()
```

---

### B5 – Odd Product IDs

Uses mathematical remainder calculation to select products with odd-numbered IDs.

Function:

```sql
MOD()
```

---

### B6 – Date Components

Extracts the year, month name, and day name from customer joining dates.

Functions:

```sql
YEAR()
MONTHNAME()
DAYNAME()
```

---

### B7 – Date Formatting

Converts customer DOB values into a readable date format.

Function:

```sql
DATE_FORMAT()
```

---

### B8 – Current Age

Calculates the customer's current age using the current system date.

Functions:

```sql
TIMESTAMPDIFF()
CURDATE()
```

---

### B9 – Membership Duration

Calculates the number of days since each customer joined.

Function:

```sql
DATEDIFF()
```

---

### B10 – Joining Year Filter

Selects customers who joined during the year 2023.

Function:

```sql
YEAR()
```

---

### B11 – Fourth Quarter Products

Selects products launched during the fourth quarter.

Function:

```sql
QUARTER()
```

---

### B12 – Recent Signups

Finds customers who joined within the last six months relative to the current date.

Functions:

```sql
DATE_SUB()
CURDATE()
```

---

### B13 – Product Age

Calculates the number of days since each product was launched.

Function:

```sql
DATEDIFF()
```

---

### B14 – Future Launch Milestone

Calculates the date that occurs 90 days after each product's launch date.

Function:

```sql
DATE_ADD()
```

---

### B15 – Combined Summary

Creates a dynamic customer summary containing:

- Customer name
- Customer age
- Joining date

Functions used include:

```sql
CONCAT()
UPPER()
TRIM()
TIMESTAMPDIFF()
CURDATE()
DATE_FORMAT()
```

---

# 6. Database 2 – `emp_lab`

The assessment section creates and uses:

```sql
emp_lab
```

It contains the `Employee` table.

---

## 7. Employee Table

The `Employee` table stores employee information.

| Column | Data Type | Description |
|---|---|---|
| EmpID | INT | Unique employee ID |
| FullName | VARCHAR(60) | Employee name |
| Email | VARCHAR(80) | Employee email |
| Phone | VARCHAR(20) | Employee phone |
| DOB | DATE | Date of birth |
| HireDate | DATE | Hiring date |
| Salary | DECIMAL(10,2) | Employee salary |
| City | VARCHAR(30) | Employee city |
| JobTitle | VARCHAR(40) | Employee job title |

### Primary Key

- `EmpID`

---

# 8. Employee Assessment Questions

The assessment contains **10 questions (Q1–Q10)**.

### Q1 – Clean Employee Names

Uses `TRIM()` and `UPPER()` to clean and standardize employee names.

### Q2 – Extract Email Username

Uses `SUBSTRING_INDEX()` to extract the username portion of an email address.

### Q3 – Mask Phone Numbers

Uses `LEFT()` and `CONCAT()` to hide part of employee phone numbers.

### Q4 – Generate Corporate Emails

Uses string functions to generate standardized company email addresses.

Functions include:

```sql
LOWER()
TRIM()
REPLACE()
CONCAT()
```

### Q5 – Salary Increase

Calculates a 12.5% salary increase and rounds the result.

Function:

```sql
ROUND()
```

### Q6 – Salary Bands

Uses mathematical calculation to group salaries into cleaner thousand-based values.

Function:

```sql
FLOOR()
```

### Q7 – Age and Years of Service

Calculates current employee age and years of service.

Functions:

```sql
TIMESTAMPDIFF()
CURDATE()
```

### Q8 – Hire Date Formatting

Formats employee hiring dates into a readable format.

Function:

```sql
DATE_FORMAT()
```

### Q9 – Hire Year Filter

Selects employees hired in 2019 or later.

Function:

```sql
YEAR()
```

### Q10 – Employee Profile

Creates a combined employee profile containing:

- Name
- City
- Job title
- Hire date
- Age

Functions include:

```sql
CONCAT()
UPPER()
TRIM()
COALESCE()
DATE_FORMAT()
TIMESTAMPDIFF()
CURDATE()
```

---

# 9. Scalar Functions Practiced

This lab provides practice with:

### Numeric Functions

- `ROUND()`
- `FLOOR()`
- `CEIL()`
- `MOD()`

### Date/Time Functions

- `YEAR()`
- `MONTHNAME()`
- `DAYNAME()`
- `DATE_FORMAT()`
- `TIMESTAMPDIFF()`
- `CURDATE()`
- `DATEDIFF()`
- `QUARTER()`
- `DATE_SUB()`
- `DATE_ADD()`

### String Functions

- `TRIM()`
- `UPPER()`
- `LOWER()`
- `CONCAT()`
- `SUBSTRING_INDEX()`
- `LEFT()`
- `REPLACE()`

### Other SQL Functions

- `COALESCE()`

---

# 10. Key Concepts Learned

After completing this lab, students should be able to:

- Perform numeric calculations in SQL.
- Round values to specific decimal places.
- Use floor and ceiling operations.
- Find remainders using `MOD()`.
- Extract information from dates.
- Format dates into readable strings.
- Calculate ages and time differences.
- Add or subtract time intervals from dates.
- Filter records using date functions.
- Combine multiple scalar functions in one query.
- Clean and format text data.
- Handle NULL values using `COALESCE()`.

---

# 11. How to Run the SQL File

1. Open **MySQL Workbench**, phpMyAdmin, or another MySQL-compatible SQL environment.
2. Open:

```text
LAB 11_modified.sql
```

3. Execute the complete script.
4. The database `scalar_lab_b` will be created for Part B.
5. The `Customer` and `Product` tables will be created and populated.
6. Execute the B1–B15 queries.
7. The database `emp_lab` will then be created for the assessment.
8. The `Employee` table will be created and populated.
9. Execute Q1–Q10 to view the assessment results.

---

# 12. Lab Information

| Item | Details |
|---|---|
| Lab | 11 |
| Topic | Scalar Functions – Numeric & Date/Time (Part B) + Assessment |
| Roll Number | 2024-SE_40 |
| Database 1 | `scalar_lab_b` |
| Database 2 | `emp_lab` |
| Part B Tasks | B1–B15 |
| Assessment | Q1–Q10 |
| Main Tables | Customer, Product, Employee |

---

