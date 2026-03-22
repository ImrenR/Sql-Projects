use kutuphane;
create table maas(
ad varchar(50),
sicil varchar(10) unique,
ocak varchar(10),
subat varchar(10),
mart varchar(10),
nisan varchar(10),
mayis varchar(10),
haziran varchar(10)

);

insert into maas values('AHMET DEMIR','12345','5500','5300','5000','3850','5300','5600');
insert into maas values('MEHMET CAN','85236','5600','5000','6000','5700','5000','4800');
insert into maas values('ALI KAAN','84751','4800','5200','5500','4800','5200','6500');
insert into maas values('AYSE CAN','85422','6500','5000','6000','5400','6000','3850');
insert into maas values('PINAR HAN','41258','3800','4500','5000','6200','5000','5700');

select * from maas;

create table prim(
sicil varchar(10) unique,
prim1 int ,
prim2 int,
prim3 int 
);

insert into prim values('12345','500','600','750');
insert into prim values('85236','450','550','700');
insert into prim values('84751','600','700','800');
insert into prim values('85422','650','750','850');
insert into prim values('41258','700','800','900');
select * from prim;


-- calisan yilda 3 prim alyor
--  1)Ahmet DEMİR in ilk 4 aylık maas ortalamasını listeleyen query create ediniz...

select ad,
(ocak+0 + subat+0 + mart+0 + nisan+0) / 4 as ilk4AyOrt
from maas
where ad='ahmet demir';
-- 2)maas tablosundaki herkesin 6 aylık ortalamasını listeleyen query create ediniz...
SELECT 
    m.ad,
    (m.ocak+0 + m.subat+0 + m.mart+0 + m.nisan+0 + m.mayis+0 + m.haziran+0)/6 AS ortalama_maas,
    (p.prim1 + p.prim2 + p.prim3) AS toplam_prim,
    ( (m.ocak+0 + m.subat+0 + m.mart+0 + m.nisan+0 + m.mayis+0 + m.haziran+0)/6 + (p.prim1 + p.prim2 + p.prim3) ) AS net_gelir
FROM maas m
JOIN prim p
ON m.sicil = p.sicil
WHERE m.ad = 'AHMET DEMIR';
-- 3)ocak ayı maas ortalamasını listeleyen query create ediniz...
select
avg(ocak+0) as maas_ort
from maas;

-- 4)Haziran ayında odenen maas toplamını listeleyen query create ediniz...
select
sum(haziran) as toplam_haziran_maas
from maas;


-- 5)çalışan sayısını listeleyen query create ediniz...

select
count(ad) as calisan_sayisi
from maas;

-- 6)Şubat ayında en yüksek maası alan kişiyi listeleyen query create ediniz...
select ad,
subat as subat_maas
from maas
order by subat+0 desc
limit 1;

-- 7)Haziran ayında en yüksek maas alan kişinin adını listeleyen query create ediniz...

select ad,
haziran as en_yuksek_maas
from maas
order by haziran+0 desc
limit 1;

-- 8)maas tablosundaki bilgileri ad alanına göre sıralayıp listeleyen query create ediniz...
select * from maas
order by ad;