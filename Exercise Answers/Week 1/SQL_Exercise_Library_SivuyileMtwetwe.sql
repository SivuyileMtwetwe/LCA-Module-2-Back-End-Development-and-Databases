-- Create the main database
CREATE DATABASE library_db;
USE library_db;

-- Create authors table with basic author information
-- Author_ID is auto-incrementing primary key
CREATE TABLE authors(
    Author_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),    -- Allows for full names including spaces
    Country VARCHAR(100)  -- Stores author's country of origin
);

-- Create books table with relationship to authors
-- Book_ID is auto-incrementing primary key
CREATE TABLE books(
    Book_ID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100),      -- Allows for longer book titles
    Genre VARCHAR(50),       -- Categorizes books by type
    Published_Year YEAR,     -- Stores only the year of publication
    Author_ID INT,          -- Foreign key to link with authors table
    FOREIGN KEY (Author_ID) REFERENCES authors(Author_ID)  -- Ensures referential integrity
);

-- Insert initial author data
-- Note: Explicitly setting Author_ID is not recommended with AUTO_INCREMENT
INSERT INTO authors(Author_ID, Name, Country)
VALUES 
    ("101", "Thandiwe Mkhize", "South Africa"),
    ("102", "Johan van der Merwe", "Netherlands"),
    ("103", "Sipho Dlamini", "South Africa"),
    ("104", "Zanele Molefe", "Zimbabwe");

-- Insert book records with their corresponding author IDs
INSERT INTO books(Title, Genre, Published_Year, Author_ID)
VALUES 
    ("The Journey of Knowledge", "Non-Fiction", 2018, "101"),
    ("Adventures in Coding", "Technology", 2021, "102"),
    ("The Art of Storytelling", "Fiction", 2015, "103"),
    ("Learning SQL for Beginners", "Technology", 2020, "102"),
    ("Hidden Gems of South African Tales", "Fiction", 2017, "104");

-- Query 1: Get all books sorted by publication year (newest first)
SELECT Title, Published_Year
FROM books
ORDER BY Published_Year DESC;

-- Query 2: Get all author names in alphabetical order
SELECT Name
FROM authors
ORDER BY NAME ASC;

-- Query 3: Get first 3 books (LIMIT clause)
SELECT Title
FROM books
LIMIT 3;

-- Query 4: Get books 4-5 using OFFSET
SELECT Title
FROM books
LIMIT 2 OFFSET 3;

-- Query 5: Search for books with "Coding" in the title
SELECT Title
FROM books
WHERE Title LIKE "%Coding%";

-- Query 6: Find authors whose names start with 'S'
SELECT Name 
FROM authors
WHERE Name LIKE "S%";

-- Query 7: Join books and authors to show book details with author information
SELECT 
    books.Title AS "Book Title",
    authors.Name AS Author,
    authors.Country
FROM books 
INNER JOIN authors ON books.Author_ID = authors.Author_ID;

-- Query 8: Count number of books per author
SELECT 
    authors.Name AS Author,
    COUNT(Title) AS "Number of books"
FROM books 
INNER JOIN authors ON books.Author_ID = authors.Author_ID
GROUP BY authors.Name;

-- Query 9: Find South African books published before 2018
SELECT 
    books.Title,
    books.Published_Year,
    authors.Country
FROM books 
INNER JOIN authors ON books.Author_ID = authors.Author_ID
WHERE books.Published_Year < 2018 
AND authors.Country = "South Africa";

-- Add ISBN column to books table
ALTER TABLE books
ADD COLUMN ISBN INT;

-- Insert ISBN numbers for existing books
-- Note: This INSERT syntax is incorrect. Should use UPDATE instead
INSERT INTO books (ISBN)
VALUES 
    ('978030640615'),
    ('978067976741'),
    ('978145167331'),
    ('978006245773'),
    ('978038551423');