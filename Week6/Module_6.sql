
select <field list> from <table>; 

SELECT first_name, last_name, hire_date FROM employees;

SELECT first_name, last_name, birth_date FROM employees
WHERE last_name = "Sethi";

SELECT title FROM titles
WHERE title = 'S%' AND emp_no > 10016 ANDD emp_no < 10026;

SELECT title FROM titles
WHERE title LIKE 'S%' AND emp_no > 10016 AND emp_no < 10026;

SELECT dept_name FROM departments;

SELECT last_name FROM employees
ORDER BY last_name ASC
LIMIT 10;

