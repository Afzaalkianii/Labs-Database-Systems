# Lab 04 — First Normal Form (1NF)

## Overview

This SQL project demonstrates the analysis and implementation of **First Normal Form (1NF)** for bookstore order data.

The project first identifies the functional dependencies in the raw bookstore data and then creates a 1NF table in MySQL with atomic values and a composite primary key.

## Database

**Database Name:** `bookstore_norm`

## Task 1 — Functional Dependency (FD) Analysis

The SQL file identifies these functional dependencies:

- `OrderID -> OrderDate, CustID`
- `CustID -> CustName, CustEmail`
- `BookID -> BookTitle, Publisher, UnitPrice`
- `(OrderID, BookID) -> Qty`

These dependencies describe how order, customer, and book information is related in the original bookstore data.

## Task 2 — 1NF Implementation

The database is created using:

```sql
CREATE DATABASE IF NOT EXISTS bookstore_norm;
USE bookstore_norm;
```

The table `OrderBook_1NF` is created after removing any existing version of the table.

### Table: `OrderBook_1NF`

| Column | Data Type | Key / Purpose |
|---|---|---|
| `OrderID` | VARCHAR(10) | Part of Composite Primary Key |
| `BookID` | VARCHAR(10) | Part of Composite Primary Key |
| `OrderDate` | DATE | Order date |
| `CustID` | VARCHAR(10) | Customer ID |
| `CustName` | VARCHAR(50) | Customer name |
| `CustEmail` | VARCHAR(50) | Customer email |
| `BookTitle` | VARCHAR(60) | Book title |
| `Publisher` | VARCHAR(50) | Publisher name |
| `UnitPrice` | DECIMAL(10,2) | Book price |
| `Qty` | INT | Quantity ordered |

### Primary Key

The table uses a **Composite Primary Key**:

```text
(OrderID, BookID)
```

This means the combination of an order ID and book ID uniquely identifies each order-book record.

## 1NF Rules Demonstrated

The project demonstrates the main idea of 1NF:

- Values are atomic.
- Repeating groups are removed.
- Each column contains a single value.
- Each row can be uniquely identified.
- `(OrderID, BookID)` is used as the composite primary key.

## Sample Data

The SQL file inserts sample bookstore records for:

- Orders `O-501`, `O-502`, and `O-503`
- Books `B-1`, `B-2`, and `B-3`
- Customers `C-11` and `C-12`

The sample customer names have been customized while keeping the database structure and functionality unchanged.

## How to Run

### Requirements

- MySQL Server
- MySQL Workbench or another MySQL-compatible SQL editor

### Steps

1. Open MySQL Workbench.
2. Open the modified Lab 04 SQL file.
3. Run the SQL script.
4. The `bookstore_norm` database will be created.
5. The `OrderBook_1NF` table will be created.
6. The sample atomic bookstore data will be inserted.
7. You can use `SELECT * FROM OrderBook_1NF;` to view the inserted records.

## Project Structure

```text
bookstore_norm
│
└── OrderBook_1NF
    ├── OrderID
    ├── BookID
    ├── OrderDate
    ├── CustID
    ├── CustName
    ├── CustEmail
    ├── BookTitle
    ├── Publisher
    ├── UnitPrice
    └── Qty
```

## Key Information

**Primary Key:** `(OrderID, BookID)`

**Foreign Keys:** None are defined in this 1NF table.

**Unique Keys:** No separate UNIQUE constraint is defined.

**Database:** `bookstore_norm`

**Table:** `OrderBook_1NF`


## Author

**Lab 04 — 1NF Implementation**
