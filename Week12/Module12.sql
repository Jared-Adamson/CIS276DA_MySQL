/*
Jared Adamson

Create a stored procedure in the employees database named Get_Employee_Info that returns a list of all employees, their department name,
 and current title. (HINT: You will need to use a join in the stored procedure)
Duplicate the stored procedure you created in step 1, name it Get_X_Employees and add an input parameter. The input parameter should
 be an integer and be used in a limit clause to return a specific amount of records. The fields should be the same as step 1.

*/

DELIMITER ||
USE employees ||
CREATE PROCEDURE Get_Employee_Info ()
BEGIN
SELECT employees.emp_no, employees.first_name, employees.last_name, titles.title, dept_emp.dept_no, departments.dept_name
FROM employees
INNER JOIN titles ON employees.emp_no = titles.emp_no
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no;
END ||
DELIMITER ;




DELIMITER ||
USE employees ||
CREATE PROCEDURE Get_X_Employees (IN LIM_NO int)
BEGIN
SELECT employees.emp_no, employees.first_name, employees.last_name, titles.title, dept_emp.dept_no, departments.dept_name
FROM employees
INNER JOIN titles ON employees.emp_no = titles.emp_no
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
LIMIT LIM_NO;
END ||
DELIMITER ;
