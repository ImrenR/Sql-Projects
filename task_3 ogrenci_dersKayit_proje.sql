-- A university course registration database is to be designed.
-- Students have first name, last name, email, phone number, and department information.
-- These students will be registered for courses with defined course hours.
-- Design a database to store this information.

USE javacan;

-- Create the student table
CREATE TABLE student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    email VARCHAR(50) DEFAULT '',
    phone VARCHAR(10) DEFAULT '',
    department_id INT NOT NULL DEFAULT 0
);

-- Create the department table
CREATE TABLE department (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(50)
);

-- Create the course table
CREATE TABLE course (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(50),
    course_hours INT
);

-- Create the student-course junction table (many-to-many)
CREATE TABLE student_course (
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    PRIMARY KEY (student_id, course_id)
);

-- -----------------------------------------------------
-- Sample queries to check data

SELECT * FROM student;

SELECT department_id, COUNT(*) 
FROM student
GROUP BY department_id;

SELECT * FROM department;

-- Insert sample courses
INSERT INTO course (course_name, course_hours) VALUES ('Mathematics', '3');
INSERT INTO course (course_name, course_hours) VALUES ('Physics', '2');
INSERT INTO course (course_name, course_hours) VALUES ('Chemistry', '2');
INSERT INTO course (course_name, course_hours) VALUES ('Geometry', '3');
INSERT INTO course (course_name, course_hours) VALUES ('Software', '5');
INSERT INTO course (course_name, course_hours) VALUES ('SDET', '4');

SELECT * FROM course;

-- Insert sample student-course registrations
INSERT INTO student_course (student_id, course_id) VALUES ('1', '2');
INSERT INTO student_course (student_id, course_id) VALUES ('3', '2');
INSERT INTO student_course (student_id, course_id) VALUES ('4', '3');
INSERT INTO student_course (student_id, course_id) VALUES ('4', '1');
INSERT INTO student_course (student_id, course_id) VALUES ('5', '1');
INSERT INTO student_course (student_id, course_id) VALUES ('3', '5');
INSERT INTO student_course (student_id, course_id) VALUES ('2', '2');
INSERT INTO student_course (student_id, course_id) VALUES ('6', '2');
INSERT INTO student_course (student_id, course_id) VALUES ('3', '1');
INSERT INTO student_course (student_id, course_id) VALUES ('4', '2');
INSERT INTO student_course (student_id, course_id) VALUES ('5', '3');
INSERT INTO student_course (student_id, course_id) VALUES ('7', '2');
INSERT INTO student_course (student_id, course_id) VALUES ('7', '3');
INSERT INTO student_course (student_id, course_id) VALUES ('1', '5');

SELECT * FROM student_course;

-- Insert sample departments
INSERT INTO department (department_name) VALUES ('Software');
INSERT INTO department (department_name) VALUES ('Engineering');
INSERT INTO department (department_name) VALUES ('Philosophy');
INSERT INTO department (department_name) VALUES ('Literature');
INSERT INTO department (department_name) VALUES ('Medicine');
INSERT INTO department (department_name) VALUES ('Software');

SELECT * FROM department;

-- Insert sample students
INSERT INTO student (first_name, last_name, department_id) VALUES ('Ali', 'Veli', 1);
INSERT INTO student (first_name, last_name, department_id) VALUES ('Okan', 'Coka', 2);
INSERT INTO student (first_name, last_name, department_id) VALUES ('Dogu', 'Bati', 3);
INSERT INTO student (first_name, last_name, department_id) VALUES ('Imren', 'Irem', 4);
INSERT INTO student (first_name, last_name, department_id) VALUES ('Ozgur', 'Aydin', 5);
INSERT INTO student (first_name, last_name, department_id) VALUES ('Meral', 'Kucuk', 6);

SELECT * FROM student;

-- -----------------------------------------------------------------------------
-- Task01 -> List students with their departments (subquery solution)
SELECT first_name, last_name,
       (SELECT department_name FROM department WHERE department.department_id = student.department_id) AS department
FROM student;

-- Task01 -> Alternative solution using JOIN
SELECT
    s.first_name,
    s.last_name,
    d.department_name
FROM student s
JOIN department d
ON s.department_id = d.department_id;

-- Task02 -> List the number of course registrations per department
SELECT d.department_name,
       COUNT(sc.course_id) AS course_registration_count
FROM department d
JOIN student s ON d.department_id = s.department_id
JOIN student_course sc ON s.student_id = sc.student_id
GROUP BY d.department_name;

-- Task03 -> List the number of students registered for each course
SELECT c.course_name,
       COUNT(sc.student_id) AS student_count
FROM course c
JOIN student_course sc ON c.course_id = sc.course_id
GROUP BY c.course_name;

-- Task04 -> List students not registered for any course
-- Method 1: LEFT JOIN
SELECT s.first_name,
       s.last_name
FROM student s
LEFT JOIN student_course sc ON s.student_id = sc.student_id
WHERE sc.course_id IS NULL;

-- Method 2: NOT IN
SELECT first_name,
       last_name
FROM student
WHERE student_id NOT IN (
    SELECT student_id
    FROM student_course
);

-- Task05 -> List the number of courses each student is registered for
SELECT s.first_name,
       s.last_name,
       COUNT(sc.course_id) AS course_count
FROM student s
LEFT JOIN student_course sc ON s.student_id = sc.student_id
GROUP BY s.student_id, s.first_name, s.last_name;

-- Task06 -> List total course hours registered per department
SELECT d.department_name,
       SUM(c.course_hours) AS total_course_hours
FROM department d
JOIN student s ON d.department_id = s.department_id
JOIN student_course sc ON s.student_id = sc.student_id
JOIN course c ON c.course_id = sc.course_id
GROUP BY d.department_name;

-- Task07 -> List the department with the highest total course hours
SELECT department_name, total_course_hours
FROM (
    SELECT d.department_name,
           SUM(c.course_hours) AS total_course_hours
    FROM department d
    JOIN student s ON d.department_id = s.department_id
    JOIN student_course sc ON sc.student_id = s.student_id
    JOIN course c ON c.course_id = sc.course_id
    GROUP BY d.department_name
) AS department_totals
ORDER BY total_course_hours DESC
LIMIT 1;