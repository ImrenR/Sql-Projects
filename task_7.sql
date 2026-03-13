USE javacan;

-- Create table for books
CREATE TABLE books
(
    idno INT PRIMARY KEY,
    authorno INT NOT NULL,
    type_no INT NOT NULL,
    page_count INT NOT NULL DEFAULT 0
);

-- Insert sample book records
INSERT INTO books VALUES (1,26,3,368);
INSERT INTO books VALUES (2,6,1,220);
INSERT INTO books VALUES (3,18,6,311);
INSERT INTO books VALUES (4,22,4,135);
INSERT INTO books VALUES (5,10,3,179);
INSERT INTO books VALUES (6,25,1,242);
INSERT INTO books VALUES (7,22,3,346);
INSERT INTO books VALUES (8,28,6,389);
INSERT INTO books VALUES (9,6,4,259);
INSERT INTO books VALUES (10,27,2,391);
INSERT INTO books VALUES (11,19,6,89);
INSERT INTO books VALUES (12,6,4,265);
INSERT INTO books VALUES (13,20,6,160);
INSERT INTO books VALUES (14,27,5,383);
INSERT INTO books VALUES (15,5,6,188);

-- Create table for book types
CREATE TABLE book_types
(
    type_no INT PRIMARY KEY,
    type_name VARCHAR(10) NOT NULL
);

-- Insert sample book types
INSERT INTO book_types VALUES (1,'Drama');
INSERT INTO book_types VALUES (2,'Comedy');
INSERT INTO book_types VALUES (3,'Novel');
INSERT INTO book_types VALUES (4,'Story');
INSERT INTO book_types VALUES (5,'Research');
INSERT INTO book_types VALUES (6,'Fable');
INSERT INTO book_types VALUES (7,'Essay');

-- Create table for students
CREATE TABLE students
(
    student_no INT PRIMARY KEY,
    first_name VARCHAR(10) NOT NULL,
    last_name VARCHAR(10) NOT NULL,
    gender VARCHAR(1) NOT NULL,
    class VARCHAR(3) DEFAULT ''
);

-- Insert sample students
INSERT INTO students VALUES (1,'ahmet','cansever','m','10a');
INSERT INTO students VALUES (2,'niyazi','sevinc','m','11b');
INSERT INTO students VALUES (3,'ismail','sevinc','m','10b');
INSERT INTO students VALUES (4,'kenan','emin','m','9a');
INSERT INTO students VALUES (5,'sema','bakir','f','9b');
INSERT INTO students VALUES (6,'beyda','kara','f','9c');
INSERT INTO students VALUES (7,'betül','coskun','f','11a');
INSERT INTO students VALUES (8,'sema','rüzgar','f','9c');
INSERT INTO students VALUES (9,'fadime','dönmez','f','9a');
INSERT INTO students VALUES (10,'riza','koc','m','10b');
INSERT INTO students VALUES (11,'beyza','kabak','f','10b');
INSERT INTO students VALUES (12,'deniz','akcakaya','m','11a');
INSERT INTO students VALUES (13,'kemal','karapinar','m','11a');
INSERT INTO students VALUES (14,'derya','yilbur','f','10c');
INSERT INTO students VALUES (15,'filiz','akat','f','10a');
INSERT INTO students VALUES (16,'niyazi','dönmez','m','11a');
INSERT INTO students VALUES (17,'sema','sekmen','f','10b');

-- Select all tables to see the data
SELECT * FROM students;
SELECT * FROM books;
SELECT * FROM book_types;

-- Task01 -> Count how many students exist for each first name
SELECT first_name AS first_name,
       COUNT(*) AS count_of_students
FROM students
GROUP BY first_name
ORDER BY first_name;

-- Task02 -> Count how many students are in each class
SELECT class,
       COUNT(*) AS count_of_students
FROM students
GROUP BY class;

-- Task03 -> Count male and female students in each class
SELECT class AS class,
       gender AS gender,
       COUNT(*) AS count_students
FROM students
GROUP BY class, gender
ORDER BY class, gender;

-- Task05 -> List the books with the highest page count per type (currently just orders all)
SELECT bt.type_name,
       b.page_count
FROM books b
JOIN book_types bt
  ON b.type_no = bt.type_no
ORDER BY page_count DESC;

-- Task06 -> List the books with the lowest page count per type (currently just orders all)
SELECT bt.type_name,
       b.page_count
FROM books b
JOIN book_types bt
  ON b.type_no = bt.type_no
ORDER BY page_count ASC;

-- Task07 -> Count how many books exist for each type
SELECT bt.type_name,
       COUNT(*) AS book_count
FROM books b
JOIN book_types bt
  ON b.type_no = bt.type_no
GROUP BY bt.type_name
ORDER BY bt.type_name;