-- Create the database for global diversity data
CREATE DATABASE global_diversity;

-- Select the newly created database for subsequent operations
USE global_diversity;


-- Create a table for departments with ID, name, and location details
CREATE TABLE departments (
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(100),
    Location VARCHAR(100)
);

-- Create a table for employees with details such as ID, name, email, phone, and department
CREATE TABLE employees (
    Employee_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50),
    Email VARCHAR(50),
    Phone VARCHAR(15),
    Department_ID INT,
    FOREIGN KEY (Department_ID) REFERENCES departments(Department_ID)
);

-- Create a table for department heads, linking them to their respective departments
CREATE TABLE department_heads (
    Head_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50),
    Department_ID INT,
    FOREIGN KEY (Department_ID) REFERENCES departments(Department_ID)
);

-- Insert sample data into the departments table
INSERT INTO departments (Department_ID, Department_Name, Location)
VALUES (201, "Human Resources", "Johannesburg"),
       (202, "IT", "Cape Town"),
       (203, "Marketing", "Durban"),
       (204, "Finance", "Pretoria");

-- Insert sample data into the employees table
INSERT INTO employees (Name, Email, Phone, Department_ID)
VALUES ("Thandiwe Mkhize", "thandiwe@mzansi.com", "0834567890", 201),
       ("Sipho Dlamini", "sipho@mzansi.com", "0732345678", 202),
       ("Nosipho Ngcobo", "nosipho@mzansi.com", "0613456789", 203),
       ("Johan van der Merwe", "johan@mzansi.com", "0824567890", 201),
       ("Zanele Molefe", "zanele@mzansi.com", "0711234567", 204);

-- Insert sample data into the department_heads table
INSERT INTO department_heads (Name, Department_ID)
VALUES ("Lerato Khumalo", 201),
       ("Themba Ndlovu", 202),
       ("Fatima Patel", 203),
       ("Peter Mabena", 204);

-- Display all data from the departments table
SELECT * 
FROM departments;

-- Display all data from the employees table
SELECT * 
FROM employees;

-- Display all data from the department_heads table
SELECT * 
FROM department_heads;

-- Allow updates to data without strict checks
SET SQL_SAFE_UPDATES = 0;

-- Update the phone number for Johan van der Merwe in the employees table
UPDATE employees
SET phone = "0845678901"
WHERE name = "Johan van der Merwe";

-- Delete the record for Zanele Molefe from the employees table
DELETE FROM employees
WHERE name = "Zanele Molefe";

-- Create a new user with limited access and a secure password
CREATE USER 'mzansi_user'@'localhost' IDENTIFIED BY 'securePass456';

-- Grant the new user SELECT and INSERT permissions on the global_diversity database
GRANT SELECT, INSERT ON global_diversity.* TO 'mzansi_user'@'localhost';

-- Revoke the INSERT permission from the new user
REVOKE INSERT ON global_diversity.* FROM 'mzansi_user'@'localhost';

-- Create a locations table with an auto-incrementing ID and link to the departments table
CREATE TABLE locations (
    Location_ID INT PRIMARY KEY AUTO_INCREMENT,
    Location_Name VARCHAR(50),
    Department_ID INT,
    FOREIGN KEY (Department_ID) REFERENCES departments(Department_ID)
);

-- Add a Location column to the locations table
ALTER TABLE locations
ADD COLUMN Location VARCHAR(100);

-- Populate the locations table by copying location data from the departments table
INSERT INTO locations (Location_Name, Department_ID)
SELECT Location, Department_ID
FROM departments;

-- Remove the Location column from the departments table
ALTER TABLE departments
DROP COLUMN Location;


-- Bonus Challenge

-- To find employees working in multiple departments 
SELECT Name, Employee_ID, COUNT(DISTINCT Department_ID) AS Department_Count
FROM employees
GROUP BY Employee_ID, Name
HAVING Department_Count > 1;

-- to list all departments that do not have any employees
SELECT d.Department_ID, d.Department_Name
FROM departments d
LEFT JOIN employees e
ON d.Department_ID = e.Department_ID
WHERE e.Employee_ID IS NULL;



