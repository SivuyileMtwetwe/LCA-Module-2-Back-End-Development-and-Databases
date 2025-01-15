# **EduConnect Database Challenge**

## **Scenario**
EduConnect is an online learning platform that tracks students, their courses, and the instructors who teach them. The platform also keeps a record of student grades, instructor details, and course prerequisites. Your task is to:

1. Normalize the given unnormalized table to 1NF, 2NF, and 3NF.
2. Create the normalized database schema using **DDL**.
3. Populate the tables with the provided data using **DML**.
4. Add **Integrity Constraints** (e.g., Primary Keys, Foreign Keys, UNIQUE, NOT NULL).
5. Perform advanced queries to retrieve meaningful insights.

## **Unnormalized Table (UNF)**
| StudentID | Name          | Courses                | InstructorName | InstructorPhone | Grades | Prerequisites      |
|-----------|---------------|------------------------|----------------|-----------------|--------|--------------------|
| 201       | Siyanda Ndlovu | Math, Physics         | Mr. Khumalo    | 082-456-7890    | 85, 70 | NULL, Math Basics  |
| 202       | Thandiwe Dlamini | History, Math       | Ms. Mokoena    | 073-567-8901    | 92, 88 | NULL, Math Basics  |
| 203       | Lindiwe Mthembu | Chemistry            | Dr. Zulu       | 084-678-9012    | 75     | Physics            |
| 204       | Sipho Ntuli    | Physics, Chemistry    | Dr. Zulu       | 084-678-9012    | 78, 80 | Math Basics, NULL  |
| 205       | Themba Mhlongo | Math, History         | Ms. Mokoena    | 073-567-8901    | 67, 90 | NULL, NULL         |
| 206       | Zanele Khumalo | History               | Ms. Mokoena    | 073-567-8901    | 55     | NULL               |
| 207       | Sibusiso Mkhize | Biology, Chemistry   | Dr. Naidoo     | 083-789-0123    | 80, 72 | NULL, NULL         |
| 208       | Nomvula Mhlanga | Biology, Physics     | Dr. Naidoo     | 083-789-0123    | 65, 88 | NULL, Math Basics  |
| 209       | Andile Mthethwa | Physics              | Mr. Khumalo    | 082-456-7890    | 90     | Math Basics        |
| 210       | Naledi Molefe  | Chemistry, Biology    | Dr. Zulu       | 084-678-9012    | 70, 85 | Physics, NULL      |

## **Tasks**

### **Task 1: Normalize the Table**
- Normalize the given table into 1NF, 2NF, and 3NF.
- Clearly define the tables at each step.

### **Task 2: Create the Schema Using DDL**
1. Write SQL statements to create the normalized tables.
2. Add **Integrity Constraints** such as:
   - Primary Keys
   - Foreign Keys
   - UNIQUE constraints
   - NOT NULL constraints

### **Task 3: Populate the Tables Using DML**
- Insert a minimum of 10 records into each table.

### **Task 4: Perform Advanced Queries**
Write SQL queries to:
1. Retrieve the names of all students and the courses they are taking.
2. Find all students who scored above 80% in Physics.
3. List all instructors along with the courses they teach.
4. Find courses that have "Math Basics" as a prerequisite.
5. Count how many students are enrolled in each course.
6. Retrieve the phone numbers of instructors who teach more than one course.
7. List all students taking courses taught by "Ms. Mokoena."
8. Find students taking both "Physics" and "Chemistry."

---

## **Expected Output**
Your submission should include:
1. **Normalized tables**: Clearly labeled 1NF, 2NF, and 3NF tables.
2. **SQL scripts**:
   - DDL for creating tables.
   - DML for inserting data.
   - Queries for the advanced tasks.
3. **Results** of the advanced queries (e.g., screenshots or query outputs).

---

### **Good Luck!**
