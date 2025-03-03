DROP DATABASE IF EXISTS ComputerScienceDB;
CREATE DATABASE ComputerScienceDB;
USE ComputerScienceDB;
SET FOREIGN_KEY_CHECKS = 0;
SET SQL_SAFE_UPDATES = 0;

CREATE TABLE Employees (
    emplid INT PRIMARY KEY,
    ssn CHAR(9) UNIQUE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    middle_initial CHAR(1),
    last_name VARCHAR(50) NOT NULL,
    phone CHAR(9),
    email VARCHAR(100) UNIQUE NOT NULL,
    home_address VARCHAR(255),
    salary DECIMAL(10,2),
    office_location VARCHAR(50) CHECK (office_location IN ('Shuster', 'Gilet', 'Davis Hall')),
    date_of_hire DATE NOT NULL,
    title VARCHAR(50),
    role VARCHAR(20) CHECK (role IN ('Faculty', 'Staff')),
    type VARCHAR(50)
);

CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL UNIQUE,
    phone CHAR(9),
    office_location VARCHAR(50) CHECK (office_location IN ('Shuster', 'Gilet', 'Davis Hall')),
    chairperson_emplid INT,
    chairperson_start_date DATE,
    secretary_emplid INT,
    FOREIGN KEY (chairperson_emplid) REFERENCES Employees(emplid),
    FOREIGN KEY (secretary_emplid) REFERENCES Employees(emplid)
);

CREATE TABLE Programs (
    program_id INT PRIMARY KEY,
    program_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Students (
    emplid INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    middle_initial CHAR(1),
    last_name VARCHAR(50) NOT NULL,
    dob DATE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone CHAR(9),
    home_address VARCHAR(255)
);

CREATE TABLE StudentProgram (
    student_emplid INT,
    program_id INT,
    type VARCHAR(10) CHECK (type IN ('Major','Minor')),
    PRIMARY KEY (student_emplid, program_id, type),
    FOREIGN KEY (student_emplid) REFERENCES Students(emplid),
    FOREIGN KEY (program_id) REFERENCES Programs(program_id)
);

CREATE TABLE Courses (
    course_id VARCHAR(10) PRIMARY KEY,
    course_name VARCHAR(100) UNIQUE NOT NULL,
    description VARCHAR(500),
    prerequisites VARCHAR(500),
    course_credits INT CHECK (course_credits > 0)
);

CREATE TABLE CourseSection (
    course_id VARCHAR(10),
    section_id INT,
    faculty_emplid INT,
    semester_year VARCHAR(20),
    room_number VARCHAR(20),
    schedule VARCHAR(100),
    PRIMARY KEY (course_id, section_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    FOREIGN KEY (faculty_emplid) REFERENCES Employees(emplid)
);

CREATE TABLE Enrollment (
    enrollment_id INT PRIMARY KEY,
    student_emplid INT,
    course_id VARCHAR(10),
    section_id INT,
    status VARCHAR(10) CHECK (status IN ('active','dropped','completed')),
    grade CHAR(2),
    FOREIGN KEY (student_emplid) REFERENCES Students(emplid),
    FOREIGN KEY (course_id, section_id) REFERENCES CourseSection(course_id, section_id)
);

CREATE TABLE CheatingIncidents (
    incident_id INT PRIMARY KEY,
    student_emplid INT,
    course_id VARCHAR(10),
    section_id INT,
    incident_status VARCHAR(50),
    description VARCHAR(500),
    FOREIGN KEY (student_emplid) REFERENCES Students(emplid),
    FOREIGN KEY (course_id, section_id) REFERENCES CourseSection(course_id, section_id)
);

INSERT INTO Employees (emplid, ssn, first_name, middle_initial, last_name, phone, email, home_address, salary, office_location, date_of_hire, title, role, type)
VALUES
(58392014, '123456789', 'Arjun', 'A', 'McAllister', '718555123', 'arjun.mcallister@univ.edu', '12 Rosewood Ln', 92000.00, 'Shuster', '2010-08-15', 'Professor', 'Faculty', 'Full'),
(23918475, '987654321', 'Fatima', 'B', 'Sarno', '646555987', 'fatima.sarno@univ.edu', '34 Crimson Place', 85000.00, 'Gilet', '2012-01-10', 'Associate Professor', 'Faculty', 'Associate'),
(49712583, '456789123', 'Liang', 'C', 'Takahashi', '212555456', 'liang.takahashi@univ.edu', '56 Maple City', 78000.00, 'Davis Hall', '2015-03-20', 'Assistant Professor', 'Faculty', 'Assistant'),
(31029845, '112233445', 'Nadia', 'D', 'Vasquez', '347555112', 'nadia.vasquez@univ.edu', '78 Lilac Drive', 50000.00, 'Shuster', '2017-05-10', 'Secretary', 'Staff', NULL),
(77541239, '554433221', 'Sergio', 'E', 'Kazmi', '929555554', 'sergio.kazmi@univ.edu', '90 Juniper Street', 52000.00, 'Gilet', '2011-09-01', 'Admin Assistant', 'Staff', NULL),
(66458329, '777888999', 'Iris', 'F', 'Chandler', '718555777', 'iris.chandler@univ.edu', '23 Heather City', 95000.00, 'Davis Hall', '2009-06-25', 'Professor', 'Faculty', 'Full'),
(22094831, '333222111', 'Jamal', 'G', 'Shen', '646555333', 'jamal.shen@univ.edu', '451 Orchid Road', 74000.00, 'Shuster', '2014-11-11', 'Associate Professor', 'Faculty', 'Associate'),
(88932014, '999888777', 'Priya', 'H', 'Alvarez', '212555999', 'priya.alvarez@univ.edu', '77 Coral Drive', 48000.00, 'Gilet', '2013-07-07', 'Office Manager', 'Staff', NULL),
(55319042, '111999333', 'Hassan', 'I', 'Dubois', '347555111', 'hassan.dubois@univ.edu', '62 Fern Avenue', 81000.00, 'Davis Hall', '2016-12-02', 'Lecturer', 'Faculty', 'Lecturer'),
(41230985, '222444666', 'Keiko', 'J', 'Rosenberg', '929555222', 'keiko.rosenberg@univ.edu', '19 Indigo Street', 46000.00, 'Shuster', '2018-01-15', 'Lab Technician', 'Staff', NULL),
(10394827, '666555444', 'Amira', 'K', 'O\'Connell', '718555666', 'amira.oconnell@univ.edu', '500 Monarch Drive', 72000.00, 'Gilet', '2019-02-20', 'Assistant Professor', 'Faculty', 'Assistant'),
(90213458, '444666555', 'Gerard', 'L', 'Mukherjee', '646555444', 'gerard.mukherjee@univ.edu', '28 Coral Reef Blvd', 57000.00, 'Davis Hall', '2011-10-05', 'IT Support', 'Staff', NULL),
(76123908, '555222444', 'Yvonne', 'M', 'Kowalski', '212555555', 'yvonne.kowalski@univ.edu', '70 Elmwood Drive', 99000.00, 'Shuster', '2005-09-09', 'Professor', 'Faculty', 'Full'),
(38420971, '999000111', 'Tariq', 'N', 'Ahn', '347555999', 'tariq.ahn@univ.edu', '155 Poppy Lane', 78000.00, 'Gilet', '2020-03-01', 'Assistant Professor', 'Faculty', 'Assistant'),
(52930147, '123123123', 'Marisol', 'O', 'Dasgupta', '929555123', 'marisol.dasgupta@univ.edu', '88 Sunrise Ave', 55000.00, 'Davis Hall', '2015-06-15', 'Financial Officer', 'Staff', NULL);

INSERT INTO Department (dept_id, dept_name, phone, office_location, chairperson_emplid, chairperson_start_date, secretary_emplid)
VALUES
(1, 'Computer Science', '555000111', 'Shuster', 58392014, '2020-01-01', 31029845);


INSERT INTO Programs (program_id, program_name)
VALUES
(10, 'Computer Science'),
(11, 'Computer Information Systems'),
(12, 'Cybersecurity'),
(13, 'Data Science'),
(14, 'Artificial Intelligence'),
(15, 'Software Engineering'),
(16, 'Game Development'),
(17, 'Information Technology'),
(18, 'Networking'),
(19, 'Mobile Programming');

INSERT INTO Students (emplid, first_name, middle_initial, last_name, dob, email, phone, home_address)
VALUES
(72019384, 'Ayaan', 'A', 'Khalid', '2000-05-15', 'ayaan.khalid@univ.edu', '914555001', '4424 Brannon Avenue'),
(81472930, 'Beatriz', 'B', 'Novak', '1999-10-20', 'beatriz.novak@univ.edu', '914555002', '3540 Dale Avenue'),
(65748290, 'Ciro', 'C', 'Ribeiro', '1998-12-30', 'ciro.ribeiro@univ.edu', '914555003', '3703 Golf Course Drive'),
(19384756, 'Delphine', 'D', 'Ito', '2001-01-05', 'delphine.ito@univ.edu', '914555004', '3709 Broadway Street'),
(48920137, 'Esteban', 'E', 'Velasquez', '2000-07-11', 'esteban.velasquez@univ.edu', '914555005', '183 Sundown Lane'),
(54019283, 'Farida', 'F', 'Yamamoto', '1999-11-21', 'farida.yamamoto@univ.edu', '914555006', '1927 Coventry Court'),
(10293847, 'Giacomo', 'G', 'DeCarlo', '1998-09-09', 'giacomo.decarlo@univ.edu', '914555007', '2651 Washington Avenue'),
(61028374, 'Hyejin', 'H', 'Sawyer', '2001-03-03', 'hyejin.sawyer@univ.edu', '917555008', '581 Chatham Way'),
(39481720, 'Ibrahim', 'I', 'Mehdi', '2000-08-25', 'ibrahim.mehdi@univ.edu', '917555009', '3700 North Bend River Road'),
(75920138, 'Jing', 'J', 'Moreno', '1999-11-11', 'jing.moreno@univ.edu', '917555010', '698 Francis Mine'),
(84201395, 'Karolina', 'K', 'Olejniczak', '1998-04-14', 'karolina.olejniczak@univ.edu', '917555011', '58122 Chatham Way'),
(13094827, 'Lamar', 'L', 'Bhattacharya', '2000-02-22', 'lamar.bhattacharya@univ.edu', '917555012', '4193 Roy Alley'),
(92384710, 'Marina', 'M', 'Szewczyk', '1999-06-06', 'marina.szewczyk@univ.edu', '917555013', '413 Cool Alley'),
(38572901, 'Nikhil', 'N', 'Fujita', '1998-10-10', 'nikhil.fujita@univ.edu', '917555014', '493 Smart Alley'),
(70418293, 'Olesya', 'O', 'Zhang', '2001-09-19', 'olesya.zhang@univ.edu', '917555015', '393 Shadowmar Drive');


INSERT INTO StudentProgram (student_emplid, program_id, type)
VALUES
(72019384, 10, 'Major'),
(72019384, 14, 'Minor'),
(81472930, 10, 'Major'),
(65748290, 11, 'Major'),
(19384756, 12, 'Major'),
(19384756, 10, 'Minor'),
(48920137, 13, 'Major'),
(54019283, 14, 'Major'),
(10293847, 10, 'Major'),
(10293847, 15, 'Minor'),
(61028374, 16, 'Major'),
(39481720, 10, 'Major'),
(75920138, 17, 'Major'),
(84201395, 18, 'Major'),
(13094827, 10, 'Major'),
(92384710, 19, 'Major'),
(38572901, 10, 'Major'),
(70418293, 12, 'Major');


INSERT INTO Courses (course_id, course_name, description, prerequisites, course_credits)
VALUES
('CS101', 'Intro to Programming', 'Introduction to programming concepts', '', 3),
('CS102', 'Data Structures', 'Data structures and algorithms intro', 'CS101', 3),
('CS103', 'Computer Architecture', 'Basics of computer hardware design', 'CS101', 3),
('CS104', 'Operating Systems', 'Study of Operating System principles', 'CS103', 4),
('CS105', 'Database Systems', 'Intro to databases', 'CS101', 3),
('CS106', 'Computer Networks', 'Networking fundamentals', 'CS102', 4),
('CS107', 'Algorithms', 'Algorithm design and complexity', 'CS102', 3),
('CS108', 'Web Development', 'Frontend and backend basics', 'CS101', 3),
('CS109', 'Cybersecurity Fundamentals', 'Basic cybersecurity principles', 'CS101', 4),
('CS110', 'Machine Learning Basics', 'Intro to Machine Learning concepts', 'CS107', 3),
('CS111', 'Artificial Intelligence', 'Core AI concepts', 'CS110', 3),
('CS112', 'Data Science Intro', 'Basics of data analysis', 'CS101', 4),
('CS113', 'Advanced Programming', 'Advanced coding techniques', 'CS101', 3),
('CS114', 'Software Engineering', 'Software dev methodologies', 'CS102', 3),
('CS115', 'Mobile App Development', 'Building mobile applications', 'CS101', 3);


INSERT INTO CourseSection (course_id, section_id, faculty_emplid, semester_year, room_number, schedule)
VALUES
('CS101', 1, 58392014, 'Fall 2024', 'R101', 'Mon 10:00-12:40'),
('CS101', 2, 23918475, 'Fall 2024', 'R102', 'Wed 10:00-12:40'),
('CS102', 1, 49712583, 'Fall 2024', 'R103', 'Tue 09:00-11:40'),
('CS103', 1, 58392014, 'Fall 2024', 'R101', 'Mon 03:00-05:40'),
('CS104', 1, 23918475, 'Fall 2024', 'R102', 'Thu 10:00-12:40'),
('CS105', 1, 66458329, 'Fall 2024', 'R104', 'Fri 08:00-10:40'),
('CS106', 1, 22094831, 'Fall 2024', 'R105', 'Mon 08:00-10:40'),
('CS107', 1, 10394827, 'Fall 2024', 'R106', 'Wed 04:00-06:40'),
('CS108', 1, 76123908, 'Fall 2024', 'R107', 'Tue 13:00-15:40'),
('CS109', 1, 55319042, 'Fall 2024', 'R108', 'Thu 08:00-10:40'),
('CS110', 1, 49712583, 'Fall 2024', 'R103', 'Mon 16:00-18:40'),
('CS111', 1, 58392014, 'Fall 2024', 'R101', 'Tue 04:00-6:40'),
('CS112', 1, 22094831, 'Fall 2024', 'R105', 'Fri 10:00-12:40'),
('CS113', 1, 76123908, 'Fall 2024', 'R107', 'Wed 09:00-11:40'),
('CS114', 1, 55319042, 'Fall 2024', 'R108', 'Thu 02:00-03:40');


INSERT INTO Enrollment (enrollment_id, student_emplid, course_id, section_id, status, grade)
VALUES
(1, 72019384, 'CS101', 1, 'active', NULL),
(2, 72019384, 'CS105', 1, 'active', NULL),
(3, 81472930, 'CS101', 2, 'active', NULL),
(4, 81472930, 'CS102', 1, 'active', NULL),
(5, 65748290, 'CS101', 1, 'dropped', NULL),
(6, 19384756, 'CS103', 1, 'active', NULL),
(7, 48920137, 'CS101', 2, 'completed', 'A'),
(8, 54019283, 'CS105', 1, 'completed', 'B'),
(9, 10293847, 'CS106', 1, 'active', NULL),
(10, 61028374, 'CS101', 1, 'active', NULL),
(11, 39481720, 'CS107', 1, 'active', NULL),
(12, 75920138, 'CS108', 1, 'active', NULL),
(13, 84201395, 'CS109', 1, 'active', NULL),
(14, 13094827, 'CS110', 1, 'completed', 'A'),
(15, 92384710, 'CS111', 1, 'active', NULL);

INSERT INTO CheatingIncidents (incident_id, student_emplid, course_id, section_id, incident_status, description)
VALUES
(1, 72019384, 'CS101', 1, 'Reported', 'Copied another student\s answer'),
(2, 65748290, 'CS101', 1, 'Under Investigation', 'Plagiarism detected'),
(3, 81472930, 'CS102', 1, 'Resolved', 'Found innocent when asked for details about incident');

-- 1. Write simple select statements that retrieve records from the tables without any condition

SELECT * FROM Employees;
SELECT * FROM Department;
SELECT * FROM Programs;
SELECT * FROM Students;
SELECT * FROM StudentProgram;
SELECT * FROM Courses;
SELECT * FROM CourseSection;
SELECT * FROM Enrollment;
SELECT * FROM CheatingIncidents;

--  Write 1 simple select statement that retrieves records from all the tables using some simple condition.


SELECT * FROM Employees -- retrieve employees whose salary is greater than 72000
WHERE salary > 72000;

SELECT * FROM Department -- retrieve departments only located in 'Shuster'
WHERE office_location = 'Shuster';

SELECT * FROM Programs -- retrieve programs that have "com" in their name
WHERE program_name LIKE '%com%';

-- Students: Retrieve students born before the year 2000
SELECT * FROM Students
WHERE dob < '2000-01-01';

-- StudentProgram: Retrieve student-program records where the type is 'Major'
SELECT * FROM StudentProgram
WHERE type = 'Major';

SELECT * FROM Courses -- retrieve courses with only 3 credits
WHERE course_credits = 3;

SELECT * FROM CourseSection -- retrieve courses where the semester year is fall 2024
WHERE semester_year = 'Fall 2024';

SELECT * FROM Enrollment -- retrieve the status for enrollments that are active 
WHERE status = 'active';

SELECT * FROM CheatingIncidents -- retrieve only reported incidents
WHERE incident_status = 'Reported';


SELECT d.dept_name, e.first_name, e.last_name AS chairperson_name -- retrieve all Departments along with the Chairperson’s name
FROM Department d 
JOIN Employees e ON d.chairperson_emplid = e.emplid; -- join employees table on the employee ID matching the chairperson_emplid in the department table

SELECT s.first_name, s.last_name, p.program_name AS major_program
FROM Students s
JOIN StudentProgram sp ON s.emplid = sp.student_emplid -- join studentprogram table with the student ID to associate students with their programs
JOIN Programs p ON sp.program_id = p.program_id -- join programs table to retrieve the program names for the students
WHERE sp.type = 'Major'; -- only include major records

SELECT s.first_name, s.last_name, c.course_name
FROM Enrollment e
JOIN Students s ON e.student_emplid = s.emplid -- join students table to get the students first and last name based on the student ID of the enrollment table
JOIN CourseSection cs ON e.course_id = cs.course_id AND e.section_id = cs.section_id -- join coursesection table to match the course and section information for the enrollment
JOIN Courses c ON cs.course_id = c.course_id -- join courses table to get the course name using the course ID from course section
WHERE c.course_id = 'CS101';

-- Write a query that retrieves students who have all A letter grades

SELECT s.first_name, s.last_name
FROM Students s
JOIN Enrollment e ON s.emplid = e.student_emplid
GROUP BY s.emplid, s.first_name, s.last_name
HAVING MIN(e.grade) = 'A' AND MAX(e.grade) = 'A';


-- Write a query to retrieve the names of students who have not taken more than 5 courses.

SELECT s.first_name, s.last_name
FROM Students s
JOIN Enrollment e ON s.emplid = e.student_emplid
GROUP BY s.emplid, s.first_name, s.last_name
HAVING COUNT(e.course_id) <= 5;

-- Write 6 update statements that update certain records based on some conditions

UPDATE Employees
SET salary = salary + 5000
WHERE salary < 60000;

UPDATE Students
SET email = REPLACE(email, '@mail.edu', '@univ.edu')
WHERE email LIKE '%@mail.edu';

UPDATE Department
SET secretary_emplid = 31029845
WHERE dept_name = 'Computer Science'
  AND chairperson_start_date < '2021-01-01';

UPDATE Courses
SET prerequisites = 'CS101'
WHERE course_id = 'CS105' AND prerequisites = '';

UPDATE Enrollment
SET grade = 'B'
WHERE status = 'completed' AND grade IS NULL;

UPDATE CheatingIncidents
SET incident_status = 'Resolved'
WHERE incident_status = 'Under Investigation';


--  Write 3 statements that delete a record from a table based on some condition.

DELETE FROM Employees
WHERE emplid = 58392014;

DELETE FROM Courses
WHERE course_id = 'CS115';

DELETE FROM Enrollment
WHERE enrollment_id = 10;

--  Write a query to retrieve the names of students who were caught cheating in at least one course.

SELECT DISTINCT Students.first_name, Students.last_name
FROM Students
JOIN CheatingIncidents ON Students.emplid = CheatingIncidents.student_emplid;

-- Write a query to retrieve the names of instructors who reported most cheating incidents.

SELECT Employees.first_name, Employees.last_name, COUNT(*) AS total_incidents
FROM CheatingIncidents
JOIN CourseSection -- join the coursesection table to link each cheating incident with the corresponding course and section
    ON CheatingIncidents.course_id = CourseSection.course_id 
    AND CheatingIncidents.section_id = CourseSection.section_id
JOIN Employees -- join employees table to get the faculty members details by matching the faculty employee ID with the course section's faculty employee ID
    ON CourseSection.faculty_emplid = Employees.emplid
GROUP BY Employees.emplid, Employees.first_name, Employees.last_name
ORDER BY total_incidents DESC;

-- Write a query that returns a count on all students who have never earned any A grade in all the courses they have taken.

SELECT COUNT(*) AS count_of_students_no_A
FROM Students s
WHERE s.emplid NOT IN (
    SELECT e.student_emplid
    FROM Enrollment e
    WHERE e.grade = 'A'
);

-- Write a query to retrieve the names of an employee who gets paid more than any other.

SELECT first_name, last_name
FROM Employees
WHERE salary = (SELECT MAX(salary) FROM Employees);

-- Write a query to retrieve the names of an employees who gets paid the least

SELECT first_name, last_name
FROM Employees
WHERE salary = (SELECT MIN(salary) FROM Employees);


-- Write a query to retrieve employees who make not more than 5000 than the average salaries of all the employees.

SELECT first_name, last_name
FROM Employees
WHERE salary <= (SELECT AVG(salary) FROM Employees) + 5000;
