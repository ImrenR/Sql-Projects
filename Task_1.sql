USE javacan;

CREATE TABLE IF NOT EXISTS hospitals(  -- create a table named hospitals if it doesn't exist
    id CHAR(5) PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(10),
    private CHAR(1) -- private boolean, default true
);

INSERT INTO hospitals VALUES('H101','ACI MADEM HOSPITAL','ISTANBUL','Y');
INSERT INTO hospitals VALUES('H102','HASZEKI HOSPITAL','ISTANBUL','N');
INSERT INTO hospitals VALUES('H103','MEDIKOL HOSPITAL','IZMIR','Y');
INSERT INTO hospitals VALUES('H104','NEMORYIL HOSPITAL','ANKARA','Y');

CREATE TABLE departments
(
    dept_id CHAR(5) PRIMARY KEY,
    dept_name VARCHAR(20)
); 

INSERT INTO departments VALUES('DHL', 'Internal Medicine');
INSERT INTO departments VALUES('KBB', 'Ear-Nose-Throat');
INSERT INTO departments VALUES('NRJ', 'Neurology');
INSERT INTO departments VALUES('GAST', 'Gastroenterology');
INSERT INTO departments VALUES('KARD', 'Cardiology');
INSERT INTO departments VALUES('PSK', 'Psychiatry');
INSERT INTO departments VALUES('GOZ', 'Eye Diseases');

CREATE TABLE patients
(
    national_id CHAR(11) PRIMARY KEY,
    name VARCHAR(20),
    diagnosis VARCHAR(30)
);

INSERT INTO patients VALUES('12345678901', 'Ali Can','Diabetes');
INSERT INTO patients VALUES('45678901121', 'Ayşe Yılmaz','Hypertension');
INSERT INTO patients VALUES('78901123451', 'Steve Job','Pancreatitis');
INSERT INTO patients VALUES('12344321251', 'Tom Hanks','COVID19');

CREATE TABLE patient_records
(
    national_id CHAR(11) PRIMARY KEY,
    patient_name VARCHAR(20),
    hospital_name VARCHAR(50),
    department_name VARCHAR(20), 
    diagnosis VARCHAR(30)
); 

INSERT INTO patient_records VALUES('1111','NONAME','','','');
INSERT INTO patient_records VALUES('2222','NONAME','','','');
INSERT INTO patient_records VALUES('3333','NONAME','','','');
INSERT INTO patient_records VALUES('4444','NONAME','','','');
INSERT INTO patient_records VALUES('5555','NONAME','','','');

SELECT * FROM hospitals;
SELECT * FROM departments;
SELECT * FROM patients;
SELECT * FROM patient_records;

--[1] Update the record in patient_records with national_id '3333'
-- Set the fields as follows:
-- patient_name: 'Salvadore Dali'
-- hospital_name: 'John Hopins'
-- department_name: 'Neurology'
-- diagnosis: 'Parkinson'
-- national_id: '99991111222'
UPDATE patient_records
SET patient_name = 'Salvadore Dali',
    hospital_name='John Hopins',
    department_name='Neurology',
    diagnosis='Parkinson',
    national_id='99991111222'
WHERE national_id='3333';

--[2] Update the record in patient_records with national_id '1111'
-- Set the fields as follows:
-- patient_name: the name of 'Ali Can' from the patients table
-- hospital_name: the name of the hospital with id 'H104' from the hospitals table
-- department_name: the department_name of dept_id 'DHL' from the departments table
-- diagnosis: the diagnosis of 'Ali Can' from the patients table
-- national_id: the national_id of 'Ali Can' from the patients table
UPDATE patient_records
SET
    patient_name = (SELECT name FROM patients WHERE name='Ali Can'),
    hospital_name = (SELECT name FROM hospitals WHERE id='H104'),
    department_name = (SELECT dept_name FROM departments WHERE dept_id='DHL'),
    diagnosis = (SELECT diagnosis FROM patients WHERE name='Ali Can'),
    national_id = (SELECT national_id FROM patients WHERE name='Ali Can')
WHERE national_id='1111';
SELECT * FROM patient_records;

--[3] Update the record in patient_records with national_id '2222'
-- Set the fields as follows:
-- patient_name: the name of 'Ayşe Yılmaz' from the patients table
-- hospital_name: the name of the hospital with id 'H103' from the hospitals table
-- department_name: the department_name of dept_id 'KBB' from the departments table
-- diagnosis: the diagnosis of 'Tom Hanks' from the patients table
-- national_id: the national_id of 'Steve Job' from the patients table
UPDATE patient_records
SET
    patient_name = (SELECT name FROM patients WHERE name='Ayşe Yılmaz'),
    hospital_name = (SELECT name FROM hospitals WHERE id='H103'),
    department_name = (SELECT dept_name FROM departments WHERE dept_id='KBB'),
    diagnosis = (SELECT diagnosis FROM patients WHERE name='Tom Hanks'),
    national_id = (SELECT national_id FROM patients WHERE name='Steve Job')
WHERE national_id='2222';
SELECT * FROM patient_records;