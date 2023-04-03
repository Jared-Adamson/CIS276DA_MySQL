/*
Jared Adamson
Module 10

1. Create a new database named Module10.

2. Create the following 3 tables with the corresponding fields:

Table: Classes  Fields: Class_ID integer, Class_Name varchar(20), Class_Description varchar(50)
Table: Students Fields: Student_ID integer, Student_FName varchar(20), Student_LName varchar(30), State_Code char(2)
Table: States Fields: State_Code char(2), State_Name varchar(30)

2. Create a junction table named Grades with the following fields: Student_ID integer, Class_ID integer, Grade char(1). In the create table 
statement, create a foreign key relationship between the Student_ID fields in the Grades table and the Students table. In the create table 
statement, create a foreign key relationship between the Class_ID fields in the Grades table and the Classes table.

3. Use an alter statement to add a foreign key relationship to the State_Code field in the Students table so that it relates to the States table.

4. Write a select statement with a join to create a query that includes the following fields:

Student First Name
Student Last Name
Class Name
Class Grade
State Name
5. Update select statement created in question 4 to only return records where the grade is an A and the state name is Arizona, order by
 student last name.

*/

CREATE DATABASE Module10;

USE Module10;

CREATE TABLE Classes (
    Class_ID integer primary key,
    Class_Name varchar(20),
    Class_Description varchar(50)
);

CREATE TABLE Students (
    Student_ID integer primary key,
    Student_FName varchar(20),
    Student_LName varchar(30),
    State_Code char(2)
);

CREATE TABLE States (
    State_Code char(2) primary key, 
    State_Name varchar(30)
);

CREATE TABLE Grades (
    Student_ID integer, 
    Class_ID integer, 
    Grade char(1),
PRIMARY KEY (Student_ID, Class_ID),
FOREIGN KEY (Student_ID) REFERENCES Students(Student_ID),
FOREIGN KEY (Class_ID) REFERENCES Classes(Class_ID)
);

ALTER TABLE Students
ADD FOREIGN KEY(State_Code) REFERENCES States(State_Code);

SET foreign_key_checks = 0;

SELECT Students.Student_FName, Students.Student_LName, Classes.Class_Name, Grades.Grade, States.State_Name
FROM Grades
JOIN Classes on Grades.Class_ID = Classes.Class_ID
JOIN Students on Grades.Student_ID = Students.Student_ID
JOIN States on Students.State_Code = States.State_Code;

SELECT Students.Student_FName, Students.Student_LName, Classes.Class_Name, Grades.Grade, States.State_Name
FROM Grades
JOIN Classes on Grades.Class_ID = Classes.Class_ID
JOIN Students on Grades.Student_ID = Students.Student_ID
JOIN States on Students.State_Code = States.State_Code
WHERE Grades.Grade = 'A'
AND States.State_Name = 'Arizona';