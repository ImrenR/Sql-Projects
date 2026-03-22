drop table if exists daily_sales;
create database kutuphane;
use kutuphane;
CREATE TABLE daily_sales (
  person_name VARCHAR(100),
  brand VARCHAR(50),
  number_sales INT
);


INSERT INTO daily_sales VALUES
('Ahmet', 'Asus', 55), ('Ayşe', 'Dell', 10), ('Kamil', 'Dell', 78), ('Ahmet', 'HP', 3),	
('Ahmet', 'HP', 10),	   ('Ahmet', 'Asus', 18), ('Ayşe', 'Lenovo', 61), ('Kamil', 'Asus', 180),	
('Ahmet', 'HP', 14),	  ('Ayşe', 'Asus', 45), ('Ahmet', 'Asus', 87), ('Ahmet', 'Dell', 34),
('Ayşe', 'HP', 4), 	('Kamil', 'Lenovo', 58),('Kamil', 'Dell', 7), ('Ahmet', 'HP', 11),	
('Ahmet', 'Lenovo', 8), ('Ahmet', 'Asus', 37),	('Ayşe', 'Asus', 68),	('Kamil', 'Dell', 54),	
('Ahmet', 'HP', 81),  ('Ayşe', 'Asus', 5),	('Ahmet', 'Asus', 46),	('Ahmet', 'Dell', 11),
('Ayşe', 'HP', 85),	('Kamil', 'Asus', 43), ('Ayşe', 'Lenovo', 10),	('Ahmet', 'Asus', 5),
('Ahmet', 'Dell', 16), ('Ayşe', 'HP', 1), 	('Kamil', 'Lenovo', 5),	('Kamil', 'Dell', 51),	
('Ahmet', 'HP', 76),	('Ahmet', 'Lenovo', 48),('Ahmet', 'Asus', 11),	('Ayşe', 'Asus', 3),
('Kamil', 'Lenovo', 63),('Ahmet', 'HP', 81),	('Ayşe', 'Asus', 85),	('Ahmet', 'Asus', 10),	
('Ahmet', 'Dell', 47),	('Ayşe', 'Lenovo', 63),	('Kamil', 'Asus', 8);
SELECT * FROM daily_sales;

-- task01 ->  Kişi bazında satışları toplamlarını gruplayınız, aşağıdaki şekilde listeleyen query create ediniz.
-- NAME		Asus	HP		Dell	Lenovo
-- Ahmet	269		276		108		56
-- Ayşe		206		90		10		134
-- Kamil	231		0		190		126

select p.person_name as NAME,
(select sum(number_sales)
from daily_sales d
where d.person_name=p.person_name and brand='Asus') as Asus,
(select sum(number_sales)
from daily_sales d
where d.person_name=p.person_name and brand='HP') as HP,
(select sum(number_sales)
from daily_sales d
where d.person_name=p.person_name and brand='Dell') as Dell,
(select sum(number_sales)
from daily_sales d
where d.person_name=p.person_name and brand='Lenovo') as Lenovo
from(select distinct person_name from daily_sales) p;

-- task02 ->  Marka bazında satışları toplamlarını gruplayınız, aşağıdaki şekilde listeleyen query create ediniz.
-- BRAND	Ahmet	Ayşe	Kamil	
-- Asus		269		206		231
-- Dell		108		10		190
-- HP		276		90		0
-- Lenovo	56		134		126
select b.brand as BRAND,
coalesce(sum(a.number_sales),0) as Ahmet,
coalesce(sum(y.number_sales),0) as Ayse,
coalesce(sum(k.number_sales),0) as Kamil
from (select distinct brand from daily_sales) b
left join daily_sales a
on b.brand=a.brand and a.person_name='Ahmet'
left join daily_sales y
on b.brand=y.brand and y.person_name='Ayse'
left join daily_sales k
on b.brand=k.brand and k.person_name='Kamil'
group by b.brand;

-- task03 -> markaların kişi bazlı günlük satış ortalamalarını listeleyen query create ediniz.
select
person_name,
round(avg(number_sales)) as avg_sales
from daily_sales
group by brand,person_name;

-- task04 -> ahmet ve ayşenin satışlarından oluşan sanal bir tablo create ediniz.
SELECT *
FROM (
  SELECT *
  FROM daily_sales
  WHERE person_name IN ('Ahmet', 'Ayşe')
) AS temp_table;

