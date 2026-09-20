# README – Lab 10: Scalar Functions – String Operations (Part A)

## 1. Overview

This lab focuses on **SQL Scalar Functions for String Operations**.

The purpose of the lab is to practice single-row string functions for formatting, extracting, cleaning, and processing textual data stored in the **Customer** and **Product** tables.

**Roll Number:** 2024-SE_40

---

## 2. Database Used

The SQL file creates and uses the following database:

```sql
scalar_lab
```

The script also removes the existing `Product` and `Customer` tables before creating them again.

---

## 3. Customer Table

The `Customer` table stores customer-related information.

### Columns

| Column | Data Type | Description |
|---|---|---|
| CustID | INT | Unique customer ID |
| CustName | VARCHAR(60) | Customer name |
| Email | VARCHAR(80) | Customer email |
| City | VARCHAR(30) | Customer city |
| Phone | VARCHAR(20) | Customer phone number |
| JoinDate | DATE | Customer joining date |
| DOB | DATE | Customer date of birth |

### Primary Key

- `CustID`

---

## 4. Product Table

The `Product` table stores product-related information.

### Columns

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

# 5. Part A – String Function Tasks

The SQL file contains **12 string-function tasks**.

### Task A1 – TRIM()

Removes unwanted leading and trailing spaces from customer names.

Function used:

```sql
TRIM()
```

---

### Task A2 – UPPER() and LOWER()

Converts customer names into uppercase and lowercase formats.

Functions used:

```sql
UPPER()
LOWER()
```

---

### Task A3 – CHAR_LENGTH()

Calculates the number of characters in a cleaned customer name.

Functions used:

```sql
TRIM()
CHAR_LENGTH()
```

---

### Task A4 – CONCAT()

Creates a personalized greeting message for each customer.

Function used:

```sql
CONCAT()
```

Example format:

```text
Dear Customer, welcome!
```

---

### Task A5 – SUBSTRING_INDEX()

Extracts the username part of an email address before the `@` symbol.

Function used:

```sql
SUBSTRING_INDEX()
```

Example:

```text
ali.khan@MAIL.com
```

Result:

```text
ali.khan
```

---

### Task A6 – Email Domain

Extracts the domain part of an email address after the `@` symbol.

Function used:

```sql
SUBSTRING_INDEX()
```

Example:

```text
ali.khan@MAIL.com
```

Result:

```text
MAIL.com
```

---

### Task A7 – LEFT()

Extracts the first three characters of a cleaned customer name.

Function used:

```sql
LEFT()
```

---

### Task A8 – Masking Phone Numbers

Displays only the first four characters of a phone number and masks the remaining part.

Functions used:

```sql
LEFT()
CONCAT()
```

Example format:

```text
0300-XXX-XXXX
```

---

### Task A9 – REPLACE()

Converts product names into URL-friendly names by replacing spaces with hyphens.

Function used:

```sql
REPLACE()
```

Example:

```text
Laptop Pro 15
```

becomes:

```text
Laptop-Pro-15
```

---

### Task A10 – LPAD()

Formats product IDs as a fixed five-digit sequence by adding zeros on the left.

Function used:

```sql
LPAD()
```

Example:

```text
101
```

becomes:

```text
00101
```

---

### Task A11 – LOCATE()

Finds the position where the word `Pro` starts inside a product name.

Functions used:

```sql
LOCATE()
LIKE
```

Only products containing `Pro` are selected.

---

### Task A12 – SUBSTRING()

Extracts the first name from the customer name by finding the first space and taking the text before it.

Functions used:

```sql
SUBSTRING()
TRIM()
LOCATE()
```

---

## 6. Scalar Functions Practiced

This lab provides practice with the following MySQL string functions:

- `TRIM()`
- `UPPER()`
- `LOWER()`
- `CHAR_LENGTH()`
- `CONCAT()`
- `SUBSTRING_INDEX()`
- `LEFT()`
- `REPLACE()`
- `LPAD()`
- `LOCATE()`
- `SUBSTRING()`

The lab also uses:

- `WHERE`
- `IS NOT NULL`
- `LIKE`

---

## 7. Key Concepts Learned

After completing this lab, students should understand how to:

- Remove unwanted spaces from text.
- Change text to uppercase and lowercase.
- Calculate string length.
- Combine strings together.
- Extract parts of an email address.
- Extract characters from the beginning of a string.
- Mask sensitive phone information.
- Replace characters in strings.
- Format numeric IDs using padding.
- Find the position of specific text.
- Extract a first name from a full name.
- Apply string functions in SQL queries.

---

## 8. How to Run the SQL File

1. Open **MySQL Workbench**, phpMyAdmin, or another MySQL-compatible SQL environment.
2. Open the file:
   `LAB 10 SCALAR_modified.sql`
3. Execute the complete script.
4. The database `scalar_lab` will be created if it does not already exist.
5. The `Customer` and `Product` tables will be created.
6. Sample data will be inserted.
7. Run the Part A queries to see the results of each scalar string function.

---

## 9. File Information

**Lab:** 10  
**Topic:** Scalar Functions – String Operations (Part A)  
**Roll Number:** 2024-SE_40  
**Database:** `scalar_lab`  
**Main Tables:** `Customer`, `Product`  
**Tasks:** A1–A12

---

## 10. Modification Note

The roll number was updated from `2024-SE_31` to `2024-SE_40`.

The SQL database structure, data operations, and query functionality were kept unchanged.
