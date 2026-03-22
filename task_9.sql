drop table if exists products;
drop table if exists product_group;
use kutuphane;
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
select * from product_group;
select * from products;

-- parent child iliskisi g.code ile yapilir

-- task01 -> Her ürün grubundan 400 den pahalı kaç adet ürün vardır listeleyen query create ediniz.

select g_name as product_name,
count(p_code) as total_product
from product_group -- ana table
left join products
on product_group.g_code=products.g_code and fiyat>400

group by g_name;

-- task02 -> 400 den pahalı ürünü olan ürün gruplarında, kaç adet ürün vardır listeleyen query create ediniz.

select g_name as urun_grubu,
count(p_code) as toplam_urun
from product_group
join products
on product_group.g_code=products.g_code
where product_group.g_code in (
select g_code
from products
where fiyat>400
)
group by g_name;


-- task03 -> 3 den fazla ürüne sahip ürün gruplarının en ucuz ürünlerini listeleyen query create ediniz.
select pg.g_name as urun_adi,
min(p.fiyat) as en_ucuz_fiyat
from product_group pg
join products p
on p.g_code=pg.g_code
group by pg.g_name
having count(p.p_code) > 3;

-- task03a -> her ürün gurubunun en pahalı ürününü listeleyiniz
select pg.g_name,

max(p.fiyat) as en_pahali_urun
from product_group pg
join products p
on pg.g_code=p.g_code
group by pg.g_name;

-- task03b -> 3a da ki soruda gruptaki toplam fiyat 1000 den den fazla olanları listeleyen query create ediniz.
 select pg.g_name,

max(p.fiyat) as en_pahali_urun,
sum(p.fiyat) as toplam_fiyat
from product_group pg
join products p
on pg.g_code=p.g_code
group by pg.g_name
having sum(p.fiyat)>1000;

-- task04 -> fiyatı 100 den küçük ve 500 den büyük ürünleri listeleyen query create ediniz.
select pg.g_name,
p.p_name,
p.fiyat
from product_group pg
join products p
on pg.g_code=p.g_code
where p.fiyat <100 or fiyat > 500;


-- task05 -> products table daki tüm ürünleri listeleyiniz, fiyatı 500 den büyük olanlari 2 kez listeleyen query create ediniz..
/*
Bunu yapmak için UNION ALL kullanabiliriz.
 UNION ALL aynı kayıtları tekrar gösterir, UNION ise tekrarları kaldırır.
*/
select * from products

union all

select * from products
where fiyat>500;
-- task06 -> En ucuz fiyatı 100 den büyük olan ürün grupları (g_code+min fiyat) 
-- ile en az 3 adet veya fazla ürünü olan grupları listeleyen query create ediniz.  (g_code+min fiyat) 
select pg.g_code,
min(p.fiyat)  as min_fiyat_urun
from product_group pg
join products p
on pg.g_code=p.g_code
group by pg.g_code
having min(p.fiyat) > 100
union

select pg.g_code,
count(p.p_code) as urun_sayisi_fiyat
from product_group pg
join products p
on pg.g_code=p.g_code
group by pg.g_code
having count(p.p_code) >= 3;

-- task07 -> 6. soruyu union kullanmadan yapalım.alter

-- task08 -> ürün listesini g_name ile listeleyen query create ediniz./ 3 yöntem ile çözelim








drop table if exists ogrenciler;
drop table if exists dersler;
drop table if exists notlar;
use kutuphane;
create table ogrenciler(
o_no int unique not null,
isim varchar(45),
sube char(3)
);
insert into ogrenciler values (10,'Hasan','3A'),(11,'Ali','2A'),(12,'Fatma','2A'),
(13,'Canan','3A'),(14,'Zişan','3A'),(15,'Şeyda','3A'),(16,'Fatih','2A'),(17,'Yusuf','3A');

create table dersler (
d_kod int unique not null,
d_ad varchar(20),
d_ogr varchar(30),
d_kredi int
);
insert into dersler values (101,'Fizik','Mehmet hoca',5),(102,'Tarih','Hasan hoca',2),
(103,'Bilgisayar','Ayşe hoca',5),(104,'Kimya','Kamil hoca',5),(105,'Resim','Ece hoca',5); 

create table notlar (
d_kod int,
o_no int,
skor int
);
insert into notlar values (101,10,5),(101,11,8),(101,12,5),(101,10,7),
(104,10,8),(102,10,9),(102,12,7),(102,11,7),(102,10,9),(102,13,3);
select * from notlar;
select * from dersler;
select * from ogrenciler;
-- task09 -> Oğrencileri aldıkları notlar ile birlikte listeleyen query create ediniz.
select distinct o.isim,
n.skor
from ogrenciler o
left join notlar n
on o.o_no=n.o_no;
-- task10 -> Herhangi bir not kaydı bulunan öğrencileri aldıkları notlar ile birlikte listeleyen query create ediniz.
select o.isim,
n.skor
from ogrenciler o
left join notlar n
on n.o_no=o.o_no
where n.skor is not null;

-- task11 -> öğrencilerin aldıkları notları ders hocasının adı ile birlikte listeleyen query create ediniz.  
select o.isim,
d.d_ogr,
n.skor
from ogrenciler o
join notlar n
on o.o_no = n.o_no
join dersler d
on d.d_kod=n.d_kod;
