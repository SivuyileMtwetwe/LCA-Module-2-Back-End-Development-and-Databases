--  Sample employee database 
--  See changelog table for details
--  Copyright (C) 2007,2008, MySQL AB
--  
--  Original data created by Fusheng Wang and Carlo Zaniolo
--  http://www.cs.aau.dk/TimeCenter/software.htm
--  http://www.cs.aau.dk/TimeCenter/Data/employeeTemporalDataSet.zip
-- 
--  Current schema by Giuseppe Maxia 
--  Data conversion from XML to relational by Patrick Crews
-- 
-- This work is licensed under the 
-- Creative Commons Attribution-Share Alike 3.0 Unported License. 
-- To view a copy of this license, visit 
-- http://creativecommons.org/licenses/by-sa/3.0/ or send a letter to 
-- Creative Commons, 171 Second Street, Suite 300, San Francisco, 
-- California, 94105, USA.
-- 
--  DISCLAIMER
--  To the best of our knowledge, this data is fabricated, and
--  it does not correspond to real people. 
--  Any similarity to existing people is purely coincidental.
-- 

DROP DATABASE IF EXISTS employee;
CREATE DATABASE IF NOT EXISTS employee;
USE employee;

SELECT 'CREATING DATABASE STRUCTURE' as 'INFO';

DROP TABLE IF EXISTS dept_emp,
                     dept_manager,
                     title,
                     salary, 
                     employee, 
                     department;

/*!50503 set default_storage_engine = InnoDB */;
/*!50503 select CONCAT('storage engine: ', @@default_storage_engine) as INFO */;

CREATE TABLE employee (
    emp_no      INT             NOT NULL,
    birth_date  DATE            NOT NULL,
    first_name  VARCHAR(14)     NOT NULL,
    last_name   VARCHAR(16)     NOT NULL,
    gender      ENUM ('M','F')  NOT NULL,    
    hire_date   DATE            NOT NULL,
    PRIMARY KEY (emp_no)
);

CREATE TABLE department (
    dept_no     CHAR(4)         NOT NULL,
    dept_name   VARCHAR(40)     NOT NULL,
    PRIMARY KEY (dept_no),
    UNIQUE  KEY (dept_name)
);

CREATE TABLE dept_manager (
   emp_no       INT             NOT NULL,
   dept_no      CHAR(4)         NOT NULL,
   from_date    DATE            NOT NULL,
   to_date      DATE            NOT NULL,
   FOREIGN KEY (emp_no)  REFERENCES employee (emp_no)    ON DELETE CASCADE,
   FOREIGN KEY (dept_no) REFERENCES department (dept_no) ON DELETE CASCADE,
   PRIMARY KEY (emp_no,dept_no)
); 

CREATE TABLE dept_emp (
    emp_no      INT             NOT NULL,
    dept_no     CHAR(4)         NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE            NOT NULL,
    FOREIGN KEY (emp_no)  REFERENCES employee   (emp_no)  ON DELETE CASCADE,
    FOREIGN KEY (dept_no) REFERENCES department (dept_no) ON DELETE CASCADE,
    PRIMARY KEY (emp_no,dept_no)
);

CREATE TABLE title (
    emp_no      INT             NOT NULL,
    title       VARCHAR(50)     NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE,
    FOREIGN KEY (emp_no) REFERENCES employee (emp_no) ON DELETE CASCADE,
    PRIMARY KEY (emp_no,title, from_date)
) 
; 

CREATE TABLE salary (
    emp_no      INT             NOT NULL,
    amount      INT             NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE            NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employee (emp_no) ON DELETE CASCADE,
    PRIMARY KEY (emp_no, from_date)
) 
; 

CREATE OR REPLACE VIEW dept_emp_latest_date AS
    SELECT emp_no, MAX(from_date) AS from_date, MAX(to_date) AS to_date
    FROM dept_emp
    GROUP BY emp_no;

# shows only the current department for each employee
CREATE OR REPLACE VIEW current_dept_emp AS
    SELECT l.emp_no, dept_no, l.from_date, l.to_date
    FROM dept_emp d
        INNER JOIN dept_emp_latest_date l
        ON d.emp_no=l.emp_no AND d.from_date=l.from_date AND l.to_date = d.to_date;

flush /*!50503 binary */ logs;

-- SELECT 'LOADING department' as 'INFO';
-- source load_department.sql ;
-- SELECT 'LOADING employee' as 'INFO';
-- source load_employee.sql ;
-- SELECT 'LOADING dept_emp' as 'INFO';
-- source load_dept_emp.sql ;
-- SELECT 'LOADING dept_manager' as 'INFO';
-- source load_dept_manager.sql ;
-- SELECT 'LOADING title' as 'INFO';
-- source load_title.sql ;
-- SELECT 'LOADING salary' as 'INFO';
-- source load_salary1.sql ;

-- source show_elapsed.sql ;


-- Q1

SELECT CONCAT(employee.first_name," ", employee.last_name) AS "Employees Name"
FROM employee
WHERE first_name LIKE "H%"
ORDER BY first_name;

-- Q2
SELECT employee.emp_no AS "Employee Number" , CONCAT(employee.first_name," ", employee.last_name) AS "Employees Name", employee.gender AS "Gender", employee.hire_date AS "Date of Hire"
FROM employee
WHERE first_name LIKE "H%"
ORDER BY first_name;

-- Q3
SELECT employee.first_name AS "First Name", employee.last_name AS "Last Name", salary.amount AS "Salary"
FROM employee INNER JOIN salary
ON employee.emp_no = salary.emp_no
ORDER BY first_name;

-- Q4
SELECT employee.emp_no AS "Employee Number" , CONCAT(employee.first_name," ", employee.last_name) AS "Employees Name", title.title AS "Position", salary.amount AS "Salary", (salary.amount+ salary.amount*0.05) AS "Increased Salary"
FROM employee INNER JOIN title
ON employee.emp_no = title.emp_no
INNER JOIN salary
ON title.emp_no = salary.emp_no
WHERE title.title = "Assistant Engineer";

-- Q5
-- CHECKING IF THE EMPLOYYE EXISTS
SELECT employee.emp_no AS "Employee Number" , CONCAT(employee.first_name," ", employee.last_name) AS "Employees Name", employee.gender AS "Gender", employee.hire_date AS "Date of Hire"
FROM employee
WHERE first_name LIKE "Yishay" AND employee.last_name LIKE "Tzvieli"
ORDER BY first_name;

-- DELETING

-- DELETE employee 
-- FROM employee INNER JOIN dept_manager 
-- ON employee.emp_no = dept_manager.emp_no
-- INNER JOIN dept_emp
-- ON dept_manager.emp_no = dept_emp.emp_no
-- INNER JOIN title
-- ON dept_emp.emp_no = title.emp_no
-- INNER JOIN salary
-- ON title.emp_no = salary.emp_no
-- WHERE emp_no LIKE 10043 OR (first_name LIKE "Yishay" AND employee.last_name LIKE "Tzvieli")

SET SQL_SAFE_UPDATES = 0;

DELETE 
FROM employee 
WHERE first_name LIKE "Yishay" AND employee.last_name LIKE "Tzvieli";

-- CORNFIMING DELETIOM
SELECT employee.emp_no AS "Employee Number" , CONCAT(employee.first_name," ", employee.last_name) AS "Employees Name", employee.gender AS "Gender", employee.hire_date AS "Date of Hire"
FROM employee
WHERE first_name LIKE "Yishay" AND employee.last_name LIKE "Tzvieli"
ORDER BY first_name;

-- Q6

INSERT INTO department (dept_no, dept_name)
VALUES ("d010", "Cybersecurity");


-- Q7 

-- SELECT CURRENT_DATE()

INSERT INTO employee 
VALUES (11001, "1982-05-25", "John", "Doe", "M", CURRENT_DATE());

SELECT employee.emp_no AS "Employee Number" , CONCAT(employee.first_name," ", employee.last_name) AS "Employees Name", employee.gender AS "Gender", employee.hire_date AS "Date of Hire"
FROM employee
WHERE emp_no LIKE 11001;


-- Q8 
INSERT INTO title
VALUES (11001, "Head of Cybersecurity", "2025-01-18", CURRENT_DATE());

-- Q9
INSERT INTO dept_manager
VALUES (11001, "d010", "2025-01-18", CURRENT_DATE());

-- Q10 
INSERT INTO salary
VALUES (11001, 85000 , "2025-01-18", CURRENT_DATE());