# **Exercise: Working with Specific Column Values in SQL**

## **Overview**
This exercise is designed to help you practice adding, updating, and modifying specific column values in a table. You will also apply conditions to ensure precise updates and gain confidence working with SQL `UPDATE`, `ALTER`, and `DEFAULT` commands.

---

## **Scenario**
You are managing a database for a university, and you are tasked with updating the information for the `Lecturers` table. Follow the instructions below to add new columns, modify existing values, and conditionally update data.

---

## **Instructions**

### **Task 1: Set Up the Database**
1. Create a database named `university_db`.
   ```sql
   CREATE DATABASE university_db;
   USE university_db;

2. Create a table called `Lecturers` with the following structure:
   ```sql
    lecturer_id 
    name
    department
    email

3. Insert the following initial data:
   ```sql
    ('Dr. Alice Smith', 'Mathematics', 'alice.smith@university.com'),
    ('Prof. Bob Johnson', 'Physics', 'bob.johnson@university.com'),
    ('Dr. Charlie Brown', 'Computer Science', 'charlie.brown@university.com');

### **Task 2: Add a New Column**
1. Add a new column called `office_location` to store the lecturer's office location (VARCHAR(50)).

### **Task 3: Add Specific Values to the New Column**
1. Update the `office_location` column with the following data:
    ```sql
    Alice: "Room 101"
    Bob: "Room 202"
    Charlie: "Room 303"

### **Task 4: Add a Default Value**
1. Add a default value of `"General"` to the department column.
2. Insert a new lecturer:
    ```sql
    ('Dr. Emily Green', 'emily.green@university.com', 'Room 404');
3. Verify that the department column automatically uses the default value.

### **Task 5: Update Data Conditionally**
1. Update the `department` to `"Engineering"` for all lecturers whose email ends with `"@engineering.com"`.
    *(Hint: You may need to insert a new lecturer first with such an email for testing.)*
2. Update the `department` to `"Science"` for all lecturers whose names contain `"Dr."`.

### **Task 6: Practice Deleting and Viewing Data**
1. Delete Bob Johnson’s record from the `Lecturers` table.
2. View all remaining data in the Lecturers table

### **Challenge Task (Optional)**
1. Add another column called phone_number (VARCHAR(15)).
2. Update the phone_number column with the following data:
    ```sql
    Alice: "123-456-7890"
    Charlie: "987-654-3210"
    