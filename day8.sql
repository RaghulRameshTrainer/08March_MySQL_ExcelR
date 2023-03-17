use training;


SELECT * FROM employees LIMIT 5;

-- VIEW (is a virtual table gets created with a select query) IS A READY ONLY TABLE

CREATE VIEW employee_data AS
SELECT EmployeeId, first, last, department FROM employees WHERE status='Full Time';


SELECT * FROM employee_data WHERE department='Manufacturing';

-- INDEX:

CREATE INDEX emp_idx ON employees(EmployeeId);


SHOW INDEXES FROM employees;

SELECT * FROM employees WHERE EmployeeID=200;
SELECT * FROM employees WHERE Department='Manufacturing';

CREATE INDEX emp_dept ON employees(Department);

SELECT * FROM employees WHERE EmployeeID>200 AND Department='Account Management';

CREATE INDEX emp_id_dept ON employees(EmployeeID,Department);

-- TRANSACTION CONTROL LANGUAGE

start transaction;

SELECT * FROM customer_table;
SET sql_safe_updates=0;

UPDATE customer_table SET city='Hyderabad';

ROLLBACK;

START TRANSACTION;
SELECT * FROM customer_table;

UPDATE customer_table SET city='Bangalore' WHERE city='Mumbai';
COMMIT;


START TRANSACTION;

SAVEPOINT sp1;
SELECT * FROM transaction_tbl;
UPDATE transaction_tbl SET amount=100000 WHERE product_name='TV';

SAVEPOINT sp2;
SELECT * FROM transaction_tbl;
UPDATE transaction_tbl SET amount=3000 WHERE product_name='Microoven';

ROLLBACK TO savepoint sp2;

COMMIT;


--  LIKE

SELECT * FROM Employees WHERE Department='Manufacturing' LIMIT 10;

SELECT * FROM employees WHERE Department IN ('Manufacturing','Account Management') LIMIT 100;

SELECT * FROM employees WHERE Department NOT IN ('Manufacturing','Account Management') LIMIT 100;

SELECT * FROM Employees WHERE Department LIKE 'A%';

SELECT * FROM Employees WHERE First LIKE 'S%';

SELECT * FROM Employees WHERE First LIKE 'S%n';

SELECT * FROM Employees WHERE First LIKE '%i';

SELECT * FROM Employees WHERE First LIKE 'S_e%';

SELECT * FROM Employees WHERE First LIKE 'S__e%';

SELECT * FROM Employees WHERE first LIKE '%f%a%'





