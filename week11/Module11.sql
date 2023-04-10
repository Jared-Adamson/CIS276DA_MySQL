/*
Jared Adamson
Module 11

In this assignment, we will practice controlling access to our database by creating users and assigning them the appropriate privileges in the database. We will create some new users and role on the system and then assign the specified permissions to each of them.

Steps to Complete

1. Create 5 users: Aang, Katara, Sokka, Appa, Zuko with localhost as the hostname and 1234 as the password
2. Grant Aang full permissions over all databases
3. Grant Katara all permissions Employees sample database but not other databases on the system
4. Grant Sokka permission to query the employees table in the employees database and nothing else
5. Create a role named Fire_Nation and add Zuko to the role
6. Grant the Fire_Nation role permissions to query the employees database and nothing else
*/

Create user Aang@'localhost' IDENTIFIED BY '1234';

Create user Katara@'localhost' IDENTIFIED BY '1234';

Create user Sokka@'localhost' IDENTIFIED BY '1234';

Create user Appa@'localhost' IDENTIFIED BY '1234';

Create user Zuko@'localhost' IDENTIFIED BY '1234';

GRANT ALL PRIVILEGES ON *.* TO 'Aang'@'localhost';

USE employees;

GRANT ALL PRIVILEGES ON employees TO 'Katara'@'localhost';

SHOW tables;

GRANT SELECT ON employees.employees TO 'Sokka'@'localhost';

CREATE ROLE Fire_Nation;

GRANT 'Fire_Nation' TO 'Zuko'@'localhost';

GRANT SELECT ON employees TO Fire_Nation;