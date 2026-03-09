-- Create işçi tablosu alanları worker_id,work_name,work_salary şeklindedir.
-- worker_id, worker_id_pk adında primary key sahip olacak
-- İşçiler tablosuna 4 kayıt ekleyin
-- Konsoldaki tabloya bakın


CREATE TABLE worker 
(

    worker_id char(3),
    worker_name VARCHAR(50),
    worker_salary int not null,
     CONSTRAINT worker_id_pk PRIMARY KEY (worker_id)

);

DROP TABLE worker;

INSERT INTO WORKER VALUES ('100','oli can', 12000);
INSERT INTO WORKER VALUES ('102','Veli Han', 2000);
INSERT INTO WORKER VALUES ('103','Ayse Kan', 7000);
INSERT INTO WORKER VALUES ('104', 'Angie Ocean', 8500);

SELECT * FROM WORKER ;

--  Task01 -> maaşı 12000 olan çalisanin adini 'Ali Can' ve id'sini 101 olarak değistiren query create ediniz.
 UPDATE WORKER 
SET worker_name = 'Ali Can',
    worker_id = '101'
WHERE worker_salary = 1200 ;    

SELECT * FROM WORKER ;


-- Task02 -> Veli Han'ın maaşını en yüksek maaştan yüzde 20 daha azına artıran query create ediniz.
UPDATE WORKER 
SET  worker_salary = ((SELECT max(worker_salary) FROM (SELECT * FROM WORKER) AS W) *0.80 )
WHERE worker_name = 'Veli Han';

SELECT * FROM WORKER ;


-- Task03 -> Ali Can'ın maaşını en düşük maaştan yüzde 30 daha fazla düşüren query create ediniz.
UPDATE WORKER 
SET worker_salary = (SELECT min(worker_salary)*1.30 FROM (SELECT * FROM WORKER) AS M)      
WHERE worker_name = 'Ali Can';

SELECT * FROM WORKER ;
-- Task04 -> Calisanin Maaşi ortalama maaştan düşükse maaşları 1000 artıran query create ediniz.
UPDATE WORKER 
SET worker_salary = worker_salary + 1000
WHERE worker_salary < (SELECT AVG(worker_salary) FROM (SELECT worker_salary FROM WORKER) AS B);

SELECT * FROM WORKER ;
-- Task05 -> Maaşın ortalama maaştan az olması durumunda maaşları ortalama maaşa eşit artıran query create ediniz.
UPDATE WORKER 
SET worker_salary = (SELECT AVG(worker_salary) FROM (select worker_salary from WORKER)as a )+worker_salary
WHERE worker_salary < (SELECT AVG(worker_salary) FROM (select worker_salary from WORKER)as a );

SELECT * FROM WORKER ;


CREATE TABLE people 
(

    ssn CHAR (9),
    name VARCHAR(50),
    address VARCHAR(80)

);




INSERT INTO PEOPLE VALUES (123456789, 'Mark Star', 'Florida');
INSERT INTO PEOPLE VALUES (234567890, 'Angie Way', 'Virginia');
INSERT INTO PEOPLE VALUES (345678901, 'Marry Tien', 'New Jersey');
INSERT INTO PEOPLE (ssn, address) VALUES (456789012, 'Michigan');
INSERT INTO PEOPLE (ssn, address) VALUES (567890123, 'California');
INSERT INTO PEOPLE (ssn, name) VALUES (567890123, 'California');

SELECT * FROM PEOPLE ;


-- Task06 -> Boş adları "ad daha sonra eklenecek" olarak değiştiren query create ediniz.
UPDATE PEOPLE 
SET name = 'Name will be inserted later'
WHERE name IS NULL ;


-- Task07 -> Boş adresleri 'Adres daha sonra eklenecek' olarak değiştiren query create ediniz.
UPDATE PEOPLE 
SET address = 'Adress will be inserted later'
WHERE address IS NULL;

UPDATE people 
SET name=null where name ='ad daha sonra eklenecek';


-- Task08 -> people tablosunda 'Daha sonra eklenecek' tüm boş değerleri değiştiren query create ediniz.
 -- COALESCE ALANLARA GİDER VE BOŞ DEĞERLERİ İKİNCİ PARAMETREYE DEĞİŞTİRİN
UPDATE people 
SET name = COALESCE (name,'To be inserted later');


