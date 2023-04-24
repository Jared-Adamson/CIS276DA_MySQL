/*
Jared Adamson

In this assignment, we will practice creating and querying database views to make retrieving data more efficient.  We will create a database view,
 create a new user, assign the new user permission to the view, and then test it to confirm with works correctly.

Steps to Complete

Create a view named Dept_Manager_Info that queries the Dept_Manager table and joins in the employees and departments tables and includes employee 
first name, last name, and department name.
Create a new user named yogi
Assign yogi the appropriate privileges to query the view.
Login as Yogi and run the following commands, show tables;  select * from Dept_Manager_Info limit 5; 

*/

USE employees;

CREATE VIEW Dept_Manager_Info AS

SELECT employees.first_name, employees.last_name, dept_manager.dept_no

FROM dept_manager

JOIN employees ON dept_manager.emp_no = employees.emp_no;


CREATE USER Yogi@'localhost' IDENTIFIED BY '1234';

GRANT SELECT ON Dept_Manager_Info TO Yogi@'localhost';


"c:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe" -u Yogi -p

USE employees;

SHOW tables;

SELECT * FROM Dept_Manager_Info LIMIT 5;


