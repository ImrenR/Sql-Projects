
use javacan;
CREATE TABLE calisanlar
(
id CHAR(4),
isim VARCHAR(50),
maas int(5),
CONSTRAINT id_pk PRIMARY KEY (id)
);
INSERT INTO calisanlar VALUES('1001', 'Ahmet Aslan', 7000); 
INSERT INTO calisanlar VALUES('1002', 'Mehmet Yılmaz' ,12000);
INSERT INTO calisanlar VALUES('1003', 'Meryem ', 7215);
INSERT INTO calisanlar VALUES('1004', 'Veli Han', 5000);

CREATE TABLE aileler
(
id CHAR(4),
cocuk_sayisi VARCHAR(50),
ek_gelir int(5),
CONSTRAINT id_fk FOREIGN KEY (id) REFERENCES calisanlar(id)
);
INSERT INTO aileler VALUES('1001', 4, 2000);
INSERT INTO aileler VALUES('1002', 2, 1500); 
INSERT INTO aileler VALUES('1003', 1, 2200);
INSERT INTO aileler VALUES('1004', 3, 2400);

select * from calisanlar;
select * from aileler;

 -- Task01 -> Veli Han'ın maaşına %20 zam yapınız.
    update calisanlar
    set maas=maas*1.2
    where isim='Veli Han';
  
    
-- Task02 -> Maaşı ortalamanın altında olanlara %20 zam yapınız.
  
    update calisanlar
    set maas=maas*1.2
    where maas<(select avg(maas)from (select maas from calisanlar)as x);     
    select * from calisanlar;

-- Task03 -> calisanların isim ve cocuk_sayisi'ni listeyen query create ediniz.
 select id, isim, (select cocuk_sayisi from aileler where calisanlar.id=aileler.id) as cocuk_sayi
 from calisanlar;
            
-- Task04 -> calisanlar' ın  isim ve toplam_gelir'lerini gösteren bir query create ediniz.
-- toplam_gelir = calisanlar.maas + aileler.ek_gelir 
 select id, isim, (select maas+ek_gelir from aileler where calisanlar.id=aileler.id) as toplam_gelir
 from calisanlar;
 
 
-- Task05 -> eğer bir ailenin kişi başı geliri 2000 TL den daha az ise o çalışanın  maaşına ek %10 aile yardım zammı yapınız. 
-- kisi_basi_gelir = toplam_gelir / cocuk_sayisi + 2 (anne ve baba)
update  calisanlar
set maas=maas*1.1

where ( select (maas+ek_gelir)/(cocuk_sayisi+2)   as kisiBasi_gelir from aileler where calisanlar.id=aileler.id )<2000;
