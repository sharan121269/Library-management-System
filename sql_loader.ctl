1) Branch.ctl
-- ============================================
-- SQL*Loader Control File
-- Load data from branch.csv into BRANCH_TEST
-- ============================================

LOAD DATA
INFILE 'data/branch.csv'
INTO TABLE branch_test
APPEND
WHEN (branch_id != 'branch_id')
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
(
 branch_id,
 manager_id,
 branch_address,
 contact_no
)
-------------------------------------------------------------------------------------------------
--2)  Employees.ctl
-- ============================================
-- Load data from employees.csv into EMPLOYEES_TEST
-- ============================================

LOAD DATA 
INFILE "C:\myproject\employees.csv" 
INTO TABLE members_test 
WHEN (emp_id !='emp_id')
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
(
  emp_id ,
emp_name ,	
position ,	
salary ,
branch_id
)
---------------------------------------------------------------------------------------------
3) Books.ctl
-- ============================================
-- Load data from books.csv into BOOKS_TEST
-- ============================================

LOAD DATA 
INFILE "C:\myproject\books.csv" 
INTO TABLE books_test 
WHEN (isbn !='isbn')
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
(
  isbn,
book_title ,
category ,
rental_price,
status ,
author ,
publisher 
)
-------------------------------------------------------------------------------------------------
4) members.ctl

-- ============================================
-- Load data from members.csv into MEMBERS_TEST
-- ============================================
LOAD DATA 
INFILE "C:\myproject\members.csv" 
INTO TABLE members_test 
WHEN (member_id !='member_id')
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
(
 member_id ,
member_name ,
member_address,
reg_date
)
----------------------------------------------------------------------------------------------------------
5) Issued_status.ctl

-- ============================================
-- Load data from issued_status.csv
-- into ISSUED_STATUS_TEST
-- ============================================
LOAD DATA 
INFILE "C:\myproject\issued_status.csv" 
INTO TABLE  issued_status_test
WHEN (issued_id !='issued_id')
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
(
issued_id ,
issued_member_id ,
issued_book_name ,
issued_date ,
issued_book_isbn ,
issued_emp_id 
)
--------------------------------------------------------------------------------------------
6) Return_status.ctl

-- ============================================
-- Load data from return_status.csv
-- into RETURN_STATUS_TEST
-- ============================================
LOAD DATA 
INFILE  "C:\myproject\return_status.csv"
INTO TABLE  return_status_test
WHEN (return_id !='return_id')
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
(
return_id ,
issued_id ,
return_book_name ,
return_date,
return_book_isbn
           
)
