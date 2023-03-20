-- MySQL FUNCTIONS
--    Numeric Functions
--     String Functions
--     Date Functions
--     Special Functions

-- NUMERIC FUNCTIONS:
-- COUNT
-- SUM
-- MIN
-- MAX
-- AVG
-- ROUND
-- PI
-- POW
-- SQRT

use training;
SELECT * FROM employees;

SELECT COUNT(*) FROM employees;

SELECT Department, count(*) FROM employees
GROUP BY 1
ORDER BY 2 DESC;

SELECT sum(salary) as total_salary FROM employees;

SELECT Department, sum(salary) as tot_sal FROM employees
GROUP BY 1
ORDER BY 2 DESC;


SELECT Department, sum(salary) as tot_sal, min(salary) as min_sal , max(salary) as max_sal, avg(salary) as avg_sal FROM employees
GROUP BY 1
ORDER BY 2 DESC;

SELECT Department, sum(salary) as tot_sal, min(salary) as min_sal , max(salary) as max_sal, avg(salary) as avg_sal FROM employees
GROUP BY 1
ORDER BY 1 DESC;

SELECT sum(salary) as tot_sal, min(salary) as min_sal , max(salary) as max_sal, avg(salary) as avg_sal FROM employees;

SELECT sum(salary) as tot_sal, min(salary) as min_sal , max(salary) as max_sal, 
avg(salary) as avg_sal, round(avg(salary),3) as avg_salary
FROM employees;


SELECT sum(salary) as tot_sal, min(salary) as min_sal , max(salary) as max_sal, 
avg(salary) as avg_sal, round(avg(salary),3) as avg_salary, truncate(avg(salary),3)  as average_sal
FROM employees;

SELECT PI();

SELECT POW(2,5);

SELECT SQRT(100);

SELECT SIN(0);

SELECT SIN(90);


-- STRING FUNCTION

-- CONCAT
-- CONCAT_WS
-- CHAR_LENGTH
-- LOWER
-- UPPER
-- REPLACE
-- REVERSE
-- SUBSTR

SELECT * FROM employees;

SELECT CONCAT(First,' ', Last) as fullname FROM employees;

SELECT CONCAT(First,' ', Last,' , ',Department,' , ',Status) as info FROM employees;

SELECT CONCAT_WS(' - ',First, Last,Department,Status) as info FROM employees;

SELECT CONCAT(First,' ', Last) as fullname,CONCAT(Department,' , ',Status) as info FROM employees;

-- SELECT CONCAT_WS('_',CONCAT(First,' ',Last) AS fullname , Department, Status)  FROM employees;

SELECT concat(First,' ',Last) as fullname , char_length(concat(First,' ',Last) )  as LEN FROM employees;
SELECT concat(First,Last) as fullname , char_length(concat(First,' ',Last) )  as LEN FROM employees;

SELECT LOWER(concat(First,' ',Last) ) as fullname  FROM employees;

SELECT LCASE(concat(First,' ',Last) ) as fullname  FROM employees;

SELECT UPPER(concat(First,' ',Last) ) as fullname  FROM employees;

SELECT UCASE(concat(First,' ',Last) ) as fullname  FROM employees;

SELECT First,Last,Department,Status FROM Employees;

SELECT First,Last,Department,REPLACE(REPLACE(Status,'Full Time', 'Permanent'),'Contract','Temporary')  FROM Employees;

SELECT 'ExcelR' , Reverse('ExcelR');

SELECT concat(First,',',Last) as fullname , Department, SUBSTR(Department, 1,3) FROM employees;
SELECT concat(First,',',Last) as fullname , Department, UPPER(SUBSTR(Department, 1,3)) FROM employees;

	SELECT concat(First,',',Last) as fullname , Department, SUBSTR(Department, -3,3) FROM employees;
    
SELECT SUBSTRING_INDEX('www.google.com','.',1) ;
SELECT SUBSTRING_INDEX('www.google.com','.',2) ;
SELECT SUBSTRING_INDEX('www.google.com','.',3) ;



-- DATE FUNCTIONS

-- %a-Abbreviated weekday name (Sun-Sat)
-- %W - weekday fullname (Sunday...Saturday)
-- %b-Abbreviated month name (Jan-Dec)
-- %M-Month name (January-December)
-- %c-Month, numeric (0-12)
-- %d-Day of month, numeric (00-31)
-- %D-Day of month with English suffix (0th, 1st, 2nd, 3rd)
-- %y-Year, numeric, two digits
-- %Y-Year, numeric, four digits
-- %H-Hour (00-23)
-- %h-Hour (01-12)
-- %I-Hour (01-12)
-- %p-AM or PM
-- %i-Minutes, numeric (00-59)
-- %j-Day of year (001-366)
-- %m-Month, numeric (00-12)
-- %r-Time, 12-hour (hh:mm:ss followed by AM or PM)
-- %S-Seconds (00-59)
-- %T-Time, 24-hour (hh:mm:ss)
-- %w-Day of the week (0=Sunday, 6=Saturday)


SELECT curdate();
SELECT Now();
SELECT current_timestamp();
SELECT current_time();


SELECT DAYNAME(current_timestamp()),MONTHNAME(current_timestamp()),YEAR(current_timestamp()),
 MONTH(current_timestamp()),DAY(current_timestamp()),
HOUR(current_timestamp()),MINUTE(current_timestamp()),SECOND(current_timestamp()),
DATE(current_timestamp()),TIME(current_timestamp());

SELECT QUARTER(current_timestamp()), QUARTER('2023-12-12'),(current_timestamp()),MONTHNAME(current_timestamp()),YEAR(current_timestamp()),
 MONTH(current_timestamp()),DAY(current_timestamp()),
HOUR(current_timestamp()),MINUTE(current_timestamp()),SECOND(current_timestamp()),
DATE(current_timestamp()),TIME(current_timestamp());

SELECT current_timestamp();

SELECT DATE_FORMAT(current_timestamp(),"%d-%c-%Y");

SELECT DATE_FORMAT(current_timestamp(),"%W, %d %M %Y , %h:%i %p");






