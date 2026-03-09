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

-- task01 -> Her ürün grubundan 400 den pahalı kaç adet ürün vardır listeleyen query create ediniz.
select g_code, count(p_code) from products group by g_code; 
select g_code, count(p_code) from products where fiyat>400 group by g_code; 

-- task02 -> 400 den pahalı ürünü olan ürün gruplarında, kaç adet ürün vardır listeleyen query create ediniz.
select g_code, count(p_code), max(fiyat) from products group by g_code having max(fiyat)>400; 
-- cozum 2) yakup beyden
Select g_code, count(p_code) from products  
where  g_code in (Select g_code from products  where fiyat>400) group by g_code;

-- task03 -> 3 den fazla ürüne sahip ürün gruplarının en ucuz ürünlerini listeleyen query create ediniz.
select g_code, min(fiyat) from products group by g_code having count(p_code)>3;

-- task03a -> her ürün gurubunun en pahalı ürününü listeleyiniz
select g_code, max(fiyat) from products group by g_code; 

-- task03b -> 3a da ki soruda guruptaki toplam fiyat 1000 den den fazla olanları listeleyen query create ediniz.
select g_code, max(fiyat) from products group by g_code having sum(fiyat)>1000; 

-- task04 -> fiyatı 100 den küçük ve 500 den büyük ürünleri listeleyen query create ediniz.
select * from products where fiyat<100 or fiyat>500 order by fiyat;

select * from products where fiyat>500 union
select * from products where fiyat<100 order by fiyat;

-- task05 -> products table daki tüm ürünleri listeleyiniz, fiyatı 500 den
-- büyük olanlar 2 kez listeleyen query create ediniz..
select * from products union all select * from products where fiyat>500;

-- task06 -> En ucuz fiyatı 100 den büyük olan ürün grupları (g_code+min fiyat) 
-- ile en az 3 adet veya fazla ürünü olan grupları listeleyen query create ediniz.  (g_code+min fiyat) 
select g_code, min(fiyat) from products group by g_code having min(fiyat)>100 union
select g_code, min(fiyat) from products group by g_code having count(g_code)>=3;

-- task07 -> 6. soruyu union kullanmadan yapalım.alter
select g_code, min(fiyat) from products group by g_code having min(fiyat)>100 or count(g_code)>=3;

-- task08 -> ürün listesini g_name ile listeleyen query create ediniz./ 3 yöntem ile çözelim
select p.*, pg.g_name from products p, product_group pg where p.g_code=pg.g_code order by p_code;
select *, (select g_name from product_group pg where p.g_code=pg.g_code) GRP from products p order by p_code; 
select p.*, pg.g_name from products p left join product_group pg on p.g_code=pg.g_code order by p_code;

drop table if exists ogrenciler;
drop table if exists dersler;
drop table if exists notlar;

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

-- task09 -> Oğrencileri aldıkları notlar ile birlikte listeleyen query create ediniz.
select ogrenciler.*, skor from ogrenciler left join notlar on notlar.o_no=ogrenciler.o_no;
select ogrenciler.*, skor from notlar right join ogrenciler on notlar.o_no=ogrenciler.o_no;

-- task10 -> Herhangi bir not kaydı bulunan öğrencileri aldıkları notlar ile birlikte listeleyen query create ediniz.
select o.*,n.skor from ogrenciler o right join notlar n on  o.o_no=n.o_no order by o.o_no,n.skor;
select o.*, n.skor from ogrenciler o join notlar n on o.o_no=n.o_no order by o.o_no, n.skor;
select o.*, n.skor from ogrenciler o inner join notlar n on o.o_no=n.o_no order by o.o_no, n.skor; -- asıl cevap

-- task11 -> öğrencilerin aldıkları notları ders hocasının adı ile birlikte listeleyen query create ediniz.  
select o.*, skor,d.d_ogr from ogrenciler o inner join notlar n on o.o_no=n.o_no 
												    left join dersler d on n.d_kod=d.d_kod order by o_no;
select ogrenciler.*, notlar.skor, dersler.d_ogr
from ogrenciler
inner join notlar
inner join dersler on notlar.o_no=ogrenciler.o_no and notlar.d_kod=dersler.d_kod order by o_no;