-----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
---------------------------STAGE TABLE FOR SQL LOADER----STAGE TABLE FOR BRANCH 
--- This table is used to load raw CSV data.
---Columns are defined as CHAR to avoid datatype conversion errors during SQL*LOADER import

create table BRANCH_TEST(
branch_id char(15),	
manager_id char(20),	
branch_address char(25),
contact_no char(20));

----------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
------------Final production table BRANCH
-----This table stores validate and structured data, used by the library management system.

create table BRANCH(
branch_id varchar2(15) primary key,	
manager_id varchar2(20),	
branch_address varchar2(25),
contact_no varchar2(20));

===============================================================================================
=============================================================================================
-----------------STAGE TABLE FOR SQL LOADER----STAGE TABLE FOR EMPLOYEES-----------------------
create table employees_test(
emp_id char(10)	,
emp_name char(25),	
position char(15),	
salary char(15),
branch_id char(10));
----------------------Final production table EMPLOYEES------------------------------------------
create table employees(
emp_id varchar2(10) primary key,	
emp_name varchar2(25),	
position varchar2(15),
salary number(15),
branch_id varchar2(10),
constraint fk_emp_branch
foreign key(branch_id)
references BRANCH(branch_id)
);
---------------------FOREIGN KEY LINKING EMPLOYEES TO BRANCH---------------------------------
alter table employees
add constraint branch_id_fk
foreign key(branch_id)
references branch(branch_id)

=============================================================================================
============================================================================================
--------------STAGE TABLE FOR SQL LOADER----STAGE TABLE FOR BOOKS-----------------
create table books_test(
isbn CHAR(50),
book_title CHAR(80),
category CHAR(30),
rental_price CHAR(10),
status CHAR(10),
author CHAR(30),
publisher CHAR(30)
);
--------------Final production table FOR BOOKS----------------------------------------------
create table books( 
isbn VARCHAR(50) PRIMARY KEY,
book_title VARCHAR(80),
category VARCHAR(30),
rental_price DECIMAL(10,2),
status VARCHAR(10),
author VARCHAR(30),
publisher VARCHAR(30));
================================================================================================
================================================================================================
------------STAGE TABLE FOR SQL LOADER----STAGE TABLE FOR MEMBERS-------------------------------
create table members_test(
member_id char(10),
member_name char(30),
member_address char(30),
reg_date char(20));
select * from members_TEST;
-----------Final production table FOR MEMBERS---------------------------------------------------
create table members
(
member_id VARCHAR(10) PRIMARY KEY,
member_name VARCHAR(30),
member_address VARCHAR(30),
reg_date varchar2(20)
);
select * from members;
================================================================================================
================================================================================================
------------STAGE TABLE FOR SQL LOADER----STAGE TABLE FOR ISSUED_STATUS-----------------------
CREATE TABLE issued_status_test
(
issued_id CHAR(10),
issued_member_id CHAR(30),
issued_book_name CHAR(80),
issued_date CHAR(20),
issued_book_isbn CHAR(50),
issued_emp_id CHAR(10) 
);
select * from issued_status_test
-------------Final production table FOR ISSUED_STATUS-------------------------------------------
CREATE TABLE issued_status
(
issued_id VARCHAR2(10) PRIMARY KEY,
issued_member_id VARCHAR2(30),
issued_book_name VARCHAR2(80),
issued_date VARCHAR2(20),
issued_book_isbn VARCHAR2(50),
issued_emp_id VARCHAR2(10) 
);
select * from issued_status

ALTER TABLE issued_status
ADD CONSTRAINT issued_status_member_fk
FOREIGN KEY (issued_member_id)
REFERENCES members(member_id);

ALTER TABLE issued_status
ADD CONSTRAINT issued_status_book_fk
FOREIGN KEY (issued_book_isbn)
REFERENCES books(isbn);

ALTER TABLE issued_status
ADD CONSTRAINT issued_status_emp_fk
FOREIGN KEY (issued_emp_id)
REFERENCES employees(emp_id);
================================================================================================
==============================================================================================
--------------STAGE TABLE FOR SQL LOADER----STAGE TABLE FOR RETURN_STATUS--------------------
CREATE TABLE return_status_test
(
return_id CHAR(10),
issued_id CHAR(30),
return_book_name CHAR(80),
return_date CHAR(20),
return_book_isbn CHAR(50)           
);
select * from return_status_test;
-------------FINAL PRODUCTION TABLE FOR RETURN_STATUS------------------------------------------
CREATE TABLE return_status
(
return_id VARCHAR(10) primary key,
issued_id VARCHAR(30),
return_book_name VARCHAR(80),
return_date DATE,
return_book_isbn VARCHAR(50)          
);
select * from  return_status

ALTER TABLE return_status
ADD CONSTRAINT return_status_book_fk
FOREIGN KEY (return_book_isbn)
REFERENCES books(isbn);


