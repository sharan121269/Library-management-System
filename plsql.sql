-- =====================================================
-- ENABLE OUTPUT
-- =====================================================
SET SERVEROUTPUT ON;

-- =====================================================
-- LOAD DATA FROM STAGE TABLE: BRANCH_TEST → BRANCH
-- =====================================================

DECLARE
    CURSOR c1 IS
        SELECT branch_id, manager_id, branch_address, contact_no
        FROM branch_test;
BEGIN
    FOR rec IN c1 LOOP
        INSERT INTO branch
        (branch_id, manager_id, branch_address, contact_no)
        VALUES
        (rec.branch_id, rec.manager_id, rec.branch_address, rec.contact_no);
    END LOOP;

    COMMIT;
END;
/

-- =====================================================
-- LOAD DATA FROM STAGE TABLE: EMPLOYEES_TEST → EMPLOYEES
-- =====================================================

DECLARE
    CURSOR c2 IS
        SELECT emp_id, emp_name, position, salary, branch_id
        FROM employees_test;
BEGIN
    FOR rec IN c2 LOOP
        INSERT INTO employees
        (emp_id, emp_name, position, salary, branch_id)
        VALUES
        (rec.emp_id, rec.emp_name, rec.position, rec.salary, rec.branch_id);
    END LOOP;

    COMMIT;
END;
/

-- =====================================================
-- LOAD DATA FROM STAGE TABLE: BOOKS_TEST → BOOKS
-- =====================================================

DECLARE
    CURSOR c3 IS
        SELECT isbn, book_title, category, rental_price, status, author, publisher
        FROM books_test;
BEGIN
    FOR rec IN c3 LOOP
        INSERT INTO books
        (isbn, book_title, category, rental_price, status, author, publisher)
        VALUES
        (rec.isbn, rec.book_title, rec.category, rec.rental_price,
         rec.status, rec.author, rec.publisher);
    END LOOP;

    COMMIT;
END;
/

-- =====================================================
-- LOAD DATA FROM STAGE TABLE: MEMBERS_TEST → MEMBERS
-- =====================================================

DECLARE
    CURSOR c4 IS
        SELECT member_id, member_name, member_address, reg_date
        FROM members_test;
BEGIN
    FOR rec IN c4 LOOP
        INSERT INTO members
        (member_id, member_name, member_address, reg_date)
        VALUES
        (rec.member_id,
         rec.member_name,
         rec.member_address,
         TO_DATE(rec.reg_date,'MM-DD-YY'));
    END LOOP;

    COMMIT;
END;
/

-- =====================================================
-- LOAD DATA FROM STAGE TABLE: ISSUED_STATUS_TEST → ISSUED_STATUS
-- =====================================================

DECLARE
    CURSOR c5 IS
        SELECT issued_id,
               issued_member_id,
               issued_book_name,
               issued_date,
               issued_book_isbn,
               issued_emp_id
        FROM issued_status_test;
BEGIN
    FOR rec IN c5 LOOP
        INSERT INTO issued_status
        (issued_id, issued_member_id, issued_book_name,
         issued_date, issued_book_isbn, issued_emp_id)
        VALUES
        (rec.issued_id,
         rec.issued_member_id,
         rec.issued_book_name,
         rec.issued_date,
         rec.issued_book_isbn,
         rec.issued_emp_id);
    END LOOP;

    COMMIT;
END;
/

-- =====================================================
-- LOAD DATA FROM STAGE TABLE: RETURN_STATUS_TEST → RETURN_STATUS
-- =====================================================

DECLARE
    CURSOR c6 IS
        SELECT return_id,
               issued_id,
               return_book_name,
               return_date,
               return_book_isbn
        FROM return_status_test;
BEGIN
    FOR rec IN c6 LOOP
        INSERT INTO return_status
        (return_id,
         issued_id,
         return_book_name,
         return_date,
         return_book_isbn)
        VALUES
        (rec.return_id,
         rec.issued_id,
         rec.return_book_name,
         TO_DATE(rec.return_date,'YYYY-MM-DD'),
         rec.return_book_isbn);
    END LOOP;

    COMMIT;
END;
/