-- All countries
use kutuphane;
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

CREATE TABLE students 
(  
  id int, 
  name varchar(50), 
  city varchar(50), 
  score int,
  department varchar(20)
);

INSERT INTO students VALUES(100, 'Ahmet Ümit', 'Istanbul', 546, 'Computer Engineering');
INSERT INTO students VALUES(101, 'R.Nuri Güntekin', 'Antalya', 486, 'Business Administration');
INSERT INTO students VALUES(102, 'S.Faik Abasıyanık', 'Bursa', 554, 'Computer Engineering');
INSERT INTO students VALUES(103, 'Yaşar Kemal', 'Istanbul', 501, 'Mathematics');
INSERT INTO students VALUES(104, 'Halide E. Adıvar', 'Izmir', 473, 'Psychology');
INSERT INTO students VALUES(105, 'Nazan Bekiroğlu', 'Izmir', 432, 'Literature');
INSERT INTO students VALUES(106, 'Peyami Safa', 'Antalya', 535, 'Computer Engineering');
INSERT INTO students VALUES(107, 'Sabahattin Ali', 'Istanbul', 492, 'Mathematics');

CREATE TABLE departments 
(  
  department_id int, 
  department varchar(20),
  base_score int,
  campus varchar(20)
);

INSERT INTO departments VALUES(5001, 'Computer Engineering', 521,'North');
INSERT INTO departments VALUES(5002, 'Mathematics', 455,'South');
INSERT INTO departments VALUES(5003, 'Psychology', 440,'Hisar');
INSERT INTO departments VALUES(5004, 'Business Administration', 465,'Hisar');
INSERT INTO departments VALUES(5005, 'Literature', 420,'North');

select * from countries;
select * from developers;
select * from students;
select * from departments;

-- List all countries in alphabetical order.

select * from countries
order by country_name;

-- List countries with phone codes greater than 50 along with their names.

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
avg(salary) as avg_salary
from developers
where prog_lang='java';

-- List developers whose salary is between 45000 and 60000.

select name,
salary
from developers
where salary between 45000 and 60000;

-- List the developer with the lowest and highest salary in a single query.

select name,salary
from developers
where salary = (select max(salary) from developers)
or salary=(select min(salary) from developers);

-- List the average and maximum salary for each programming language.

select prog_lang,
avg(salary) as avg_salary,
max(salary) as max_salary
from developers
group by prog_lang;

-- List developers who know HTML or CSS.

select name, prog_lang
from developers
where prog_lang = 'html' or prog_lang='css';

-- List developers whose salary is greater than 50000 in descending order of salary.

select name,
salary
from developers
where salary > 50000
order by salary desc;

-- Count how many students are in each city.

select city,
count(name) as student_count
from students
group by city;

-- Find the total score of students in the Computer Engineering department.

select department,
sum(score) as total_score
from students
group by department
having department='computer engineering';

-- List departments with a base score greater than 450 and their campus.

select department,campus
from departments
where base_score > 450;

-- List students whose score is greater than 500, ordered by score descending.

select name
from students
where score>500
order by score desc;

-- List students whose names start with “S”.

select name
from students
where name like 'S%';

-- List students studying in Istanbul with a score greater than 500.

select name
from students
where city='istanbul' and score>500;

-- List the number of students in each department and the department’s base score.

select s.department,count(s.name) as student_count,d.base_score
from students s
join departments d
on s.department=d.department
group by s.department,
d.base_score;

-- Retrieve students’ scores and departments using a JOIN with the department table.

select s.name,d.department,d.base_score
from students s
 join departments d
on s.department=d.department;

-- List the names of students with a score higher than 500 in uppercase.

select  upper(name) as name_upper
from students
where score>500;

-- List departments with base scores higher than 450 and the names of students in those departments using JOIN.

select s.name,d.department
from students s
join departments d
on s.department=d.department
where d.base_score>450;

-- List developers whose salary is above the average, grouped by programming language.

select prog_lang, count(*) as above_avg_count
from developers
where salary > (select avg(salary) from developers)
group by prog_lang;


-- List each student’s name, score, and the campus of their department.


select o.isim,o.puan,
b.kampus
from ogrenciler o
left join bolumler b
on o.bolum=b.bolum;




-- List students studying in departments with a base score greater than 450.

select o.isim,b.bolum
from ogrenciler o
join bolumler b
on o.bolum=b.bolum
where b.taban_puanı>450;



-- List the names of students in Istanbul along with their department.

select bolum,
round(avg(puan),0) as ort_puan
from ogrenciler
group by bolum;



-- List the average score of students for each department.

select bolum,
round(avg(puan),0) as ort_puan
from ogrenciler
group by bolum;


-- List students whose score is higher than their department’s base score.

select o.isim
from ogrenciler o
join bolumler b
on o.bolum=b.bolum
where o.puan >  b.taban_puanı ;


-- List developers along with their salary and country name.

select d.name,d.salary,c.country_name
from developers d
left join countries c
on d.id=c.id;


-- List developers whose salary is above the average.

select id, name
from developers
where salary > (select avg(salary) from developers)


-- List developers who know Java and JavaScript, ordered by salary descending.

select name,salary
from developers
where prog_lang in ('java', 'javascript')
order by salary desc;

-- Count how many developers work in each country.




-- List the developer with the highest salary and their country.




-- List the student with the highest score in each department.





-- List students in Mathematics or Computer Engineering departments.





-- List students’ names and departments in uppercase.





-- List developers whose salary is greater than 50000 and who use Java.





-- List the difference between students’ scores and their department’s base score.



-- List the average salary and number of developers in each country.



-- List students in departments located in the “North” campus.







-- List students with a score greater than 500 in the “South” campus.




-- List each developer’s programming language and country code.





-- List developers whose salary is between 45000 and 60000 along with their programming language and country name.