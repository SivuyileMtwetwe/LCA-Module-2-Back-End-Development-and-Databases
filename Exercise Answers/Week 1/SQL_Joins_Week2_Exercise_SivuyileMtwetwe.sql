-- Creating a database
CREATE DATABASE bright_future_company;

-- using the database
USE bright_future_company;


-- creating the departments table
CREATE TABLE Departments(
Department_ID INT PRIMARY KEY AUTO_INCREMENT,
Department_Name VARCHAR(100),
Location VARCHAR(50)
);

-- creating the employees table
CREATE TABLE Employees (
    Employee_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Department_ID INT NULL,
    Salary DECIMAL(10, 2) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID)
    
);


-- inserting to the department table
INSERT INTO Departments (Department_ID, Department_Name, Location)
VALUES ("101", "Human Resources", "Johannesburg"),
		("102" ,"IT",  "Cape Town"),
        ("103" ,"Marketing", "Durban"),
        ("104", "Finance", "Pretoria");


-- inserting to the employees table
INSERT INTO Employees (Name, Department_ID, Salary, Email, Phone)
VALUES ("Thandiwe Mkhize", "101", 35000.00, "thandiwe@brightfuture.com", "0834567890"),
		("Sipho Dlamini", "102", 42000.00, "sipho@brightfuture.com", "0732345678"),
        ("Nosipho Ngcobo", "103", 39000.00, "nosipho@brightfuture.com", "0613456789"),
        ("Johan van der Merwe", "101", 48000.00, "johan@brightfuture.com", "0824567890"),
        ("Zanele Molefe", NULL,40000.00, "zanele@brightfuture.com", "0711234567" );
        


-- Write a query to retrieve all employees with their department names and locations using INNER JOIN
SELECT Employees.Name ,Department_Name , Location
FROM Employees INNER JOIN Departments
ON Employees.Department_ID = Departments.Department_ID;

-- Write a query to list all employees, including those without a department, using LEFT JOIN
SELECT Employees.Name , Department_Name
FROM Employees LEFT JOIN Departments
ON Employees.Department_ID = Departments.Department_ID;

-- Write a query to list all departments, including those without employees, using RIGHT JOIN
SELECT Department_Name, COUNT(Employees.Name) AS "Number of employees"
FROM Employees RIGHT JOIN Departments
ON Employees.Department_ID = Departments.Department_ID
GROUP BY Department_Name;

-- Write a query to display all possible combinations of employees and departments using CROSS JOIN
SELECT Employees.Employee_ID, Employees.Name, Department_Name, Email, Phone, Location
FROM Employees CROSS JOIN Departments
ON Employees.Department_ID = Departments.Department_ID;

-- disabling safe mode
SET SQL_SAFE_UPDATES = 0;


-- Update the phone number of **Nosipho Ngcobo** to `0845678901`.
UPDATE Employees
SET Phone = "0845678901"
WHERE Employees.Name = "Nosipho Ngcobo";


-- Delete the record of **Zanele Molefe** from the employees table.
DELETE FROM Employees
WHERE Employees.Name = "Zanele Molefe";

-- Write a query to list all employees earning more than `40,000` along with their department names.  
SELECT Employees.Name , Department_Name, Salary
FROM Employees INNER JOIN Departments
ON Employees.Department_ID = Departments.Department_ID
WHERE Salary > 40000.00;


-- Write a query to count the total number of employees in each department and the total salary paid per department.
SELECT Department_Name, COUNT(Employees.Name) AS "Number of employees", SUM(Employees.Salary) AS Salary
FROM Employees INNER JOIN Departments
ON Employees.Department_ID = Departments.Department_ID
GROUP BY Department_Name;

-- Write a query to find departments with no employees assigned. 
SELECT Employees.Name AS "Employees Not Assinged to any department"
FROM Employees
WHERE Department_ID IS NULL;

-- Write a query to identify employees who are not assigned to any department.
ALTER TABLE Employees
ADD COLUMN Hire_Date DATE;


-- inserting to new column
UPDATE Employees SET Hire_Date = '2020-06-15' WHERE Employee_ID = 1;
UPDATE Employees SET Hire_Date = '2019-09-25' WHERE Employee_ID = 2;
UPDATE Employees SET Hire_Date = '2021-03-12' WHERE Employee_ID = 3;
UPDATE Employees SET Hire_Date = '2018-11-05' WHERE Employee_ID = 4;

-- creating a user
CREATE USER "bright_user"@"localhost" IDENTIFIED BY "Bright123!";

-- granting access to the user/ restricting the user
GRANT SELECT ON bright_future_company.Employees TO "bright_user"@"localhost";

