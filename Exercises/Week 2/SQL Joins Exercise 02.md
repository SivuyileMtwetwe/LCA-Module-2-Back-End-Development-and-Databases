# **Week 2 Exercise: Applying SQL Joins and Basic Operations**

## **Overview**

This exercise will help you practice SQL joins (`INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, and `CROSS JOIN`), as well as SQL operations such as creating, updating, and deleting records. Additionally, you will apply **DDL**, **DML**, and **DCL** commands to modify and secure your database. Submit your solution as a `.sql` file on the LMS.

---

## **Instructions**

1. Create a new database called `bright_future_company` in MySQL Workbench.
2. Complete all six tasks below using the provided keywords.
3. Include comments in your `.sql` file explaining each step.

---

## **Tasks**

### **Task 1: Database Design**

1. Create the following tables:

   - **Employees Table:**
     - `Employee_ID` (Primary Key, INT, Auto Increment)
     - `Name` (VARCHAR(100))
     - `Department_ID` (INT, Nullable)
     - `Salary` (DECIMAL(10, 2))
     - `Email` (VARCHAR(100))
     - `Phone` (VARCHAR(15))

   - **Departments Table:**
     - `Department_ID` (Primary Key, INT, Auto Increment)
     - `Department_Name` (VARCHAR(100))
     - `Location` (VARCHAR(50))

**Keywords to use:** `CREATE DATABASE`, `CREATE TABLE`, `PRIMARY KEY`, `AUTO_INCREMENT`.

---

### **Task 2: Insert Data**

Insert the following sample data into your tables:

#### **Employees Table**
| Employee_ID | Name               | Department_ID | Salary  | Email                | Phone       |
| ----------- | ------------------ | ------------- | ------- | -------------------- | ----------- |
| 1           | Thandiwe Mkhize    | 101           | 35000.00 | thandiwe@brightfuture.com | 0834567890 |
| 2           | Sipho Dlamini      | 102           | 42000.00 | sipho@brightfuture.com   | 0732345678 |
| 3           | Nosipho Ngcobo     | 103           | 39000.00 | nosipho@brightfuture.com | 0613456789 |
| 4           | Johan van der Merwe| 101           | 48000.00 | johan@brightfuture.com   | 0824567890 |
| 5           | Zanele Molefe      | NULL          | 40000.00 | zanele@brightfuture.com  | 0711234567 |

#### **Departments Table**
| Department_ID | Department_Name       | Location       |
| ------------- | --------------------- | -------------- |
| 101           | Human Resources       | Johannesburg   |
| 102           | IT                    | Cape Town      |
| 103           | Marketing             | Durban         |
| 104           | Finance               | Pretoria       |

**Keywords to use:** `INSERT INTO`, `VALUES`.

---

### **Task 3: Query Using Joins**

1. Write a query to retrieve all employees with their department names and locations using **INNER JOIN**.  
2. Write a query to list all employees, including those without a department, using **LEFT JOIN**.  
3. Write a query to list all departments, including those without employees, using **RIGHT JOIN**.  
4. Write a query to display all possible combinations of employees and departments using **CROSS JOIN**.

**Keywords to use:** `SELECT`, `FROM`, `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `CROSS JOIN`, `ON`.

---

### **Task 4: Data Updates and Deletion**

1. Update the phone number of **Nosipho Ngcobo** to `0845678901`.  
2. Delete the record of **Zanele Molefe** from the employees table.  

**Keywords to use:** `UPDATE`, `SET`, `WHERE`, `DELETE`.

---

### **Task 5: Filter and Aggregate Data**

1. Write a query to list all employees earning more than `40,000` along with their department names.  
2. Write a query to count the total number of employees in each department and the total salary paid per department.  

**Keywords to use:** `WHERE`, `GROUP BY`, `COUNT`, `SUM`, `HAVING`.

---

### **Task 6: Bonus Challenge**

#### **Part 1: Advanced Queries**
1. Write a query to find departments with no employees assigned.  
2. Write a query to identify employees who are not assigned to any department.  

**Keywords to use:** `IS NULL`, `LEFT JOIN`, `WHERE`.

#### **Part 2: DDL, DML, and DCL Task**
1. Add a new column called `Hire_Date` to the `Employees` table to track when an employee was hired.  
2. Insert `Hire_Date` values for each employee. Use realistic dates.  
3. Create a new user called `bright_user` with the password `Bright123!`.  
4. Grant the `bright_user` only `SELECT` permission on the `Employees` table.  

**Keywords to use:** `ALTER TABLE`, `ADD COLUMN`, `INSERT INTO`, `CREATE USER`, `GRANT`.

---

## **Submission**

1. Save your work as a `.sql` file.
2. Include comments in the file explaining each step.
3. Upload the `.sql` file to the LMS.

**Submission Format:**  
`SQL_Joins_Week2_Exercise_[YourName].sql`

---

## **Good luck, and happy coding! 🚀**
