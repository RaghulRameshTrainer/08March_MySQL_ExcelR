use training;

SELECT * FROM customer_tbl;

DESC customer_tbl;

ALTER TABLE customer_tbl ADD COLUMN country VARCHAR(20) DEFAULT 'INDIA';

ALTER TABLE customer_tbl MODIFY COLUMN city VARCHAR(20);

ALTER TABLE customer_tbl DROP COLUMN cust_id;

SELECT * FROM transaction_tbl;

ALTER TABLE chk_table RENAME TO CHECK_TABLE;

ALTER TABLE transaction_tbl ADD COLUMN delivered CHAR(1);

SET sql_safe_updates=0;
UPDATE transaction_tbl SET delivered='Y' WHERE trans_id=1;

SELECT * FROM CUSTOMER_TBL WHERE cust_name LIKE '%a%' OR cust_name LIKE '%e%' OR cust_name LIKE '%i%' OR 
cust_name LIKE '%o%' OR cust_name LIKE '%i%' ;


SELECT * FROM customer_tbl;

SELECT cust_name, city, country , count(*)
FROM customer_tbl 
GROUP BY cust_name, city, country
HAVING count(*)>1;

CREATE TABLE temp_customer_tbl LIKE customer_tbl;

INSERT INTO temp_customer_tbl
SELECT DISTINCT * FROM customer_tbl;

SELECT * FROM temp_customer_tbl;
SELECT * FROM customer_tbl;

DROP TABLE customer_tbl;

RENAME TABLE temp_customer_tbl TO customer_tbl;

SELECT * FROM customer_tbl;

SELECT * FROM transaction_tbl;

SELECT t1.* FROM transaction_tbl t1
INNER JOIN transaction_tbl t2
WHERE t1.trans_id > t2.trans_id
AND t1.product_name = t2.product_name
AND t1.amount=t2.amount;


DELETE t1 FROM transaction_tbl t1
INNER JOIN transaction_tbl t2
WHERE t1.trans_id > t2.trans_id
AND t1.product_name = t2.product_name
AND t1.amount=t2.amount;


-- ========================================
CREATE TABLE employee(
    emp_id INTEGER,
    emp_name VARCHAR2(100),
    age INT,
    gender CHAR(1),
    city VARCHAR(20)
);

INSERT INTO employee VALUES(1,'Satya',30,'F','Chennai');
INSERT INTO employee VALUES(2,'Saraswathi',37,'F','Bangalore');
INSERT INTO employee VALUES(3,'Ranga',50,'M','Hyderabad');
INSERT INTO employee VALUES(4,'Raj',55,'M','Pondichery');
INSERT INTO employee VALUES(6,'Ramya',25,'F','Pune');

DECLARE
    e_id employee.emp_id%type;
	e_name employee.emp_name%type;
	e_age employee.age%type;
	e_gender employee.gender%type;
	e_city employee.city%type;
BEGIN
	SELECT emp_name,age,gender,city INTO e_name,e_age,e_gender, e_city FROM employee WHERE emp_id=e_id;
	DBMS_OUTPUT.PUT_LINE('Name: ' || e_name || ' Age: ' || e_age || ' Gender: '|| e_gender || ' City: ' || e_city);

	EXCEPTION
        WHEN no_data_found THEN
        	dbms_output.put_line('No records for cust_id: ' || e_id);
		WHEN others THEN
            dbms_output.put_line('An error occured');
END;
/
-- ===================================






QUESTIONS:
DML - INSERT, UPDATE, DELETE, SELECT
ALTER TABLE STATEMENTS
CONSTRAINTS
	UNIQUE, NOT NULL,PRIMARY KEY, FOREIGN KEY, CHECK , DEFAULT
JOIN
	INNER JOIN
    OUTER JOIN
		LEFT, RIGHT, FULL
	SELF JOIN

GROUP BY , HAVING, ORDER BY

DELETE, TRUNCATE, DROP

STRING FUNCTIONS - CANCAT, CONCAT_WS, SUBSTR, ....
PROCEDURE vs FUNCTION
TRIGGER