create table  if not exists hastaneler( -- eger yoksa hastaneler isminde tablo tanimla
id char(5) primary key,
isim varchar(50),
sehir varchar(10),
ozel char(1) -- ozel boolean default true

);
insert into hastaneler values('H101','ACI MADEM HASTANESI','ISTANBUL','Y');
insert into hastaneler values('H102','HASZEKI HASTANESI','ISTANBUL','N');
insert into hastaneler values('H103','MEDIKOL HASTANESI','IZMIR','Y');
insert into hastaneler values('H104','NEMORYIL HASTANESI','ANKARA','Y');

    CREATE TABLE bolumler
    (
        bolum_id CHAR(5) PRIMARY KEY,
        bolum_adi VARCHAR(20)
    ); 
    
    INSERT INTO bolumler VALUES('DHL', 'Dahiliye');
    INSERT INTO bolumler VALUES('KBB', 'Kulak-Burun-Boğaz');
    INSERT INTO bolumler VALUES('NRJ', 'Noroloji');
    INSERT INTO bolumler VALUES('GAST', 'Gastoroloji');
    INSERT INTO bolumler VALUES('KARD', 'Kardioloji');
    INSERT INTO bolumler VALUES('PSK', 'Psikiyatri');
    INSERT INTO bolumler VALUES('GOZ', 'Goz Hastaliklari');
     
    CREATE TABLE hastalar
    (
        kimlik_no CHAR(11) PRIMARY KEY,
        isim VARCHAR(20),
        teshis VARCHAR(30)
    );
    
    INSERT INTO hastalar VALUES('12345678901', 'Ali Can','Gizli Seker');
    INSERT INTO hastalar VALUES('45678901121', 'Ayşe Yılmaz','Hipertansiyon');
    INSERT INTO hastalar VALUES('78901123451', 'Steve Job','Pankreatit');
    INSERT INTO hastalar VALUES('12344321251', 'Tom Hanks','COVID19');
    
    CREATE TABLE hasta_kayitlar
    (
        kimlik_no CHAR(11) primary key,
        hasta_isim VARCHAR(20),
        hastane_adi VARCHAR(50),
        bolum_adi VARCHAR(20), 
        teshis VARCHAR(30)
    ); 
    
    INSERT INTO hasta_kayitlar VALUES('1111','NONAME','','','');
    INSERT INTO hasta_kayitlar VALUES('2222','NONAME','','','');
    INSERT INTO hasta_kayitlar VALUES('3333','NONAME','','','');
    INSERT INTO hasta_kayitlar VALUES('4444','NONAME','','','');
    INSERT INTO hasta_kayitlar VALUES('5555','NONAME','','','');
    
select * from hastaneler;
select * from bolumler;
select * from hastalar;
select * from hasta_kayitlar;

/*

 hasta_kayitlar tablosundaki ‘3333’ kimlik nolu kaydı aşağıdaki gibi güncelleyiniz. 
 hasta_isim : ‘Salvadore Dali’ ismi ile
hastane_adi: ‘John Hopins’
bolum_adi: ‘Noroloji’
teshis: ‘Parkinson’
kimlik_no: ‘99991111222’
*/

update hasta_kayitlar
set
hasta_isim='Salvadore Dali',
hastane_adi='John Hopkins',
bolum_adi='noroloji',
teshis='Parkinson',
kimlik_no='99991111222'
where kimlik_no='3333';

/*
hasta_kayıtlar tablosundaki ‘1111’ kimlik nolu kaydı aşağıdaki gibi güncelleyiniz.
hasta_isim : hastalar tablosundaki ‘Ali Can’ ismi ile
hastane_adi: hastaneler tablosundaki 'H104' bolum_id kodlu hastanenin ismi ile 
bolum_adi: bolumler tablosundaki 'DHL' bolum_id kodlu bolum_adi ile
teshis: hastalar tablosundaki 'Ali Can' isimli hastanın teshis bilgisi ile
kimlik_no: hastalar tablosundaki 'Ali Can' isimli hastanın kimlik_no kodu ile

*/

update hasta_kayitlar
set
hasta_isim=(select isim from hastalar where isim='Ali Can'),
hastane_adi=(select isim from hastaneler where id='H104'),
bolum_adi=(select bolum_adi from bolumler where bolum_id='DHL'),
teshis=(select teshis from hastalar where isim='Ali Can'),
kimlik_no=(select kimlik_no from hastalar where isim='Ali Can')
where kimlik_no='1111';
select * from hasta_kayitlar;

/*
hasta_kayıtlar tablosundaki ‘2222’ kimlik nolu kaydı aşağıdaki gibi güncelleyiniz. 
hasta_isim : hastalar tablosundaki ‘Ayşe Yılmaz’ ismi ile
hastane_adi: hastaneler tablosundaki 'H103' bolum_id kodlu hastanenin ismi ile 
bolum_adi: bolumler tablosundaki ‘KBB’ bolum_id kodlu bolum_adi ile
teshis: hastalar tablosundaki ‘Tom Hanks' isimli hastanın teshis bilgisi ile 
kimlik_no: hastalar tablosundaki 'Stevev Job' isimli hastanın kimlik_no kodu ile
*/
update hasta_kayitlar
set
hasta_isim=(select isim from hastalar where isim='ayşe Yılmaz'),
hastane_adi=(select isim from hastaneler where id='H103'),
bolum_adi=(select bolum_adi from bolumler where bolum_id='KBB'),
teshis=(select teshis from hastalar where isim='Tom Hanks'),
kimlik_no=(select kimlik_no from hastalar where isim='Steve Job')
where kimlik_no='2222';
select * from hasta_kayitlar;
