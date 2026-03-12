USE javacan;

-- Create the employees table
CREATE TABLE employees
(
    id CHAR(4),
    name VARCHAR(50),
    salary INT(5),
    CONSTRAINT id_pk PRIMARY KEY (id)
);

-- Insert employee records
INSERT INTO employees VALUES('1001', 'Ahmet Aslan', 7000); 
INSERT INTO employees VALUES('1002', 'Mehmet Yilmaz', 12000);
INSERT INTO employees VALUES('1003', 'Meryem', 7215);
INSERT INTO employees VALUES('1004', 'Veli Han', 5000);

-- Create the families table
CREATE TABLE families
(
    id CHAR(4),
    num_children VARCHAR(50),
    extra_income INT(5),
    CONSTRAINT id_fk FOREIGN KEY (id) REFERENCES employees(id)
);

-- Insert family records
INSERT INTO families VALUES('1001', 4, 2000);
INSERT INTO families VALUES('1002', 2, 1500); 
INSERT INTO families VALUES('1003', 1, 2200);
INSERT INTO families VALUES('1004', 3, 2400);

-- View the tables
SELECT * FROM employees;
SELECT * FROM families;

-- Task01 -> Give Veli Han a 20% raise
UPDATE employees
SET salary = salary * 1.2
WHERE name = 'Veli Han';

-- Task02 -> Give a 20% raise to employees whose salary is below average
UPDATE employees
SET salary = salary * 1.2
WHERE salary < (
    SELECT AVG(salary) 
    FROM (SELECT salary FROM employees) AS x
);
SELECT * FROM employees;

-- Task03 -> List employees' names and number of children
SELECT id, name, 
       (SELECT num_children FROM families WHERE employees.id = families.id) AS num_children
FROM employees;

-- Task04 -> List employees' names and total income
-- total_income = employee.salary + family.extra_income
SELECT id, name, 
       (SELECT salary + extra_income FROM families WHERE employees.id = families.id) AS total_income
FROM employees;

-- Task05 -> If a family's per capita income is less than 2000 TL, give the employee an additional 10% family aid raise
-- per_capita_income = total_income / (num_children + 2) (parents included)

-- Corrected Task05:
UPDATE employees e, families f
SET e.salary = e.salary * 1.10
WHERE e.id = f.id
  AND (e.salary + f.extra_income) / (f.num_children + 2) < 2000;

-- After the update, you can view the results:
SELECT * FROM employees;