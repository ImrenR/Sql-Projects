drop table if exists daily_sales;

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
select person_name ISIM, 
sum(case when brand='Asus' then number_sales else 0 end) as Asus, 
sum(case when brand='Hp' then number_sales else 0 end)as Hp,
sum(case when brand='Dell' then number_sales else 0 end) as Dell,
sum(case when brand='Lenovo' then number_sales else 0 end) as Lenovo 
from daily_sales group by person_name;

-- task02 ->  Marka bazında satışları toplamlarını gruplayınız, aşağıdaki şekilde listeleyen query create ediniz.
-- BRAND	Ahmet	Ayşe	Kamil	
-- Asus		269		206		231
-- Dell		108		10		190
-- HP		276		90		0
-- Lenovo	56		134		126
select brand,
sum(case when person_name='Ahmet' then number_sales else 0 end) as Ahmet,
sum(case when person_name='Ayse' then number_sales else 0 end) as Ayse,
sum(case when person_name='Kamil' then number_sales else 0 end) as Kamil
from daily_sales group by brand;

-- task03 -> markaların kişi bazlı günlük satış ortalamalarını listeleyen query create ediniz.
select brand,
avg(case when person_name='Ahmet' then number_sales else 0 end) as Ahmet,
avg(case when person_name='Ayse' then number_sales else 0 end) as Ayse,
avg(case when person_name='Kamil' then number_sales else 0 end) as Kamil
from daily_sales group by brand;

-- task04 -> ahmet ve ayşenin satışlarından oluşan sanal bir tablo create ediniz.
drop view if exists ahmet_ayse;

create view ahmet_ayse as select * from daily_sales where person_name in ('Ahmet', 'Ayşe');
select * from ahmet_ayse order by person_name;

