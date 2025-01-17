
-- Creating database 
CREATE DATABASE EduConnect;

-- using the database
USE EduConnect;

-- creating students table 
CREATE TABLE Students(
StudentID INT PRIMARY KEY ,
Name VARCHAR(100)
);


-- crating course table
CREATE TABLE Courses(
CourseID VARCHAR(50) PRIMARY KEY,
CourseName VARCHAR(50),
InstructorName VARCHAR(100),
InstructorPhone VARCHAR(20),
Prerequisites VARCHAR(60)

);


-- crating grades table
CREATE TABLE Grades(
StudentID INT,
CourseID VARCHAR(50),
Grade INT,
PRIMARY KEY (StudentID, CourseID),
FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- inserting to the students table
INSERT INTO Students (StudentID, Name)
VALUES (201, "Siyanda Ndlovu"),
		(202, "Thandiwe Dlamini"),
        (203, "Lindiwe Mthembu"),
        (204, "Sipho Ntuli"),
        (205, "Themba Mhlongo"),
        (206, "Zanele Khumalo"),
        (207, "Sibusiso Mkhize"),
        (208, "Nomvula Mhlanga"),
        (209, "Andile Mthethwa"),
        (210, "Naledi Molefe");


-- inserting to the courses table 
INSERT INTO Courses(CourseID, CourseName, InstructorName, InstructorPhone, Prerequisites)
VALUES ("Math101", "Math", "Mr. Khumalo", "082-456-7890",NULL),
		("History202", "History", "Ms. Mokoena", "073-567-8901", NULL),
        ("Physics303", "Physics", "Mr. Khumalo", "082-456-7890", "Math Basics"),
        ("Chemistry404", "Chemistry", "Dr. Zulu", "084-678-9012", "Physics"),
        ("Biology505", "Biology", "Dr. Naidoo", "083-789-0123", NULL);
    
    
    
  -- inserting to the grades table      
INSERT INTO Grades(StudentID, CourseID, Grade)
VALUES (201, "Math101", 85),
		(201, "Physics303", 70),
        (202, "History202", 92),
        (202, "Math101", 88),
        (203, "Chemistry404", 75),
        (204, "Physics303", 78),
        (204, "Chemistry404", 80),
        (205, "Math101", 67),
        (205, "History202", 90),
        (206, "History202", 55),
        (207, "Biology505", 80),
        (207, "Chemistry404", 72),
        (208, "Biology505", 65),
        (208, "Physics303", 88),
        (209, "Physics303", 90),
        (210, "Chemistry404", 70),
        (210, "Biology505", 85);
        

-- Retrieve the names of all students and the courses they are taking
SELECT Students.Name AS "Student Name", Courses.CourseName AS "Course Name"
FROM Students INNER JOIN Courses;

-- Find all students who scored above 80% in Physics.
SELECT Students.Name AS "Student Name", Courses.CourseName AS "Course Name", Grades.Grade
FROM Students INNER JOIN Grades
ON Students.StudentID = Grades.StudentID
INNER JOIN Courses
ON Grades.CourseID =Courses.CourseID
WHERE Grades.Grade >80 AND Courses.CourseName = "Physics";


-- List all instructors along with the courses they teach.
SELECT Courses.InstructorName AS "Instructor Name", Courses.CourseName AS "Course Name"
FROM Courses;


-- Find courses that have "Math Basics" as a prerequisite.
SELECT Courses.CourseName AS "Course Name", Courses.Prerequisites AS Prerequisites
FROM Courses
WHERE Courses.Prerequisites = "Math Basics";


-- Count how many students are enrolled in each course.
SELECT Courses.CourseName AS "Course Name", COUNT(StudentID) AS "Enrolled Students"
FROM Courses LEFT JOIN Grades
ON Courses.CourseID = Grades.CourseID
GROUP BY Courses.CourseName
ORDER BY COUNT(StudentID);

-- Retrieve the phone numbers of instructors who teach more than one course.
SELECT Courses.InstructorName AS "Instructor Name",Courses.InstructorPhone AS "Instructor Phone", COUNT(*) AS "Number Count"
FROM Courses
GROUP BY InstructorName, InstructorPhone
HAVING COUNT(*) > 1;

-- List all students taking courses taught by "Ms. Mokoena."
SELECT Students.StudentID, Students.Name,Courses.CourseName
FROM Students INNER JOIN Grades
ON Students.StudentID = Grades.StudentID
INNER JOIN Courses 
ON Grades.CourseID = Courses.CourseID
WHERE Courses.InstructorName = 'Ms. Mokoena'
ORDER BY Students.StudentID;

-- Find students taking both "Physics" and "Chemistry."
SELECT Students.Name AS "Student Name"
FROM Students INNER JOIN Grades 
ON Students.StudentID =  Grades.StudentID
INNER JOIN Courses 
ON  Grades.CourseID = Courses.CourseID
WHERE Courses.CourseName IN ('Physics', 'Chemistry')
GROUP BY Students.StudentID, Students.Name
HAVING COUNT(Courses.CourseName) = 2;