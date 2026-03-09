USE sakila;
select * from sakila.city;
select * from city;

-- Task01-> City'deki her şeyi göster. Ancak sıralama country_id ' ye göre olsun ve baştan sona dogru sıralansın.


-- Task02-> City'deki her şeyi göster. Ancak sıralama city_id ' ye göre olsun ve sondan başa dogru sıralansın.


-- Task03-> City'deki her şeyi göster. Ancak sıralama city ' ye göre olsun ve sondan başa dogru sıralansın.


-- Task04-> City’lerin arasından A harfi ile başlayanları, city id lerine göre tersten yazdır. 


-- Task05->  city_id  , city , country_ id yi yazdırın. Koşul olarak country_id si 50 den büyük olanları yazdırın.country id ile tersten sıralayın.


-- Task06->  city_id  , city , country_ id yi yazdırın. Koşul olarak country id si 20 ile 25 arasında olanları yazdır ve country id ye göre yazdır.

SELECT * FROM employees;

-- Task07-> Bir Job_id içerisinde kaç kişi çalışıyor? Job id grubu oluşturarak yazalım.
select JOB_ID,count(first_name) as calisan from employees
group by JOB_ID;


-- Task08-> Yukarıdaki örneğe ek olarak, ismi T harfi ile biten job_id leri yazdırmasını isteyelim.
select JOB_ID,count(first_name) as calisan from employees
-- where  JOB_ID like '%T'

group by JOB_ID
having JOB_ID like '%T';



-- Task09-> job_ id lere göre her job id nin toplam maaşını görüntüle. 
-- Maaşların yazacağı kısmı ‘Total’ olarak nitelendir. Job id olarak gruplandır. 
 select JOB_ID,sum(salary) as Total from employees
group by JOB_ID;

-- Task10->  Bir manager_İd den kac adet oldugunu bul. Kaç kez kullanılmış ?Gruplandırma olarak ta manager id kullan.
select manager_id,count(manager_id) as manager from employees
group by manager_id;

-- Task11->   Bir 100'den fazla olan  manager_id den kaç adet oldugunu bul. manager_id olarak grupla. 

select manager_id,count(manager_id) as manager from employees
where manager_id>150
group by manager_id;


-- Task12-> first_name ve salary'lerin toplamını yazdırın.
-- 2000 den büyük salary leri first_name ' e göre gruplandırın ve bu grupları first_name'in baş harfi D olanlar ile yapın.

select first_name, sum(salary) as total_salary
from employees
where salary>2000
group by first_name
having first_name like 'D%';
