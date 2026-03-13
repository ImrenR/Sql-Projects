
USE javacan;

-- Create worker table
-- Columns: worker_id, worker_name, worker_salary
-- Primary key: worker_id (named worker_id_pk)
CREATE TABLE worker 
(
    worker_id CHAR(3),
    worker_name VARCHAR(50),
    worker_salary INT NOT NULL,
    CONSTRAINT worker_id_pk PRIMARY KEY (worker_id)
);

-- Insert 4 sample workers
INSERT INTO worker VALUES ('100','Oli Can', 12000);
INSERT INTO worker VALUES ('102','Veli Han', 2000);
INSERT INTO worker VALUES ('103','Ayse Kan', 7000);
INSERT INTO worker VALUES ('104','Angie Ocean', 8500);

-- View the table
SELECT * FROM worker;

-- -----------------------------------------------------------------------------
-- Task01 -> Update the worker whose salary is 12000:
--            change name to 'Ali Can' and id to '101'
-- -----------------------------------------------------------------------------
UPDATE worker
SET worker_name = 'Ali Can', worker_id = '101'
WHERE worker_salary = 12000;

SELECT * FROM worker;

-- -----------------------------------------------------------------------------
-- Task02 -> Increase Veli Han's salary to 20% less than the highest salary
-- -----------------------------------------------------------------------------
UPDATE worker
SET worker_salary = (
    (SELECT MAX(worker_salary) FROM (SELECT * FROM worker) AS w) * 0.8
)
WHERE worker_name = 'Veli Han';

-- -----------------------------------------------------------------------------
-- Task03 -> Decrease Ali Can's salary to 30% more than the lowest salary
-- -----------------------------------------------------------------------------
UPDATE worker
SET worker_salary = (
    (SELECT MIN(worker_salary) FROM (SELECT * FROM worker) AS a) * 1.3
)
WHERE worker_name = 'Ali Can';

-- -----------------------------------------------------------------------------
-- Task04 -> If a worker's salary is below the average, increase salary by 1000
-- -----------------------------------------------------------------------------
UPDATE worker
SET worker_salary = worker_salary + 1000
WHERE worker_salary < (
    SELECT AVG(worker_salary) FROM (SELECT worker_salary FROM worker) AS B
);

SELECT * FROM worker;

-- -----------------------------------------------------------------------------
-- Task05 -> If a worker's salary is below average, raise it to the average salary
-- -----------------------------------------------------------------------------
UPDATE worker
SET worker_salary = (
    SELECT AVG(worker_salary) FROM (SELECT worker_salary FROM worker) AS avg_salary
)
WHERE worker_salary < (
    SELECT AVG(worker_salary) FROM (SELECT worker_salary FROM worker) AS avg_salary
);

-- -----------------------------------------------------------------------------
-- Create people table
-- Columns: ssn, name, address
-- -----------------------------------------------------------------------------
CREATE TABLE people 
(
    ssn CHAR(9),
    name VARCHAR(50),
    address VARCHAR(80)
);

-- Insert sample data
INSERT INTO people VALUES (123456789, 'Mark Star', 'Florida');
INSERT INTO people VALUES (234567890, 'Angie Way', 'Virginia');
INSERT INTO people VALUES (345678901, 'Marry Tien', 'New Jersey');
INSERT INTO people (ssn, address) VALUES (456789012, 'Michigan');   -- name is NULL
INSERT INTO people (ssn, address) VALUES (567890123, 'California'); -- name is NULL
INSERT INTO people (ssn, name) VALUES (567890123, 'California');    -- address is NULL

SELECT * FROM people;

-- -----------------------------------------------------------------------------
-- Task06 -> Replace NULL names with 'name will be added later'
-- -----------------------------------------------------------------------------
UPDATE people
SET name = 'name will be added later'
WHERE name IS NULL;

-- -----------------------------------------------------------------------------
-- Task07 -> Replace NULL addresses with 'address will be added later'
-- -----------------------------------------------------------------------------
UPDATE people
SET address = 'address will be added later'
WHERE address IS NULL;

-- -----------------------------------------------------------------------------
-- Task08 -> Replace all NULL values in people table with 'to be inserted later'
--            Using COALESCE
-- -----------------------------------------------------------------------------
UPDATE people
SET name = COALESCE(name, 'to be inserted later'),
    address = COALESCE(address, 'to be inserted later');

SELECT * FROM people;