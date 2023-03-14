use training;

SELECT * FROM pk_table;
INSERT INTO pk_table VALUES(1001,'Chandra',33,'Hyderabad');
SELECT * FROM pk_table;

CREATE TABLE product(
id INT,
name VARCHAR(100) primary key
);

INSERT INTO product VALUES(1,'TV'),(2,'Mobile'),(3,'Laptop');
-- FOREIGN KEY 
CREATE TABLE orders(
ord_id INT primary key,
cust_id INT,
product_name VARCHAR(100),
amount decimal(20,2),
foreign key  (cust_id) references pk_table(cust_id),
foreign key  (product_name) references product(name)
);

INSERT INTO orders VALUES(1,1000,'TV',75000.99);
SELECT * FROM orders;
INSERT INTO orders VALUES(2,2000,'Mobile',50000); -- ERROR since cust_id 2000 is not present in parent table
INSERT INTO orders VALUES(2,1001,'Mobile',50000);
SELECT * FROM orders;
INSERT INTO orders VALUES(3,1001,'Desktop',50000);  -- ERROR desktop is not present in product table
INSERT INTO orders VALUES(3,1001,'Laptop',50000);
SELECT * FROM orders;

CREATE TABLE transaction_table(
ord_id INT primary key,
cust_id INT,
product_name VARCHAR(100),
amount double(20,2),
foreign key  (cust_id) references pk_table(cust_id),
foreign key  (product_name) references product(name)
);

INSERT INTO transaction_table VALUES(1,1000,'Mobile',66666.66);
SELECT * FROM transaction_table;

DROP TABLE transaction_table;

DELETE FROM pk_table WHERE cust_id=1001;

DELETE FROM orders WHERE cust_id=1001;

SELECT * FROM orders;
SELECT * FROM pk_table;

DROP TABLE ORDERS;

CREATE TABLE orders(
ord_id INT primary key,
cust_id INT,
product_name VARCHAR(100),
amount decimal(20,2),
foreign key  (cust_id) references pk_table(cust_id) ON DELETE CASCADE, -- ON UPDATE CASCADE,
foreign key  (product_name) references product(name)
);

INSERT INTO pk_table VALUES(1001,'Chandra',33,'Hyderabad');


INSERT INTO orders VALUES(1,1000,'TV',75000.99);
SELECT * FROM orders;
INSERT INTO orders VALUES(2,2000,'Mobile',50000); -- ERROR since cust_id 2000 is not present in parent table
INSERT INTO orders VALUES(2,1001,'Mobile',50000);
SELECT * FROM orders;
INSERT INTO orders VALUES(3,1001,'Desktop',50000);  -- ERROR desktop is not present in product table
INSERT INTO orders VALUES(3,1001,'Laptop',50000);
SELECT * FROM orders;


SELECT * FROM pk_table;
SELECT * FROM orders;

DELETE FROM pk_table WHERE cust_id=1001;


-- AUTO INCREMENT 

CREATE TABLE customer_table(
cust_id INT UNIQUE auto_increment,
cust_name VARCHAR(100),
gender CHAR(1),
city VARCHAR(100)
);

INSERT INTO customer_table(cust_name,gender,city) VALUES('Sandhya','F','Hyderabad');
SELECT * FROM customer_table;
INSERT INTO customer_table(cust_name,gender,city) VALUES('Sheik','M','Mumbai');
SELECT * FROM customer_table;
INSERT INTO customer_table(cust_name,gender,city) VALUES('Madhavan','M','Delhi');
SELECT * FROM customer_table;
INSERT INTO customer_table VALUES(100,'Bala','M','Chennai');
SELECT * FROM customer_table;
INSERT INTO customer_table(cust_name,gender,city) VALUES('Augustin','M','Delhi');
SELECT * FROM customer_table;
INSERT INTO customer_table(cust_id,cust_name,gender,city) VALUES(80,'palmani','M','chennai');
SELECT * FROM customer_table;
INSERT INTO customer_table(cust_name,gender,city) VALUES('Murugan','M','Delhi');
SELECT * FROM customer_table;





