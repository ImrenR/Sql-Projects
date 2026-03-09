-- bir üniversite ders kaydi db si tasarlanmak isteniyor.
-- öğrencilerin ogrenci_isimi, ogrenci_soyisimi, email, ogrenci_telefon, bölüm  bilgisi vardir.  
-- bu öğrencilere ders saati belli olan dersler kaydedilecektir.
-- bu bilgileri kaydedilmesini sağlayan veri tabanini tasarlayiniz...

create table ogrenci(
    ogrenci_id   int auto_increment PRIMARY KEY,
    ogrenci_isim        varchar(30) not null,
    ogrenci_soyisim   varchar(30) not null,
    ogrenci_eMail    varchar(50) DEFAULT'',
    ogrenci_telefon    varchar(10) DEFAULT'',
    bolum_id   int not null DEFAULT 0
    );

create table bolum(
   bolum_id   int PRIMARY KEY auto_increment ,
   bolum_isim   varchar(50) 
    
);

create table ders(
    ders_id   int PRIMARY KEY auto_increment,
   ders_isim   VARCHAR(50),
    ders_saat int
);

create table ogrDERS(
ogrenci_id int not null,
ders_id int not null,
PRIMARY KEY(ogrenci_id,ders_id)
);

-- INSERT INTO ogrenci(ogrenci_isim,ogrenci_soyisim,ogrenci_eMail,bolum_id) 


select * from ogrenci;

SELECT bolum_id, count(*)
from ogrenci
group by bolum_id;

sELECT * FROM bolum;

INSERT INTO ders (ogrenci_isim, ders_saat) VALUES ('matematik', '3');
INSERT INTO ders (ogrenci_isim, ders_saat) VALUES ('fizik', '2');
INSERT INTO ders (ogrenci_isim, ders_saat) VALUES ('kimya', '2');
INSERT INTO ders(ogrenci_isim, ders_saat) VALUES ('geometri', '3');
INSERT INTO ders (ogrenci_isim, ders_saat) VALUES ('yazilim', '5'); 
INSERT INTO ders (ogrenci_isim, ders_saat) VALUES ('sdet', '4'); 

 SELECT * from  ders;
 
INSERT INTO ogrDERS (ogrenci_id, ders_id) VALUES ('1', '2');
INSERT INTO ogrDERS (ogrenci_id, ders_id) VALUES ('3', '2');
INSERT INTO ogrDERS (ogrenci_id, ders_id) VALUES ('4', '3');
INSERT INTO ogrDERS(ogrenci_id, ders_id) VALUES ('4', '1');
INSERT INTO ogrDERS (ogrenci_id, ders_id) VALUES ('5', '1');
INSERT INTO ogrDERS (ogrenci_id, ders_id) VALUES ('3', '5');
INSERT INTO ogrDERS (ogrenci_id, ders_id) VALUES ('2', '2');
INSERT INTO ogrDERS (ogrenci_id, ders_id) VALUES ('6', '2');
INSERT INTO ogrDERS (ogrenci_id, ders_id) VALUES ('3', '1');
INSERT INTO ogrDERS (ogrenci_id, ders_id) VALUES ('4', '2');
INSERT INTO ogrDERS (ogrenci_id,ders_id) VALUES ('5', '3');
INSERT INTO ogrDERS (ogrenci_id, ders_id) VALUES ('7', '2');
INSERT INTO ogrDERS (ogrenci_id, ders_id) VALUES ('7', '3');
INSERT INTO ogrDERS (ogrenci_id, ders_id) VALUES ('1', '5');

SELECT * FROM ogrDERS;

-- -----------------------------------------------------------------------------

-- Task01->  öğrencilerin bölümlerini listeleyen query create ediniz.



-- Task02->  hangi bölümden kaç ders kaydi olduğunu listeleyen query create ediniz.




-- Task03->   hangi dersten kaç öğrenci kaydi olduğunu listeleyen query create ediniz.




-- Task04->  herhangi bir derse kayitli olmayan öğrencileri listeleyen query create ediniz.




-- soru : hangi öğrencinin kaç derse kayit yaptirdiğini listeleyen query create ediniz.

-- soru : her bölümün kayitli olan toplam ders saatini listeleyen query create ediniz.

-- soru : en yüksek ders saatine sahip bölümü listeleyen query create ediniz.





