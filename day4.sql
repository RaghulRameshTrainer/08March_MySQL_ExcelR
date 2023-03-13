use training;

-- NOT NULL

CREATE TABLE notnull_table(
cust_id INT NOT NULL,
cust_name VARCHAR(100),
gender CHAR(1),
age INT
);

INSERT INTO notnull_table VALUES(1000,'Gaston','M',30);
SELECT * FROM notnull_table;
INSERT INTO notnull_table VALUES(1000,'Stephanie','F',27);
SELECT * FROM notnull_table;
INSERT INTO notnull_table(cust_name, gender, age) VALUES('Alexander','M',33); -- ERROR since no value of cust_id
INSERT INTO notnull_table(cust_id,cust_name, gender, age) VALUES(1001,'Alexander','M',33); 
SELECT * FROM notnull_table;



-- UNIQUE as well NOT NULL
CREATE TABLE unique_nn_tbl(
cust_id INT UNIQUE NOT NULL,
cust_name VARCHAR(100) UNIQUE,
gender CHAR(1) NOT NULL,
age INT NOT NULL
);

INSERT INTO unique_nn_tbl VALUE(1000,'Gaston','M',30);
SELECT * FROM unique_nn_tbl;
INSERT INTO unique_nn_tbl VALUE(1001,'Jorge','M',30),
								(1002,'Guna','M',38);


-- CHECK 
CREATE TABLE chk_table(
cust_id INT UNIQUE NOT NULL,
cust_name VARCHAR(100),
age INT CHECK(age BETWEEN 20 AND 100),
country VARCHAR(20) CHECK(country IN ('India','USA','Canada','Australia','Japan'))
);


INSERT INTO chk_table VALUES(1000,'Pankaj',40,'India');
SELECT * FROM chk_table;
INSERT INTO chk_table VALUES(1001,'Pankaj',140,'India');  -- ERROR since age>100
INSERT INTO chk_table VALUES(1001,'Pankaj',10,'India');   -- ERROR since age>20
INSERT INTO chk_table VALUES(1001,'Pankaj',40,'Rushya');  -- ERROR due to country name
INSERT INTO chk_table VALUES(1001,'Amol',50,'Japan'); 
SELECT * FROM chk_table;

-- DEFAULT
CREATE TABLE default_table(
cust_id INT ,
cust_name VARCHAR(100),
age INT,
city VARCHAR(100) DEFAULT 'Hyderabad'
);

INSERT INTO default_table VALUES(1000,'Nataraj',45,'Bangalore');
SELECT * FROM default_table;
INSERT INTO default_table VALUES(1001,'Apurba',45,'Pune');
SELECT * FROM default_table;
INSERT INTO default_table(cust_id, cust_name,age) VALUES(1002,'Ankit',45);
SELECT * FROM default_table;

-- PRIMARY KEY  (UNIQUE + NOT NULL)

CREATE TABLE pk_table(
cust_id INT PRIMARY KEY,   -- SIMPLE PRIMARY KEY COLUMN
cust_name VARCHAR(100),
age INT,
city VARCHAR(100)
);


INSERT INTO pk_table VALUES(1000,'Nataraj',45,'Bangalore');
SELECT * FROM pk_table;
INSERT INTO pk_table VALUES(1000,'Apurba',45,'Pune');  -- ERROR due to the duplicate value : 1000
SELECT * FROM pk_table;
INSERT INTO pk_table(cust_name,age,city) VALUES('Ankit',45,'Pune');  -- ERROR due to null value to cust_id
SELECT * FROM pk_table;

CREATE TABLE comp_pk_table(
cust_id INT,
cust_name VARCHAR(100),
age INT,
city VARCHAR(100),
primary key(cust_id, cust_name)  --  Composite primary key
);

INSERT INTO comp_pk_table VALUES(1000,'Nataraj',45,'Bangalore');
SELECT * FROM comp_pk_table;
INSERT INTO comp_pk_table VALUES(1000,'Apurba',45,'Pune');  
SELECT * FROM comp_pk_table;
INSERT INTO comp_pk_table VALUES(1001,'Apurba',45,'Pune');  
SELECT * FROM comp_pk_table;
INSERT INTO comp_pk_table VALUES(1001,'Apurba',45,'Pune');   -- ERROR due to duplicatio 1001-Apruba

INSERT INTO comp_pk_table(cust_name,age,city) VALUES('Ankit',45,'Pune');  -- ERROR due to null value to cust_id
SELECT * FROM comp_pk_table;

-- FOREIGN KEY CONSTAINT

PLACE AN ORDER IN AMAZON.COM