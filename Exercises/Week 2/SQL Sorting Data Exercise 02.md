# ** WEEK 2 SQL Exercise: Sorting, Restricting, and Wildcards with Library Data**

## **Overview**

This exercise will help you practice SQL concepts such as **sorting data (ORDER BY)**, **restricting data (LIMIT & OFFSET)**, and **using wildcards (LIKE)**. You will use a library database with two tables: `books` and `authors`. The tasks will test your ability to query, manipulate, and retrieve specific data using these concepts. You will also apply basic SQL operations like **DDL** and **DML**.

---

## **Instructions**

1. Create a new database called `library_db`.
2. Complete all tasks below.
3. Submit your SQL solution as a `.sql` file on the LMS.
4. Include comments in your SQL code explaining each step.

---

## **Tables and Data**

### **1. Books Table**
| Book_ID | Title                              | Genre          | Published_Year | Author_ID |
| ------- | ---------------------------------- | -------------- | -------------- | --------- |
| 1       | The Journey of Knowledge           | Non-Fiction    | 2018           | 101       |
| 2       | Adventures in Coding               | Technology     | 2021           | 102       |
| 3       | The Art of Storytelling            | Fiction        | 2015           | 103       |
| 4       | Learning SQL for Beginners         | Technology     | 2020           | 102       |
| 5       | Hidden Gems of South African Tales | Fiction        | 2017           | 104       |

---

### **2. Authors Table**
| Author_ID | Name                | Country          |
| --------- | ------------------- | ---------------- |
| 101       | Thandiwe Mkhize     | South Africa     |
| 102       | Johan van der Merwe | Netherlands      |
| 103       | Sipho Dlamini       | South Africa     |
| 104       | Zanele Molefe       | Zimbabwe         |

---

### **DDL and DML Setup Tasks**

#### **Task 1: Create the Database and Tables**
1. Create the `library_db` database.
2. Create the `books` and `authors` tables with the structure above.

**Keywords to Use:** `CREATE DATABASE`, `CREATE TABLE`.

#### **Task 2: Insert Data**
1. Populate the `books` and `authors` tables with the data provided above.

**Keywords to Use:** `INSERT INTO`, `VALUES`.

---

## **Query Tasks**

### **Task 3: Sorting Data**
1. Write a query to retrieve all books sorted by `Published_Year` in descending order.
2. Write a query to retrieve all authors sorted alphabetically by `Name`.

**Keywords to Use:** `ORDER BY`.

---

### **Task 4: Restricting Data**
1. Write a query to display the first 3 books using `LIMIT`.
2. Write a query to display the next 2 books (skip the first 3) using `OFFSET`.

**Keywords to Use:** `LIMIT`, `OFFSET`.

---

### **Task 5: Wildcards (LIKE)**
1. Write a query to find all books with the word "Coding" in the title.
2. Write a query to find all authors whose names start with "S".

**Keywords to Use:** `LIKE`, `%`, `_`.

---

### **Task 6: Joins and Advanced Queries**
1. Write an **INNER JOIN** query to display each book along with its author’s name and country.
2. Write a query to count how many books each author has written.

**Keywords to Use:** `INNER JOIN`, `COUNT`, `GROUP BY`.

---

### **Bonus Challenge**

1. Write a query to find all books published before 2018, written by authors from South Africa.
2. Add a new column `ISBN` to the `books` table, then insert ISBN numbers for each book.

**Keywords to Use:** `ALTER TABLE`, `ADD COLUMN`, `WHERE`.

---

## **Submission**

1. Save your work as a `.sql` file.
2. Include comments in your SQL file to explain each query.
3. Submit the `.sql` file to the LMS.

**Submission Format:** `SQL_Exercise_Library_[YourName].sql`

---

## **Good Luck, and Happy Coding! 🚀**
