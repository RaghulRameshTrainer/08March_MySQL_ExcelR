USE training;

SELECT * FROM CUSTOMER;

-- SELETE STATEMENT

SELECT * FROM customer;
SELECT cust_name, age FROM customer;
SELECT cust_name, age , city FROM customer;
SELECT city, cust_name, age FROM customer;
SELECT * FROM customer;

SELECT cust_name, age, gender, city FROM customer WHERE gender='M';
SELECT * FROM customer WHERE city='Hyderabad';
SELECT * FROM customer WHERE city!='Hyderabad';

SELECT * FROM customer WHERE city IN ('Chennai','Hyderabad');
SELECT * FROM customer WHERE city NOT IN ('Chennai','Hyderabad');

SELECT * FROM CUSTOMER;
SELECT * FROM customer WHERE age < 50;
SELECT * FROM customer WHERE age > 50;

SELECT * FROM customer WHERE age <= 26;
SELECT * FROM customer WHERE age >= 26;

SELECT * FROM customer WHERE age > 50 AND city IN ('Chennai','Hyderabad');

-- DELETE DATA

SELECT * FROM customer;

DELETE FROM customer WHERE cust_id=1002;

SELECT * FROM customer;

DELETE FROM customer WHERE cust_id>1000;

SELECT * FROM customer;


-- ----
-- 1. Create a table : country with the following column and corresponding data types
-- 		country_id		- keep the ID as 100, 101,102,103.....
-- 		name           -Name of the country like India, China, USA, Canada, Australia...
-- 		population     -  Number of people in the country`
-- 		
-- 2. Load 10 records into the table	
-- 3. Update the population to 1500000000 for country India
-- 4. Delete the record where country name is : USA
-- 5. Select the records		
-- 		a. WHERE country name is not India
-- 		b. WHERE the population is less than 1000000000
-- -----


CREATE TABLE country(
country_id INT,
name VARCHAR(20),
population LONG 
);

INSERT INTO country VALUES(100,'India',1300000000),(101,'Japan',150000000),(102,'Canada',300000000),
						(103,'USA',500000000),(104,'Australia',400000000),(105,'Singapore',100000000),
                        (106,'China',10000000000),(107,'Pakistan',200000000),(108,'Malasia',3300000000),
                        (109,'Nepal',15000000);
SELECT * FROM country;

UPDATE country SET population=1500000000 WHERE name='India';


DELETE FROM country WHERE name='USA';

SELECT * FROM country WHERE name != 'India';
SELECT * FROM country WHERE name = 'India';

SELECT * FROM country WHERE population < 1000000000;

-- -----------------------------------------

-- DELETE , TRUNCATE, DROP
-- CONSTRAINTS
SET sql_safe_updates=0;

-- CREATE DATABASE/TABLE INSERT INTO, UPDATE , SELECT , DELETE

-- DELETE 												TRUNCATE									DROP
-- DML statement											DDL 								DDL statement
-- CAN BE USED TO DELETE PARTICULAR RECORDS            USED TO DELETE WHOLE TABLE DATA      DROP REMOVES DATA AS WELL AS TABLE
				-- OR
-- 	WHOLE TABLE DATA


-- CAN BE ROLLED BACK								CANT ROLLBACK								CANT ROLLBACK
-- RUNS LITTLE SLOW									FASTER										QUICKER

SELECT * FROM country;

DELETE FROM country WHERE name IN ('China','Pakistan','Singapore');
SELECT * FROM country;

DELETE FROM country WHERE name='Canada';
SELECT * FROM country;

DELETE FROM country;   -- DELETES ENTIRE TABLE DATA SINCE THERE IS NO CONDITION SPECIFIED
SELECT * FROM country;


TRUNCATE  TABLE country ;
SELECT * FROM country;

DROP TABLE country;
SELECT * FROM country;

-- CONTRAINTS

-- UNIQUE
-- NOT NULL
-- CHECK
-- DEFAULT
-- PRIMARY KEY
-- FOREIGN KEY

-- UNIQUE CONSTRAINTS

CREATE TABLE unique_table(
cust_id INT UNIQUE,
cust_name VARCHAR(100),
gender CHAR(1),
age INT,
city VARCHAR(100)
);

INSERT INTO unique_table VALUES(1000,'Rajanand','M',37,'Hyderabad');

SELECT * FROM unique_table;
INSERT INTO unique_table VALUES(1000,'Satya','F',36,'Bangalore');  -- ERROR since 1000 is duplicate value
INSERT INTO unique_table VALUES(1001,'Satya','F',36,'Bangalore'); 
SELECT * FROM unique_table;
INSERT INTO unique_table VALUES(1002,'Satya','F',36,'Bangalore'); 
SELECT * FROM unique_table;
INSERT INTO unique_table VALUES(1002,'Satya','F',36,'Bangalore');   -- ERROR , 1002 is duplicate
INSERT INTO unique_table VALUES(1003,'Satya','F',36,'Bangalore'); 
SELECT * FROM unique_table;

INSERT INTO unique_table(cust_name,gender,age,city) VALUES('Madhan','M',38,'Chennai');
SELECT * FROM unique_table;
INSERT INTO unique_table(cust_name,gender,age,city) VALUES('Sheik','M',39,'Pune');
SELECT * FROM unique_table;





