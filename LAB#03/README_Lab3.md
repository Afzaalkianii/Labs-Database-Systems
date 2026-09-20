# University Database — Lab 03

## Overview

This project is **Lab 03**, a MySQL-based University Database system. It demonstrates database creation, table relationships, primary keys, foreign keys, unique constraints, data insertion, SQL queries, `ALTER TABLE`, `UPDATE`, `DELETE`, `TRUNCATE`, and database teardown.

**Roll Number:** 2024-SE-40

## Database Name

`UniversityDB`

## Main Tables

### 1. Departments
Stores university departments.

**Primary Key:** `dept_id`

**Unique Key:** `dept_name`

Fields:
- `dept_id`
- `dept_name`
- `location`

### 2. Students
Stores student information.

**Primary Key:** `student_id`

**Unique Keys:** `national_id`, `email`

**Foreign Key:** `dept_id` → `departments(dept_id)`

### 3. Courses
Stores course information.

**Primary Key:** `course_id`

**Unique Key:** `course_code`

**Foreign Key:** `dept_id` → `departments(dept_id)`

### 4. Professors
Stores professor information.

**Primary Key:** `professor_id`

**Unique Key:** `email`

**Additional Unique Constraint:** `name`

**Foreign Key:** `dept_id` → `departments(dept_id)`

### 5. Enrollments
Junction table connecting students and courses.

**Composite Primary Key:** `student_id`, `course_id`, `semester`

**Foreign Keys:**
- `student_id` → `students(student_id)`
- `course_id` → `courses(course_id)`

## Main SQL Queries

1. **Departmental Mapping** — Displays students with their departments.
2. **Master Enrollment Report** — Displays students, courses, semesters, and grades.
3. **Curriculum Filter** — Displays courses from the Computer Science department.

## ALTER TABLE Operations

The project demonstrates:
- Adding columns
- Modifying data types
- Renaming columns
- Adding unique constraints
- Adding a foreign key
- Dropping columns

## Data Modification Operations

- `UPDATE` — modifies existing records.
- `DELETE` — removes selected records.
- `TRUNCATE TABLE` — removes all records from the enrollments table.

## Database Teardown

The final section removes foreign-key dependencies, drops the tables, and finally drops the `UniversityDB` database.

## Key Relationships

```text
Departments
    │
    ├── Students
    ├── Courses
    └── Professors

Students ───< Enrollments >─── Courses

Courses ───> Professors
```

## How to Run

### Requirements
- MySQL Server
- MySQL Workbench or another MySQL-compatible SQL editor

### Steps

1. Open MySQL Workbench.
2. Open the Lab 03 SQL file.
3. Run the script.
4. The `UniversityDB` database and its tables will be created.
5. Sample data will be inserted.
6. The queries and table modification operations can be executed.

**Important:** The last part of the script drops the tables and database, so running the complete script will eventually delete the database.

## Sample Data

The project includes sample departments, students, courses, and professors. The person names have been customized while keeping the database structure, relationships, keys, and functionality unchanged.

## Author

**Lab 03 — University Database**  
**Roll Number:** 2024-SE-40
