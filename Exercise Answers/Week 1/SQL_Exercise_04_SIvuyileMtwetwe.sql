CREATE DATABASE global_diversity;

USE global_diversity;


CREATE TABLE departments (
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(100),
    Location VARCHAR(100)
);


CREATE TABLE employees (
    Employee_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50),
    Email VARCHAR(50),
    Phone VARCHAR(15),
    Department_ID INT,
    FOREIGN KEY (Department_ID) REFERENCES departments(Department_ID)
);


CREATE TABLE department_heads (
    Head_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50),
    Department_ID INT,
    FOREIGN KEY (Department_ID) REFERENCES departments(Department_ID)
);

INSERT INTO departments (Department_ID, Department_Name,Location  )
VALUES (201, "Human Resources", "Johannesburg"),
		(202, "IT", "Cape Town" ),
        (203, "Marketing", "Durban"),
        (204, "Finance", "Pretoria");

INSERT INTO employees (Name,Email,Phone,Department_ID)
VALUES ("Thandiwe Mkhize","thandiwe@mzansi.com", "0834567890",201),
		("Sipho Dlamini","sipho@mzansi.com", "0732345678", 202),
        ("Nosipho Ngcobo", "nosipho@mzansi.com", "0613456789", 203),
        ("Johan van der Merwe", "johan@mzansi.com", "0824567890", 201),
        ("Zanele Molefe", "zanele@mzansi.com", "0711234567", 204);
        
        
INSERT INTO department_heads (Name, Department_ID)
VALUES ("Lerato Khumalo",201),
		("Themba Ndlovu",202),
        ("Fatima Patel",203),
        ("Peter Mabena",204);
        
SELECT *
FROM departments;
        
SELECT *
FROM employees;

SELECT *
FROM department_heads;

        
SET SQL_SAFE_UPDATES = 0;

UPDATE employees
SET  phone = "0845678901"
WHERE name = "Johan van der Merwe";

DELETE FROM employees
WHERE name = "Zanele Molefe";

CREATE USER 'mzansi_user'@'localhost' IDENTIFIED BY 'securePass456';

GRANT SELECT, INSERT ON global_diversity.* TO 'mzansi_user'@'localhost';

REVOKE INSERT ON global_diversity.* FROM 'mzansi_user'@'localhost';

CREATE TABLE locations(
Location_ID INT PRIMARY KEY AUTO_INCREMENT,
Location_Name VARCHAR(50),
Department_ID  INT,
FOREIGN KEY (Department_ID) REFERENCES departments(Department_ID));

ALTER TABLE locations
ADD COLUMN Location VARCHAR(100);

INSERT INTO locations (Location_Name, Department_ID)
SELECT Location, Department_ID
FROM departments;

ALTER TABLE departments
DROP COLUMN Location;



-- UPDATE locations
-- SET Location = (SELECT Locations FROM departments WHERE Department_ID = Location_ID);

