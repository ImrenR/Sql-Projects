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
select ad,(ocak+subat+mart+nisan+prim1)/4 as ortalama_maas
from maas
join prim
on prim.sicil=maas.sicil
where  maas.ad='Ahmet Demir';

-- 2)maas tablosundaki herkesin 6 aylık ortalamasını listeleyen query create ediniz...
select ad,(ocak+subat+mart+nisan+mayis+haziran+prim1+(prim2/2))/6 ortalama_maas
from maas
join prim
on prim.sicil=maas.sicil;

-- 3)ocak ayı maas ortalamasını listeleyen query create ediniz...
select avg(ocak) as ocak_ortalama
from maas;

-- 4)Haziran ayında odenen maas toplamını listeleyen query create ediniz...

select sum(haziran) as haziran_toplam
from maas;

-- 5)çalışan sayısını listeleyen query create ediniz...
select count( ad) as calisan_sayisi
from maas;


-- 6)Şubat ayında en yüksek maası alan kişiyi listeleyen query create ediniz...
select ad
from maas
where subat=(select max(subat) from maas);

-- 7)Haziran ayında en yüksek maas alan kişinin adını listeleyen query create ediniz...
select ad
from maas
where haziran=(select max(haziran) from maas);

-- 8)maas tablosundaki bilgileri ad alanına göre sıralayıp listeleyen query create ediniz...
select *
from maas
order by ad;
