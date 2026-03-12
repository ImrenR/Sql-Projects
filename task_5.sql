USE javacan;

-- Create departments table
CREATE TABLE departments (
    department_id CHAR(10) PRIMARY KEY,
    department_name VARCHAR(14),
    location VARCHAR(13)
    -- CONSTRAINT department_pk PRIMARY KEY(department_id)
);

-- Insert sample departments
INSERT INTO departments VALUES ('10','ACCOUNTING','IST');
INSERT INTO departments VALUES ('20','MANAGEMENT','ANKARA');
INSERT INTO departments VALUES ('30','SALES','IZMIR');
INSERT INTO departments VALUES ('40','BUSINESS','BURSA');
INSERT INTO departments VALUES ('50','WAREHOUSE','YOZGAT');

-- Create personnel table
CREATE TABLE personnel (
    personnel_id INT(4),
    personnel_name VARCHAR(10),
    job_title VARCHAR(9),
    manager_id INT(4),
    start_date DATE,
    salary INT(7.2),
    department_id INT(2),
    CONSTRAINT personnel_pk PRIMARY KEY(personnel_id)
);

-- Insert sample personnel data
INSERT INTO personnel VALUES (7369,'AHMET','CLERK',7902,'1980-12-17',800,20);
INSERT INTO personnel VALUES (7499,'BAHATTIN','SALES',7698,'1981-02-02',1600,30);
INSERT INTO personnel VALUES (7521,'NESE','SALES',7698,'1981-02-22',1250,30);
INSERT INTO personnel VALUES (7566,'MUZAFFER','MANAGER',7839,'1981-02-04',2975,20);
INSERT INTO personnel VALUES (7654,'MUHAMMET','SALES',7698,'1981-09-09',1250,30);
INSERT INTO personnel VALUES (7698,'EMINE','MANAGER',7839,'1981-01-05',2850,30);
INSERT INTO personnel VALUES (7782,'HARUN','MANAGER',7839,'1981-09-06',2450,10);
INSERT INTO personnel VALUES (7788,'MESUT','ANALYST',7566,'1987-12-07',3000,20);
INSERT INTO personnel VALUES (7839,'SEHER','PRESIDENT',NULL,'1981-11-17',5000,10);
INSERT INTO personnel VALUES (7844,'DUYGU','SALES',7698,'1981-08-09',1500,30);
INSERT INTO personnel VALUES (7876,'ALI','CLERK',7788,'1987-07-13',1100,20);
INSERT INTO personnel VALUES (7900,'MERVE','CLERK',7698,'1981-03-12',950,30);
INSERT INTO personnel VALUES (7902,'NAZLI','ANALYST',7566,'1981-03-12',3000,20);
INSERT INTO personnel VALUES (7934,'EBRU','CLERK',7782,'1982-01-23',1300,10);
INSERT INTO personnel VALUES (7956,'SIBEL','ARCHITECT',7782,'1991-01-29',3300,60);
INSERT INTO personnel VALUES (7933,'ZEKI','ENGINEER',7782,'1987-01-26',4300,60);

-- View data
SELECT * FROM personnel;
SELECT * FROM departments;

-- -----------------------------------------------------------------------------
-- Task01 -> List names and departments of personnel working in SALES and ACCOUNTING
--           Sorted first by department, then by personnel name
-- -----------------------------------------------------------------------------
SELECT d.department_name,
       p.personnel_name
FROM departments d
JOIN personnel p
    ON d.department_id = p.department_id
WHERE d.department_name IN ('SALES','ACCOUNTING')  -- only these departments
ORDER BY d.department_name, p.personnel_name;       -- first by department, then by name

-- -----------------------------------------------------------------------------
-- Task02 -> List names, departments, and start dates of personnel working in
--           SALES, BUSINESS, and WAREHOUSE. Sorted by personnel name.
--           Note: Even if no personnel exists in a department, the department name should be shown
-- -----------------------------------------------------------------------------
SELECT p.personnel_name,
       d.department_name,
       p.start_date
FROM departments d
JOIN personnel p
    ON d.department_id = p.department_id
WHERE d.department_name IN ('SALES','BUSINESS','WAREHOUSE')
ORDER BY p.personnel_name;