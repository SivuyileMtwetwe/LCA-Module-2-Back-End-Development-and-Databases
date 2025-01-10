CREATE DATABASE university_db;

USE university_db;
 
CREATE TABLE Lecturers(
 lecturer_id INT PRIMARY KEY AUTO_INCREMENT,
 name VARCHAR(50),
 department VARCHAR(50),
 email VARCHAR(50));
 
INSERT INTO Lecturers(name ,department, email)
VALUES ('Dr. Alice Smith', 'Mathematics', 'alice.smith@university.com'),
    ('Prof. Bob Johnson', 'Physics', 'bob.johnson@university.com'),
    ('Dr. Charlie Brown', 'Computer Science', 'charlie.brown@university.com');
    
    
ALTER TABLE Lecturers
ADD office_location VARCHAR(50);

SET SQL_SAFE_UPDATES = 0;

UPDATE Lecturers
SET office_location = 'Room 101'
WHERE lecturer_id =1 ;

UPDATE Lecturers
SET office_location = 'Room 202'
WHERE lecturer_id = 2 ;

UPDATE Lecturers
SET office_location = 'Room 303'
WHERE lecturer_id = 3  ;


ALTER TABLE Lecturers 
MODIFY COLUMN department VARCHAR(50) DEFAULT 'General';


INSERT INTO Lecturers(name, email, office_location) 
VALUES ('Dr. Emily Green', 'emily.green@university.com', 'Room 404');

INSERT INTO Lecturers(name, email, office_location)
VALUES ('Proff. Sivuyile Mtwetwe', 'sivuyile.mtwetwe@engineering.com', 'Room 505');


UPDATE Lecturers
SET department = "Engineering"
WHERE  email LIKE "%@engineering.com";

UPDATE Lecturers
SET department = "Science"
WHERE  name LIKE "Dr.%";

DELETE FROM Lecturers 
WHERE name LIKE "%Bob Johnson";

ALTER TABLE Lecturers
ADD phone_number VARCHAR(50);

UPDATE Lecturers
SET phone_number = CASE
    WHEN name LIKE "%Alice%" THEN "123-456-7890"
    WHEN name LIKE "%Charlie%" THEN "987-654-3210"
    
END;


SET SQL_SAFE_UPDATES = 1;


