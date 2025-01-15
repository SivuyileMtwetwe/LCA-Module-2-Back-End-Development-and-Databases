CREATE DATABASE tertiary_institution;

USE tertiary_institution;

CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    major VARCHAR(25),
    year_of_study INT
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(50),
    department VARCHAR(50),
    credits INT
);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    UNIQUE (student_id, course_id), -- Composite unique constraint
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

 
  
  
INSERT INTO Students (student_id, name, major, year_of_study) 
VALUES
(1001, 'Usisipho Mxinwa', 'Computer Science', 2),
(1002, 'Siyavuya Khohlani', 'Mathematics', 3),
(1003, 'Avela Nikani', 'Physics', 1),
(1004, 'Lithemba Mlenze', 'Chemistry', 4),
(1005, 'Zenande Nocanda', 'Engineering', 2);

INSERT INTO Courses (course_id, course_name, department, credits) 
VALUES
(101, 'Programming', 'Computer Science', 3),
(201, 'Linear Algebra', 'Mathematics', 4),
(109, 'Physics Mechanics', 'Physics', 4),
(202, 'Organic Chemistry', 'Chemistry', 3),
(301, 'Circuit Analysis', 'Engineering', 4);

INSERT INTO Enrollments ( student_id, course_id, enrollment_date)
VALUES
( 1001, 101, '2024-01-15'),
( 1002, 201, '2024-01-15'),
( 1003, 101, '2024-01-16'),
( 1004, 202, '2024-01-16'),
( 1005, 301, '2024-01-17'),
( 1001, 201, '2024-01-17'),
( 1002, 101, '2024-01-18');


-- 1. INNER JOIN query to get students and their enrolled courses
SELECT s.student_id, s.name AS student_name, s.major, c.course_id, c.course_name, c.department, e.enrollment_date
FROM Students s INNER JOIN Enrollments e ON s.student_id = e.student_id INNER JOIN  Courses c ON e.course_id = c.course_id
ORDER BY s.student_id, c.course_id;

-- 2. LEFT JOIN query to find all students and their courses (including students with no courses)
SELECT s.student_id, s.name AS student_name, s.major, c.course_id, c.course_name, e.enrollment_date
FROM Students s LEFT JOIN Enrollments e ON s.student_id = e.student_id LEFT JOIN  Courses c ON e.course_id = c.course_id
ORDER BY s.student_id;

-- 3. RIGHT JOIN query to find all courses and their enrollments (including courses with no students)
SELECT c.course_id, c.course_name, c.department, s.student_id, s.name AS student_name, e.enrollment_date
FROM Students s RIGHT JOIN  Enrollments e ON s.student_id = e.student_id RIGHT JOIN  Courses c ON e.course_id = c.course_id
ORDER BY c.course_id;

SELECT Students.name , Students.year_of_study
FROM Students
ORDER BY year_of_study ASC