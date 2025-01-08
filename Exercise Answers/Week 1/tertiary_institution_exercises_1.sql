CREATE DATABASE tertiary_institution;

USE tertiary_institution;

CREATE TABLE Students(
student_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50),
major VARCHAR(25),
year_of_study INT );

CREATE TABLE Courses (
 course_id INT PRIMARY KEY AUTO_INCREMENT,
 course_name VARCHAR(50),
 department VARCHAR(50),
 credits INT
 );
 
 CREATE TABLE Enrollments(
 enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
 student_id INT,
 course_id INT,
 enrollment_date DATE
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

INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES
(1, 1001, 101, '2024-01-15'),
(2, 1002, 201, '2024-01-15'),
(3, 1003, 101, '2024-01-16'),
(4, 1004, 202, '2024-01-16'),
(5, 1005, 301, '2024-01-17'),
(6, 1001, 201, '2024-01-17'),
(7, 1002, 101, '2024-01-18');
