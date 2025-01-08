-- Customers table (stores customer information)
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO INCREMENT,
    CustomerName VARCHAR(100),
    CustomerAddress VARCHAR(200)
);

INSERT INTO Customers (CustomerName, CustomerAddress) VALUES
('Alice Smith', '123 Maple St'),
('Bob Johnson', '456 Oak Ave'),
('Carol White', '789 Pine Rd');

-- Suppliers table (stores supplier information)
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY AUTO INCREMENT,
    SupplierName VARCHAR(100),
    SupplierContact VARCHAR(20)
);

INSERT INTO Suppliers (SupplierName, SupplierContact) VALUES
('TechCorp', '555-1234'),
('GadgetWorld', '555-5678'),
('AudioTech', '555-9876');

-- Products table (stores product information)
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    ProductPrice DECIMAL(10,2),
    SupplierID INT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

INSERT INTO Products (ProductID, ProductName, ProductPrice, SupplierID) VALUES
(101, 'Laptop', 800.00, 1),
(102, 'Smartphone', 500.00, 2),
(103, 'Headphones', 50.00, 3);

-- Orders table (stores order headers)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES
(1, 1, '2023-12-01'),
(2, 2, '2023-12-02'),
(3, 1, '2023-12-05'),
(4, 3, '2023-12-06');

-- OrderDetails table (stores order lines)
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES
(1, 101, 1),
(2, 102, 2),
(3, 101, 1),
(4, 103, 3);