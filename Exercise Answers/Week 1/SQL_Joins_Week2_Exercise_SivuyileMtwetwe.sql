CREATE DATABASE bright_future_company;

USE bright_future_company;

CREATE TABLE Departments(
Department_ID INT PRIMARY KEY AUTO_INCREMENT,
Department_Name VARCHAR(100),
Location VARCHAR(50)
);

CREATE TABLE Employees (
    Employee_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Department_ID INT NULL,
    Salary DECIMAL(10, 2) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID)
    
);


INSERT INTO Departments (Department_ID, Department_Name, Location)
VALUES ("101", "Human Resources", "Johannesburg"),
		("102" ,"IT",  "Cape Town"),
        ("103" ,"Marketing", "Durban"),
        ("104", "Finance", "Pretoria");


INSERT INTO Employees (Name, Department_ID, Salary, Email, Phone)
VALUES ("Thandiwe Mkhize", "101", 35000.00, "thandiwe@brightfuture.com", "0834567890"),
		("Sipho Dlamini", "102", 42000.00, "sipho@brightfuture.com", "0732345678"),
        ("Nosipho Ngcobo", "103", 39000.00, "nosipho@brightfuture.com", "0613456789"),
        ("Johan van der Merwe", "101", 48000.00, "johan@brightfuture.com", "0824567890"),
        ("Zanele Molefe", NULL,40000.00, "zanele@brightfuture.com", "0711234567" );
        

SELECT Employees.Name ,Department_Name , Location
FROM Employees INNER JOIN Departments ;

