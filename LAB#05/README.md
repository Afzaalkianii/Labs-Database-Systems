# Lab 05 – 2NF and 3NF Normalization

**Roll Number:** 2024-SE-40  
**Lab:** Database Systems – Normalization  
**Topic:** Second Normal Form (2NF) and Third Normal Form (3NF)

## 1. Overview

This lab demonstrates how database tables can be normalized from an unnormalized/1NF-style design into **2NF** and **3NF**.

The SQL file contains two main parts:

1. **Bookstore Database (`bookstore_norm`)**
   - Conversion to 2NF
   - Conversion to 3NF
   - Primary keys and foreign keys
   - Sample data
   - Verification queries

2. **Hospital Assessment (`hospital_norm`)**
   - Hospital data in 1NF
   - Conversion into 3NF tables
   - Primary keys and foreign keys
   - Sample data
   - Final verification query

---

## 2. Task 1 – 2NF Conversion

The bookstore database is divided into separate tables to remove partial dependencies.

### Tables Used

### `Order_2NF`
Stores order-related and customer information.

**Primary Key:**
- `OrderID`

**Important fields:**
- `OrderDate`
- `CustID`
- `CustName`
- `CustEmail`

### `Book_2NF`
Stores book information.

**Primary Key:**
- `BookID`

**Important fields:**
- `BookTitle`
- `Publisher`
- `UnitPrice`

### `OrderDetail_2NF`
Stores the relationship between orders and books.

**Composite Primary Key:**
- `OrderID`
- `BookID`

**Foreign Keys:**
- `OrderID` → `Order_2NF(OrderID)`
- `BookID` → `Book_2NF(BookID)`

The composite key uniquely identifies each book within an order.

---

## 3. Task 2 – 3NF Conversion

For 3NF, customer information is separated from order information to remove transitive dependencies.

### `Customer_3NF`

Stores customer information.

**Primary Key:**
- `CustID`

**Fields:**
- `CustName`
- `CustEmail`

### `Book_3NF`

Stores book information.

**Primary Key:**
- `BookID`

**Fields:**
- `BookTitle`
- `Publisher`
- `UnitPrice`

### `Order_3NF`

Stores order information.

**Primary Key:**
- `OrderID`

**Foreign Key:**
- `CustID` → `Customer_3NF(CustID)`

### `OrderDetail_3NF`

Stores the books included in each order.

**Composite Primary Key:**
- `OrderID`
- `BookID`

**Foreign Keys:**
- `OrderID` → `Order_3NF(OrderID)`
- `BookID` → `Book_3NF(BookID)`

---

## 4. Bookstore Verification

The SQL file includes verification queries to check:

- Order details with order information
- Book information connected with orders
- Customer total spending

These queries use `JOIN` and aggregation to verify that the normalized tables work correctly together.

---

## 5. Hospital Assessment

The second part of the lab demonstrates normalization using a hospital database.

### Hospital 1NF Table

The table `Hospital_1NF` contains:

- `VisitID`
- Patient information
- Doctor information
- Department/Specialty
- Diagnosis
- Fee

**Primary Key:**
- `VisitID`

This table represents the initial hospital visit data before the 3NF decomposition.

---

## 6. Hospital 3NF Tables

The hospital data is separated into four tables.

### `Departments`

Stores department/specialty information.

**Primary Key:**
- `Specialty`

### `Doctors`

Stores doctor information.

**Primary Key:**
- `DoctorID`

**Foreign Key:**
- `Specialty` → `Departments(Specialty)`

### `Patients`

Stores patient information.

**Primary Key:**
- `PatientID`

### `Visits`

Stores patient visits.

**Primary Key:**
- `VisitID`

**Foreign Keys:**
- `PatientID` → `Patients(PatientID)`
- `DoctorID` → `Doctors(DoctorID)`

This structure separates patients, doctors, departments, and visits into related tables.

---

## 7. Keys Summary

| Table | Primary Key | Foreign Key(s) |
|---|---|---|
| `Order_2NF` | `OrderID` | None |
| `Book_2NF` | `BookID` | None |
| `OrderDetail_2NF` | `OrderID, BookID` | `OrderID`, `BookID` |
| `Customer_3NF` | `CustID` | None |
| `Book_3NF` | `BookID` | None |
| `Order_3NF` | `OrderID` | `CustID` |
| `OrderDetail_3NF` | `OrderID, BookID` | `OrderID`, `BookID` |
| `Hospital_1NF` | `VisitID` | None |
| `Departments` | `Specialty` | None |
| `Doctors` | `DoctorID` | `Specialty` |
| `Patients` | `PatientID` | None |
| `Visits` | `VisitID` | `PatientID`, `DoctorID` |

---

## 8. How to Run

1. Open **MySQL Workbench** or another compatible MySQL environment.
2. Open the modified SQL file.
3. Run the SQL script from top to bottom.
4. Check the created databases and tables.
5. Run the included verification queries.
6. Check the final hospital `SELECT` query to verify the relationships.

---

## 9. Important Notes

- The SQL functionality and database relationships have been preserved.
- Sample person names, emails, and phone numbers were customized.
- Primary keys, foreign keys, composite keys, table relationships, queries, and normalization logic remain unchanged.
- The script demonstrates both **2NF** and **3NF** normalization.
- The hospital section demonstrates the separation of data into related 3NF tables.

## 10. Learning Outcome

After completing this lab, the student should understand:

- What 2NF and 3NF are.
- How partial dependencies are removed in 2NF.
- How transitive dependencies are removed in 3NF.
- How to use primary keys and foreign keys.
- How composite primary keys work.
- How normalized tables are connected using relationships.
- How `JOIN` queries can verify normalized database data.
