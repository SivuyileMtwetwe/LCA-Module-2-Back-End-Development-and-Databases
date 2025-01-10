# **Week 1 Exercise 04: Applying SQL and Database Normalization**

## **Overview**

This exercise will help you apply the concepts of SQL commands (DDL, DML, DCL) and database normalization (up to 3rd Normal Form) using MySQL. The tasks will test your ability to design, create, manipulate, and secure a company database while ensuring it is properly normalized. Submit your solution as a `.sql` file on the LMS.

---

## **Instructions**

1. Create a new database called `global_diversity` in MySQL Workbench.
2. Complete all six tasks below.
3. Ensure that all tables are normalized up to 3rd Normal Form.
4. Use appropriate SQL commands for each task.
5. Include comments in your `.sql` file to explain each step.

---

## **Tasks**

### **Task 1: Database Design**
1. Design a database to manage employees, departments, and department heads.
2. The database should include the following:
   - A table for `employees` (with `Employee_ID`, `Name`, `Email`, `Phone`, and `Department_ID`).
   - A table for `departments` (with `Department_ID`, `Department_Name`, and `Location`).
   - A table for `department_heads` (with `Head_ID`, `Name`, and `Department_ID`).

**Deliverable:**
- Use `CREATE TABLE` statements to create the above tables.
- Ensure the tables are normalized up to 3rd Normal Form.

---

### **Task 2: Populate the Tables**
1. Insert the following data into the tables:

**Employees Table:**
| Employee_ID | Name               | Email                 | Phone       | Department_ID |
| ----------- | ------------------ | --------------------- | ----------- | ------------- |
| 1           | Thandiwe Mkhize    | thandiwe@mzansi.com   | 0834567890  | 201           |
| 2           | Sipho Dlamini      | sipho@mzansi.com      | 0732345678  | 202           |
| 3           | Nosipho Ngcobo     | nosipho@mzansi.com    | 0613456789  | 203           |
| 4           | Johan van der Merwe| johan@mzansi.com      | 0824567890  | 201           |
| 5           | Zanele Molefe      | zanele@mzansi.com     | 0711234567  | 204           |

**Departments Table:**
| Department_ID | Department_Name       | Location       |
| ------------- | --------------------- | -------------- |
| 201           | Human Resources       | Johannesburg   |
| 202           | IT                    | Cape Town      |
| 203           | Marketing             | Durban         |
| 204           | Finance               | Pretoria       |

**Department Heads Table:**
| Head_ID | Name               | Department_ID |
| ------- | ------------------ | ------------- |
| 1       | Lerato Khumalo     | 201           |
| 2       | Themba Ndlovu      | 202           |
| 3       | Fatima Patel       | 203           |
| 4       | Peter Mabena       | 204           |

**Deliverable:**
- Use `INSERT INTO` statements to populate the tables with the above data.

---

### **Task 3: Query the Data**
1. Write SQL queries to:
   - Retrieve the names and emails of all employees in the "IT" department.
   - Find the total number of employees in each department.
   - List all departments along with their department heads.

**Deliverable:**
- Include your `SELECT` statements and the query results in your `.sql` file.

---

### **Task 4: Update and Delete Records**
1. Perform the following operations:
   - Update the phone number of "Johan van der Merwe" to `0845678901`.
   - Delete the employee record for "Zanele Molefe."

**Deliverable:**
- Use `UPDATE` and `DELETE` statements to make the changes.

---

### **Task 5: Apply DCL Commands**
1. Create a new user called `mzansi_user` with the password `securePass456`.
2. Grant the user SELECT and INSERT permissions on the `mzansi_company` database.
3. Revoke the INSERT permission from the user.

**Deliverable:**
- Use `CREATE USER`, `GRANT`, and `REVOKE` statements for this task.

---

### **Task 6: Add Normalization**
1. Review your database design and ensure it is normalized up to 3rd Normal Form.
2. Create a new table called `locations`:
   - Move the `Location` column from the `departments` table to the new `locations` table.
   - The `locations` table should include `Location_ID`, `Location_Name`, and `Department_ID`.

**Deliverable:**
- Use `CREATE TABLE`, `INSERT INTO`, and `ALTER TABLE` statements to implement normalization.

---

## **Submission**
1. Save your work as a `.sql` file.
2. Include comments in the file explaining each step.
3. Upload the `.sql` file to the LMS for submission.

**Submission Format:** `SQL_Exercise_04_[YourName].sql`

---

## **Bonus Challenge (Optional)**

- Write a query to find employees working in multiple departments.
- Write a query to list all departments that do not have any employees.

**Deliverable:**  
- Include your queries and results in the `.sql` file.

Good luck! 🚀
