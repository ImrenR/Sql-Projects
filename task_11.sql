drop table if exists products;
drop table if exists product_group;

create table product_group (
g_code 	  char(7) primary key not null,
g_name 	  varchar(45),
p_manager varchar(45) default 'tanımlanmadı' );

create table products (
p_code varchar(20) unique not null,
p_name varchar(45),
g_code char(7) ,
g_renk varchar(10),
fiyat int,
CONSTRAINT group_fk FOREIGN KEY (g_code) REFERENCES product_group(g_code) );

insert into product_group (g_code,g_name) values 
('DT','DeskTop'),('LT','LapTop'),('MP','MobilePhone'),('PR','Printer');  

insert into products(p_code,p_name,g_code,fiyat) values 
('AS01', 'Asus 14" Notebook', 	'LT',450),('AS15', 'Asus 15" Notebook', 	'LT',650),
('D151', 'Dell 15" Notebook',  	'LT',550),('DT01','Asus Desktop Computer',	'DT',480),
('AP70', 'Asus Mobile phone ',  'MP',300),('DT02','Asus Desktop Computer',	'DT',460),
('AP20', 'Asus MMobile Phone',	'MP',290),('DT03','HP Desktop Computer',	'DT',440),
('HP05', 'HP 17" Notebook',    	'LT',600),('DT04','Dell Desktop Computer',	'DT',390),
('AS05', 'Asus 15" Notebook',  	'LT',570),('DT05','Dell Desktop Computer',	'DT',395),
('BL13', 'Brother Lazer Printr','PR',120),('DT06','Zenon Desktop Computer',	'DT',475),
('IJ10', 'HP InkJet Printer',  	'PR', 70),('DT07','Dell Desktop Computer',	'DT',495),
('LZ30', 'HP Lazer Printer',   	'PR', 99),('DT08','HP Desktop Computer',	'DT',500);

-- task01 -> products table a marka column ekleyiniz
alter table products add marka varchar(20);

-- task02 -> product_group , g_name  i, varchar(20) olarak update edin

alter table product_group modify column g_name varchar(20);

-- task03 -> pruducts table renk column silin
alter table products drop column g_renk;

-- task04 -> product_group , g_name i group_name olarak değiştirin.
Alter table product_group rename column g_name to group_name;

-- task05 -> product_group , group_name i g_name varchar(15) olarak değiştirin.

alter table product_group change group_name g_name varchar(15);

-- task06 -> kaç adet masaüstü(DT) ve  Laptop (LT) bilgisayar vardır listeleyen query create ediniz.
select count(p_code) from products where g_code='DT' or g_code='LT';
select COUNT(p_code) from products where g_code in ( 'DT', 'LT');

-- task07 -> Laptoplaın fiyatları toplamı listeleyen query create ediniz.
select sum(fiyat) from products where g_code = "LT";

-- task08 ->) Printer ortalama fiyatı listeleyen query create ediniz.
select avg(fiyat) from products where g_code = "PR";

-- task09 -> En ucuz ürünü listeleyen query create ediniz.
select min(fiyat) from products where g_code='DT';
select * from products where fiyat = (select min(fiyat) from products);

-- task10 ->  En ucuz DeskTop  listeleyen query create ediniz.
select * from products where fiyat = (select min(fiyat) from products where g_code='DT');

-- task11 -> Her ürün grubundan kaç adet ürün vardır listeleyen query create ediniz..
select g_code, count(*) from products group by g_code;

-- task12 -> Her bir ürün grubundaki en ucuz ürünleri listeleyen query create ediniz.
select g_code, min(fiyat) from products group by g_code;

-- task13 -> ustteki soru g_name ile yapın 

select g_code as KOD, ( select g_name from product_group 
where product_group.g_code=products.g_code) as Gurup,  
min(fiyat) as En_ucuz from products group by g_code;

-- task14 -> (11 soru) Her ürün grubundan kaç adet ürün vardır listeleyen query create ediniz.(g name ile)

select g_code, ( select g_name from product_group 
where product_group.g_code=products.g_code) as Gurup, count(*) from products group by g_code;

-- task15 ->) Her ürün grubundan kaç adet ürün vardır ve ortalma fiyatları nedir listeleyen query create ediniz.

select g_code,( select g_name from product_group 
where product_group.g_code=products.g_code) as Gurup, count(g_code) , avg(fiyat) from products group by g_code;