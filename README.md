# Library-management-System
Library Management System built using Oracle SQL and PL/SQL with SQL*Loader for CSV data import. Includes staging tables, relational schema design, constraints, and queries for managing branch, books, members, employees,  issued_status and return_status records.

📚 Library Management System (Oracle SQL Project)

📌 Project Overview

This project implements a Library Management System database using Oracle SQL and PL/SQL.
It demonstrates database schema design, data loading using SQL*Loader, and implementation of relational constraints.

The system manages information about:

- Library branches
- Employees
- Books
- Members
- Book issued_status and return_status 

---

🛠 Technologies Used

- Oracle SQL
- PL/SQL
- SQL*Loader
- CSV Data Files
- GitHub

---

🗄 Database Design

The project uses a two-stage data loading approach:

1️⃣ Staging Tables

Staging tables are created with CHAR datatypes to load raw CSV data using SQL*Loader.

Example:

- "branch_test"
- "employees_test"
- "books_test"
- "members_test"
- "issued_status_test"
- "return_status_test"

2️⃣ Final Production Tables

After loading data into staging tables, cleaned and structured data is stored in production tables with appropriate datatypes.

Main tables include:

- "branch"
- "employees"
- "books"
- "members"
- "issued_status"
- "return_status"

---

🔗 Database Relationships

- Branch → Employees
- Employees → Issued Books
- Members → Issued Books
- Books → Issue & Return Records

Foreign keys are used to maintain referential integrity between related tables.

Example:

CONSTRAINT fk_emp_branch
FOREIGN KEY (branch_id)
REFERENCES branch(branch_id)

---

📂 Project Structure

Library-Management-System
│
├── schema.sql
├── plsql.sql
│
├── data
│   ├── branch.csv
│   ├── employees.csv
│   ├── books.csv
│   ├── members.csv
│   ├── issued_status.csv
│   └── return_status.csv
│
├── ctl
│   ├── branch.ctl
│   ├── employees.ctl
│   ├── books.ctl
│   ├── members.ctl
│   ├── issued_status.ctl
│   └── return_status.ctl
│
└── README.md

---

⚙️ Data Loading Using SQL*Loader

Data is imported into staging tables using SQL*Loader.

Example command:

sqlldr userid=<username>/<password> control=branch.ctl

After loading data into staging tables, it is inserted into final tables with appropriate datatype conversion.

---

📊 Example SQL Queries

List all books

SELECT * FROM books;

List employees with branch details

SELECT e.emp_name, b.branch_address
FROM employees e
JOIN branch b
ON e.branch_id = b.branch_id;

Find issued books

SELECT issued_member_id, issued_book_name
FROM issued_status;

---

🚀 Features Implemented

✔ Database schema design
✔ Staging tables for CSV import
✔ SQL*Loader data ingestion
✔ Primary key & foreign key constraints
✔ SQL queries for reporting
✔ PL/SQL logic implementation



📄 License

This project is for educational and learning purposes.
