use kutuphane;
CREATE TABLE OGRENCILER
(
Ogrenci_No CHAR(4) PRIMARY KEY, 
Adi_Soyadi VARCHAR(50) UNIQUE,
Sinif CHAR(3)
);

INSERT INTO OGRENCILER VALUES('523', 'Ali Akbulut' ,'10');
INSERT INTO OGRENCILER VALUES('487', 'Merve Can' ,'12');
INSERT INTO OGRENCILER VALUES('125', 'Kemal Gür' ,'9');
INSERT INTO OGRENCILER VALUES('885', 'Ayşe Atar','11');
INSERT INTO OGRENCILER VALUES('754', 'Merve Gül' ,'10');
INSERT INTO OGRENCILER VALUES('854', 'Ahmet Arık' ,'9');
INSERT INTO OGRENCILER VALUES('741', 'Mehmet Pehlivan' ,'11');
INSERT INTO OGRENCILER VALUES('562', 'Can Demir' ,'12');
INSERT INTO OGRENCILER VALUES('965', 'Kemal Can' ,'9');


CREATE TABLE KITAPLAR (
    Kitap_ID INT PRIMARY KEY AUTO_INCREMENT,
    KitapAdi VARCHAR(255) NOT NULL,
    Yazar VARCHAR(255) NOT NULL,
    BasimYili INT NOT NULL,
    Kaynak VARCHAR(50) NOT NULL,
    Yayinevi VARCHAR(100) NOT NULL
) AUTO_INCREMENT = 10;

INSERT INTO KITAPLAR (KitapAdi, Yazar, BasimYili, Kaynak, Yayinevi)
VALUES
    ('Fareler ve İnsanlar', 'John Steinback', 2015, 'Yabancı', 'Damla'),
    ('1984', 'George Orwell', 2019, 'Yabancı', 'Uğurböceği'),
    ('Hayvan Çiftliği', 'George Orwell', 2019, 'Yabancı', 'Uğurböceği'),
    ('Cengiz Hana Küsen Bulut', 'Cengiz Aytmatov', 2014, 'Türk', 'Piramit'),
    ('Suç ve Ceza', 'Dostoyevski', 2011, 'Yabancı', 'Nobel'),
    ('Sefiller', 'Viktor Hugo', 2010, 'Yabancı', 'Nobel'),
    ('Sinekli Bakkal', 'Halide Edip Adıvar', 2001, 'Türk', 'Zirve'),
    ('Çalıkuşu', 'Reşat Nuri Güntekin', 2000, 'Türk', 'Zirve'),
    ('Yaprak Dökümü', 'Reşat Nuri Güntekin', 1998, 'Türk', 'Damla'),
    ('Şah ve Sultan', 'İskender Pala', 2014, 'Türk', 'Kapı'),
    ('Abum Rabum', 'İskender Pala', 2019, 'Türk', 'Kapı'),
    ('Od', 'İskender Pala', 2015, 'Türk', 'Kapı'),
    ('Mihmandar', 'İskender Pala', 2020, 'Türk', 'Kapı'),
    ('İki Şehrin Hikayesi', 'Charles Dickens', 2005, 'Yabancı', 'Nobel');
    
UPDATE KITAPLAR SET Kaynak = 'Yabanci' WHERE Kaynak = 'Yabancı';

CREATE TABLE DOKUM (
    Kitap_ID INT,
    Ogrenci_No CHAR(4),
    Alim_Tarihi DATE,
    Teslim_Tarihi DATE,
    Onay INT,
    FOREIGN KEY (Kitap_ID) REFERENCES KITAPLAR(Kitap_ID),
    FOREIGN KEY (Ogrenci_No) REFERENCES OGRENCILER(Ogrenci_No)
);

INSERT INTO DOKUM (Kitap_ID, Ogrenci_No, Alim_Tarihi, Teslim_Tarihi, Onay)
VALUES
    (12, '562', '2021-02-12', '2021-02-28', 1),
    (12, '965', '2021-03-15', '2021-03-31', 0),
    (18, '741', '2021-03-31', '2021-04-15', 0),
    (20, '523', '2021-03-31', '2021-04-15', 1),
    (23, '965', '2021-04-28', '2021-05-13', 0);
   select * from dokum;
   select * from KITAPLAR;
   select * from OGRENCILER;
    
-- Tüm öğrencilerin listesini getiren sorguyu yazınız
  select * from OGRENCILER;
    

-- Tüm kitapların listesini getiren sorguyu yazınız	
   select * from KITAPLAR;

-- George Orwell a ait kitapları listeleyen sorguyu yazınız
  select kitapAdi
  from kitaplar
  where yazar='George Orwell';
   
-- İskender Pala ya ait kitapları listeleyen sorguyu yazınız		
     select kitapAdi
     from kitaplar
     where yazar='Iskender Pala';
      
-- Kaynağı Yabancı olan kitapları listeleyiniz
  select kitapAdi as kitaplar
  from kitaplar
  where kaynak='yabanci';
         
-- Mart ayında alınan kitapları listeleyiniz
     
select k.kitapAdi,
d.alim_tarihi
from kitaplar k
join dokum d
on k.kitap_id=d.kitap_id
where month(d.alim_tarihi)=3;


            
-- Teslim edilmeyen kitapları ve kimde olduklarını listeleyiniz
     select distinct o.adi_soyadi
   
     from ogrenciler o
     join dokum d
     on d.ogrenci_no=o.ogrenci_no
     where onay=0;
     
         
               
-- Kaynağı yabancı olan kaç kitap vardir
   select count(kitap_ID) as kitap_adedi
   from kitaplar
   where kaynak='yabanci';
                
-- Adının ilk harfi S olan kitapları listeleyin. 
select kitapAdi
from kitaplar
where kitapAdi like 'S%';