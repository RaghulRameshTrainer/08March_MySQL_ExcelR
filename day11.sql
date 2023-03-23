use training;

-- RANKING FUNCTION
-- row_number, rank, dense_rank, lead ,lag

SELECT * FROM employees;

SELECT Department, max(salary) 
FROM employees
GROUP BY Department;

-- ROW_NUMBER()
-- ROW_NUMBER() OVER(partition by Department order by salary DESC);

SELECT first, last, department, salary, rnk FROM (
SELECT first, last, department, salary, row_number() over(partition by Department order by Salary DESC ) as rnk
FROM employees ) tbl
WHERE rnk<=2;


SELECT first, last, department, salary, rnk FROM (
SELECT first, last, department, salary, row_number() over(partition by Department order by Salary ) as rnk
FROM employees ) tbl
WHERE rnk<=2;

SELECT first, last, department, salary, row_number() over(partition by Department order by Salary ) as rnk
FROM employees;


-- RANK

SELECT first, last, department, salary, rnk FROM (
SELECT first, last, department, salary, rank() over(partition by Department order by Salary DESC ) as rnk
FROM employees ) tbl
WHERE rnk<=2;


SELECT first, last, department, salary, rank() over(partition by Department order by Salary ) as rnk
FROM employees;


SELECT first, last, department, salary, dense_rank() over(partition by Department order by Salary ) as rnk
FROM employees;

SELECT first, last, department, salary, dense_rank() over(order by Salary ) as rnk
FROM employees;


CREATE TABLE mytable(
emp_name VARCHAR(100),
salary int
);


INSERT INTO mytable VALUES('Sridhar',20000),('Guna',15000),('Mohan',25000);

SELECT * FROM mytable;

-- LEAD   , LAG 

SELECT emp_name, salary, COALESCE(LEAD(salary) OVER(order by salary),0) as next_sal FROM mytable;


SELECT emp_name, salary, COALESCE(LAG(salary) OVER(order by salary),0) as next_sal FROM mytable;

SELECT emp_name, salary, next_sal, (next_sal - salary) as sal_diff FROM  (
SELECT emp_name, salary, COALESCE(LEAD(salary) OVER(order by salary),0) as next_sal FROM mytable ) tbl;



CREATE OR REPLACE PROCEDURE Welcome
AS
BEGIN
	dbms_output.put_line('Welcome to EXCELR LEARNING!');
END;
/

-- CALL THE PROCEDURE
	-- EXECUTE <procedure_name>

	-- BEGIN
	-- 	<procedure_name>;
	-- END;
	-- /

EXECUTE Welcome;

BEGIN
	Welcome;
END;
/


-- PARAMETER
	-- IN
	-- OUT
	-- IN OUT

DECLARE
	x INTEGER;
	y INTEGER;
	z INTEGER;
	PROCEDURE findMax(i IN INTEGER, j IN INTEGER , k OUT INTEGER)
	IS
	BEGIN
		IF i > j THEN
        	k := i;
		ELSE
            k := j;
		END IF;
	END;
	BEGIN
		x := 10;
		y := 20;
		findMax(x,y,z);
		DBMS_OUTPUT.PUT_LINE('Maximum of '|| x || ' and ' || y || ' is : '|| z);
	END;
	/



DECLARE
	a INTEGER;
	PROCEDURE squareIt(x IN OUT INTEGER)
	IS
	BEGIN
		x := x * x;
	END;
	BEGIN
		a := 10;
		squareIt(a);
		DBMS_OUTPUT.PUT_LINE('Square of 10 is : '|| a);
	END;
	/	
	
