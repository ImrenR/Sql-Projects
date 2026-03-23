-- All countries
CREATE TABLE countries(
    id int NOT NULL,
    phone_code int NOT NULL,
    country_code char(2) NOT NULL,
    country_name varchar(80) NOT NULL
);
INSERT INTO countries VALUES(1, 93, 'AF', 'Afghanistan');
INSERT INTO countries VALUES(2, 355, 'AL', 'Albania');
INSERT INTO countries VALUES(3, 213, 'DZ', 'Algeria');
INSERT INTO countries VALUES(4, 54, 'AR', 'Argentina');
INSERT INTO countries VALUES(5, 61, 'AU', 'Australia');
INSERT INTO countries VALUES(6, 43, 'AT', 'Austria');
INSERT INTO countries VALUES(7, 994, 'AZ', 'Azerbaijan');
INSERT INTO countries VALUES(8, 1242, 'BS', 'Bahamas');
INSERT INTO countries VALUES(9, 32, 'BE', 'Belgium');
INSERT INTO countries VALUES(10, 387, 'BA', 'Bosnia and Herzegovina');
INSERT INTO countries VALUES(11, 55, 'BR', 'Brazil');
INSERT INTO countries VALUES(12, 359, 'BG', 'Bulgaria');
INSERT INTO countries VALUES(13, 226, 'BF', 'Burkina Faso');
INSERT INTO countries VALUES(14, 237, 'CM', 'Cameroon');
INSERT INTO countries VALUES(15, 1, 'CA', 'Canada');
INSERT INTO countries VALUES(16, 236, 'CF', 'Central African Republic');
INSERT INTO countries VALUES(17, 86, 'CN', 'China');
INSERT INTO countries VALUES(18, 57, 'CO', 'Colombia');
INSERT INTO countries VALUES(19, 53, 'CU', 'Cuba');
INSERT INTO countries VALUES(20, 45, 'DK', 'Denmark');
INSERT INTO countries VALUES(21, 1809, 'DO', 'Dominican Republic');
INSERT INTO countries VALUES(22, 20, 'EG', 'Egypt');
INSERT INTO countries VALUES(23, 503, 'SV', 'El Salvador');
INSERT INTO countries VALUES(24, 240, 'GQ', 'Equatorial Guinea');
INSERT INTO countries VALUES(25, 251, 'ET', 'Ethiopia');
INSERT INTO countries VALUES(26, 358, 'FI', 'Finland');
INSERT INTO countries VALUES(27, 33, 'FR', 'France');
INSERT INTO countries VALUES(28, 220, 'GM', 'Gambia');
INSERT INTO countries VALUES(29, 49, 'DE', 'Germany');
INSERT INTO countries VALUES(30, 233, 'GH', 'Ghana');
INSERT INTO countries VALUES(31, 502, 'GT', 'Guatemala');
INSERT INTO countries VALUES(32, 852, 'HK', 'Hong Kong');
INSERT INTO countries VALUES(33, 91, 'IN', 'India');
INSERT INTO countries VALUES(34, 62, 'ID', 'Indonesia');
INSERT INTO countries VALUES(35, 964, 'IQ', 'Iraq');
INSERT INTO countries VALUES(36, 39, 'IT', 'Italy');
INSERT INTO countries VALUES(37, 81, 'JP', 'Japan');
INSERT INTO countries VALUES(38, 7, 'KZ', 'Kazakhstan');
INSERT INTO countries VALUES(39, 82, 'KR', 'Korea, Republic of');
INSERT INTO countries VALUES(40, 261, 'MG', 'Madagascar');
INSERT INTO countries VALUES(41, 960, 'MV', 'Maldives');
INSERT INTO countries VALUES(42, 31, 'NL', 'Netherlands');
INSERT INTO countries VALUES(43, 507, 'PA', 'Panama');
INSERT INTO countries VALUES(44, 63, 'PH', 'Philippines');
INSERT INTO countries VALUES(45, 65, 'SG', 'Singapore');
INSERT INTO countries VALUES(46, 90, 'TR', 'Turkey');
INSERT INTO countries VALUES(47, 44, 'GB', 'United Kingdom');
INSERT INTO countries VALUES(48, 1, 'US', 'United States');
INSERT INTO countries VALUES(49, 58, 'VE', 'Venezuela');
INSERT INTO countries VALUES(50, 263, 'ZW', 'Zimbabwe');

CREATE TABLE developers(
id SERIAL PRIMARY KEY,
name varchar(50),
salary real,
prog_lang varchar(20)	
);

INSERT INTO developers(name,salary,prog_lang) VALUES('Haluk',40000,'Java');
INSERT INTO developers(name,salary,prog_lang) VALUES('Ipek',50000,'JavaScript');
INSERT INTO developers(name,salary,prog_lang) VALUES('Harun',45000,'Java');
INSERT INTO developers(name,salary,prog_lang) VALUES('Merve',42000,'JavaScript');
INSERT INTO developers(name,salary,prog_lang) VALUES('Fatih',63000,'Java');
INSERT INTO developers(name,salary,prog_lang) VALUES('Ahmet',61000,'Html');
INSERT INTO developers(name,salary,prog_lang) VALUES('Hasan',55000,'Css');
INSERT INTO developers(name,salary,prog_lang) VALUES('Ufuk',53000,'Java');
INSERT INTO developers(name,salary,prog_lang) VALUES('Ali',45000,'Html');
INSERT INTO developers(name,salary,prog_lang) VALUES('Can',45000,'Css');
INSERT INTO developers(name,salary,prog_lang) VALUES('Kerem',27000,'C++');
INSERT INTO developers(name,salary,prog_lang) VALUES('Ayşe',34000,'C#');
INSERT INTO developers(name,salary,prog_lang) VALUES('Zeki',44000,'C#');

CREATE TABLE ogrenciler 
(  
  id int, 
  isim varchar(50), 
  sehir varchar(50), 
  puan int,
  bolum varchar(20)
);

INSERT INTO ogrenciler VALUES(100, 'Ahmet Ümit', 'İstanbul', 546, 'Bilgisayar Müh.');
INSERT INTO ogrenciler VALUES(101, 'R.Nuri Güntekin', 'Antalya', 486, 'İşletme');
INSERT INTO ogrenciler VALUES(102, 'S.Faik Abasıyanık', 'Bursa', 554, 'Bilgisayar Müh.');
INSERT INTO ogrenciler VALUES(103, 'Yaşar Kemal', 'İstanbul', 501, 'Matematik');
INSERT INTO ogrenciler VALUES(104, 'Halide E. Adıvar', 'İzmir', 473, 'Psikoloji');
INSERT INTO ogrenciler VALUES(105, 'Nazan Bekiroğlu', 'İzmir', 432, 'Edebiyat');
INSERT INTO ogrenciler VALUES(106, 'Peyami Safa', 'Antalya', 535, 'Bilgisayar Müh.');
INSERT INTO ogrenciler VALUES(107, 'Sabahattin Ali', 'İstanbul', 492, 'Matematik');

CREATE TABLE bolumler 
(  
  bolum_id int, 
  bolum varchar(20),
  taban_puanı int,
  kampus varchar(20)
);

INSERT INTO bolumler VALUES(5001, 'Bilgisayar Müh.', 521,'Kuzey');
INSERT INTO bolumler VALUES(5002, 'Matematik', 455,'Güney');
INSERT INTO bolumler VALUES(5003, 'Psikoloji', 440,'Hisar');
INSERT INTO bolumler VALUES(5004, 'İşletme', 465,'Hisar');
INSERT INTO bolumler VALUES(5005, 'Edebiyat', 420,'Kuzey');
select * from countries;
select * from developers;
select * from ogrenciler;
select * from bolumler;

-- List all countries in alphabetical order.

select * from countries
order by country_name;

-- List countries whose phone code is greater than 50.

select phone_code,
country_name
from countries
where phone_code > 50;

-- List all developers whose salary is greater than 50000 along with their programming languages.

select name,prog_lang
from developers
where salary > 50000;

-- Find the average salary of developers who use Java.

select prog_lang,
avg(salary) as ort_maas
from developers
where prog_lang='java';

-- List developers whose salary is between 45000 and 60000.

select name,
salary
from developers
where salary between 45000 and 60000;

-- List the developers with the minimum and maximum salary in a single query.

select name,salary
from developers
where salary = (select max(salary) from developers)
or salary=(select min(salary) from developers);

-- For each programming language, list the average salary and maximum salary.

select prog_lang,
avg(salary) as ort_maas,
max(salary) as max_maas
from developers
group by prog_lang;

-- List developers who know HTML or CSS.

select name, prog_lang
from developers
where prog_lang = 'html' or prog_lang='css';

-- List developers whose salary is greater than 50000 ordered by salary in descending order.

select name,
salary
from developers
where salary > 50000
order by salary desc;

-- List the number of students in each city.

select sehir,
count(isim) as kisi_sayisi
from ogrenciler
group by sehir;

-- Find the total score of students studying in the Computer Engineering department.

select bolum,
sum(puan) as toplam_puan
from ogrenciler
group by bolum
having bolum='bilgisayar muh.';

-- List departments whose base score is greater than 450 along with their campuses.

select bolum,kampus
from bolumler
where taban_puanı > 450;

-- List students whose score is greater than 500 ordered by score in descending order.

select isim
from ogrenciler
where puan>500
order by puan desc;

-- List students whose names start with the letter "S".

select isim
from ogrenciler
where isim like 'S%';

-- List students who study in Istanbul and have a score greater than 500.

select isim
from ogrenciler
where sehir='istanbul' and puan>500;

-- List the number of students in each department along with the department's base score.

select o.bolum,count(o.isim) as ogrenci_sayisi,b.taban_puanı
from ogrenciler o
join bolumler b
on o.bolum=b.bolum
group by o.bolum,
b.taban_puanı;

-- Using JOIN, list students' scores and their department information from the departments table.

-- List the names of students with scores greater than 500 in uppercase.

-- Using JOIN, list students who belong to departments with a base score greater than 450.

-- List developers whose salary is higher than the average salary grouped by programming language.

-- List each student's name, score, and their department’s campus.

-- List students studying in departments with a base score greater than 450.

-- List the names of students studying in Istanbul along with their department names.

-- List the average score of students for each department.

-- List students whose score is higher than their department’s base score.

-- List developers along with their salary and country name.

-- List developers whose salary is above the average salary.

-- List developers who know Java or JavaScript ordered by salary in descending order.

-- List how many developers are in each country.

-- List the developer with the highest salary along with their country.

-- List the student with the highest score in each department.

-- List students who study in Mathematics or Computer Engineering departments.

-- List students' names and departments in uppercase.

-- List developers whose salary is greater than 50000 and who use Java.

-- List the difference between students' scores and their department’s base score.

-- List the average salary and number of developers in each country.

-- List students studying in departments located in the "Kuzey" campus.

-- List students whose score is greater than 500 and whose campus is "Güney".

-- List each developer’s programming language and country code.

-- List developers whose salary is between 45000 and 60000 along with their programming language and country name.