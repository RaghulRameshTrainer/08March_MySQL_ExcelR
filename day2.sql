CREATE DATABASE training;

USE training;

-- DROP DATABASE training;

-- DDL -- Data Definition Language (CREATE, ALTER , DROP, TRUNCATE)
-- DML -- Data Manupulation Language (INSERT, UPDATE, DELETE)
-- DCL -- Data Control Language ( GRANT , REVOKE)
-- TCL - Transaction Control language ( Commit, ROLLBACK, SAVEPOINT)
-- DQL  - Data Query Language (SELECT)

CREATE TABLE customer (
cust_id INT,
cust_name VARCHAR(50),
gender CHAR(1),
age INT,
city VARCHAR(50)
);

-- DATA TYPE
-- INT -- To store numbers (full value)
-- CHAR -- Character
-- VARCHAR -- Variable character
-- DOUBLE - to store the decimal value 100.55
-- DATE -> date type
-- BOOLEAN - True or False Or None

SELECT * FROM customer;
-- INSERT QUERY TO LOAD THE DATA
INSERT INTO customer VALUES(1000,'Raja','M',30,'Hyderabad');
SELECT * FROM customer;
INSERT INTO customer VALUES(1001,'Ranjitha','F',25,'Bangalore');
SELECT * FROM customer;
INSERT INTO customer(cust_id, cust_name, gender, city)  VALUES(1002,'Bala','M','Pune');
SELECT * FROM customer;
INSERT INTO customer(cust_id,cust_name,city,gender,age) VALUES(1003,'Siva','Mumbai','M',35);
SELECT * FROM customer;

-- SHOW TABLES;

-- UPDATE THE DATE
SET sql_safe_updates=0;
UPDATE customer SET age=40 WHERE cust_id=1002;

SELECT * FROM CUSTOMER;

UPDATE customer SET city='New Delhi' WHERE cust_id=1000;

UPDATE CUSTOMER SET age=36 , city='Chennai' WHERE cust_id=1003;

SELECT * FROM CUSTOMER;

UPDATE customer SET age=26, city='Hyderabad', cust_name='Ranjitha Raja' WHERE cust_id=1001;

SELECT * FROM CUSTOMER;

UPDATE customer SET age=100 WHERE gender='M';

SELECT * FROM CUSTOMER;

