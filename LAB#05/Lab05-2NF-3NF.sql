
-- LAB 05: 2NF AND 3NF NORMALIZATION 

CREATE DATABASE IF NOT EXISTS bookstore_norm;
USE bookstore_norm;

-- TASK 1: 2NF CONVERSION AND TABLE SEPARATION

DROP TABLE IF EXISTS OrderDetail_2NF, Order_2NF, Book_2NF;

CREATE TABLE Order_2NF (
    OrderID VARCHAR(10) PRIMARY KEY,
    OrderDate DATE,
    CustID VARCHAR(10),
    CustName VARCHAR(50),
    CustEmail VARCHAR(50)
);

CREATE TABLE Book_2NF (
    BookID VARCHAR(10) PRIMARY KEY,
    BookTitle VARCHAR(60),
    Publisher VARCHAR(50),
    UnitPrice DECIMAL(10,2)
);

CREATE TABLE OrderDetail_2NF (
    OrderID VARCHAR(10),
    BookID VARCHAR(10),
    Qty INT,
    PRIMARY KEY (OrderID, BookID),
    FOREIGN KEY (OrderID) REFERENCES Order_2NF(OrderID),
    FOREIGN KEY (BookID) REFERENCES Book_2NF(BookID)
);


-- TASK 2: 3NF CONVERSION AND REMOVING TRANSITIVE DEPENDENCIES

DROP TABLE IF EXISTS OrderDetail_3NF, Order_3NF, Book_3NF, Customer_3NF;

CREATE TABLE Customer_3NF (
    CustID VARCHAR(10) PRIMARY KEY,
    CustName VARCHAR(50),
    CustEmail VARCHAR(50)
);

CREATE TABLE Book_3NF (
    BookID VARCHAR(10) PRIMARY KEY,
    BookTitle VARCHAR(60),
    Publisher VARCHAR(50),
    UnitPrice DECIMAL(10,2)
);

CREATE TABLE Order_3NF (
    OrderID VARCHAR(10) PRIMARY KEY,
    OrderDate DATE,
    CustID VARCHAR(10),
    FOREIGN KEY (CustID) REFERENCES Customer_3NF(CustID)
);

CREATE TABLE OrderDetail_3NF (
    OrderID VARCHAR(10),
    BookID VARCHAR(10),
    Qty INT,
    PRIMARY KEY (OrderID, BookID),
    FOREIGN KEY (OrderID) REFERENCES Order_3NF(OrderID),
    FOREIGN KEY (BookID) REFERENCES Book_3NF(BookID)
);


INSERT INTO Customer_3NF VALUES ('C-11', 'Hamza', 'hamza@x.com'), ('C-12', 'Maham', 'maham@x.com');
INSERT INTO Book_3NF VALUES ('B-1', 'SQL Basics', 'Pearson', 1200), ('B-2', 'Python 101', 'OReilly', 1500), ('B-3', 'Networks', 'Pearson', 1800);
INSERT INTO Order_3NF VALUES ('O-501', '2026-04-02', 'C-11'), ('O-502', '2026-04-03', 'C-12'), ('O-503', '2026-04-05', 'C-11');
INSERT INTO OrderDetail_3NF VALUES ('O-501', 'B-1', 1), ('O-501', 'B-2', 2), ('O-502', 'B-1', 3), ('O-503', 'B-3', 1), ('O-503', 'B-2', 1);


-- TASK 3,4: VERIFICATION AND REFLECTION

SELECT o.OrderID, b.BookTitle, b.Publisher, b.UnitPrice, od.Qty
FROM OrderDetail_3NF od
JOIN Order_3NF o ON od.OrderID = o.OrderID
JOIN Book_3NF b ON od.BookID = b.BookID;


SELECT c.CustName, SUM(b.UnitPrice * od.Qty) AS TotalSpend
FROM Customer_3NF c
JOIN Order_3NF o ON c.CustID = o.CustID
JOIN OrderDetail_3NF od ON o.OrderID = od.OrderID
JOIN Book_3NF b ON od.BookID = b.BookID
GROUP BY c.CustID, c.CustName;


-- ==============================================================================
-- HOSPITAL ASSESSMENT PROBLEM (Complete 1NF to 3NF Solution)
-- ==============================================================================
CREATE DATABASE IF NOT EXISTS hospital_norm;
USE hospital_norm;

DROP TABLE IF EXISTS Hospital_1NF;

CREATE TABLE Hospital_1NF (
    VisitID VARCHAR(10) PRIMARY KEY,
    VisitDate DATE,
    PatientID VARCHAR(10),
    PatientName VARCHAR(50),
    PatientPhone VARCHAR(20),
    DoctorID VARCHAR(10),
    DoctorName VARCHAR(50),
    Specialty VARCHAR(50),
    DeptName VARCHAR(50),
    DeptHead VARCHAR(50),
    Diagnosis VARCHAR(50),
    Fee DECIMAL(10,2)
);

INSERT INTO Hospital_1NF VALUES
('V-9001', '2026-04-10', 'P-201', 'Saad', '0300-2223344', 'D-30', 'Dr. Farhan', 'Cardiology', 'Heart Care', 'Dr. Kamran', 'Hypertension', 2500),
('V-9002', '2026-04-10', 'P-202', 'Ayesha', '0301-5556677', 'D-31', 'Dr. Sana', 'Dermatology', 'Skin Clinic', 'Dr. Sana', 'Eczema', 2000),
('V-9003', '2026-04-11', 'P-201', 'Saad', '0300-2223344', 'D-31', 'Dr. Sana', 'Dermatology', 'Skin Clinic', 'Dr. Sana', 'Allergy', 2000),
('V-9004', '2026-04-12', 'P-203', 'Usman', '0302-8889900', 'D-30', 'Dr. Farhan', 'Cardiology', 'Heart Care', 'Dr. Kamran', 'Arrhythmia', 3000);

DROP TABLE IF EXISTS Visits, Patients, Doctors, Departments;

CREATE TABLE Departments (
    Specialty VARCHAR(100) PRIMARY KEY,
    DeptName  VARCHAR(100) NOT NULL,
    DeptHead  VARCHAR(100) NOT NULL
);

CREATE TABLE Doctors (
    DoctorID   VARCHAR(10) PRIMARY KEY,
    DoctorName VARCHAR(100) NOT NULL,
    Specialty  VARCHAR(100) NOT NULL,
    FOREIGN KEY (Specialty) REFERENCES Departments(Specialty)
);

CREATE TABLE Patients (
    PatientID    VARCHAR(10) PRIMARY KEY,
    PatientName  VARCHAR(100) NOT NULL,
    PatientPhone VARCHAR(20)  NOT NULL
);

CREATE TABLE Visits (
    VisitID   VARCHAR(10) PRIMARY KEY,
    VisitDate DATE NOT NULL,
    PatientID VARCHAR(10) NOT NULL,
    DoctorID  VARCHAR(10) NOT NULL,
    Diagnosis VARCHAR(200) NOT NULL,
    Fee       DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID)  REFERENCES Doctors(DoctorID)
);

-- Populating the 3NF Tables
INSERT INTO Departments VALUES ('Cardiology', 'Heart Care', 'Dr. Kamran'), ('Dermatology', 'Skin Clinic', 'Dr. Sana');
INSERT INTO Doctors VALUES ('D-30', 'Dr. Farhan', 'Cardiology'), ('D-31', 'Dr. Sana', 'Dermatology');
INSERT INTO Patients VALUES ('P-201', 'Saad', '0300-2223344'), ('P-202', 'Ayesha', '0301-5556677'), ('P-203', 'Usman', '0302-8889900');
INSERT INTO Visits VALUES 
('V-9001', '2026-04-10', 'P-201', 'D-30', 'Hypertension', 2500.00),
('V-9002', '2026-04-10', 'P-202', 'D-31', 'Eczema', 2000.00),
('V-9003', '2026-04-11', 'P-201', 'D-31', 'Allergy', 2000.00),
('V-9004', '2026-04-12', 'P-203', 'D-30', 'Arrhythmia', 3000.00);

SELECT v.VisitID, v.VisitDate, p.PatientID, p.PatientName, p.PatientPhone, 
       d.DoctorID, d.DoctorName, d.Specialty, dep.DeptName, dep.DeptHead, v.Diagnosis, v.Fee
FROM Visits v
JOIN Patients p ON v.PatientID = p.PatientID
JOIN Doctors d ON v.DoctorID = d.DoctorID
JOIN Departments dep ON d.Specialty = dep.Specialty
ORDER BY v.VisitID;

