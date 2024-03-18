create database school_library;
use school_library;
create table uyeler(
uyeNo int not null identity(1,1) Primary Key,
uyeAdi nvarchar(50) not null,
uyeSoyadi nvarchar(50) not null,
cinsiyet nchar(5),
eposta nvarchar(100),
telefon int
);

use school_library;

--ALTER TABLE uyeler ADD CONSTRAINT "adres_uyeler"
--FOREIGN KEY(adresNo) references adresler(adresNo);

ALTER TABLE uyeler
    ADD adresNo INT
    CONSTRAINT FK_uyeler_adresNo 
        FOREIGN KEY (adresNo) 
        REFERENCES adresler(adresNo);

use school_library;
create table adresler(
adresNo int not null identity(1,1) Primary Key,
sehir nvarchar(50) not null,
mahalle nvarchar(50) not null,
cadde nvarchar(50) not null,
binaNo int,
postaKodu nvarchar(20),
ulke nvarchar(50)
);
CREATE TABLE KUTUPHANE(
KUTUPHANENO int primary key identity(1,1),
KUTUPHANEISMI nvarchar (50),
ACIKLAMA nvarchar(200),
ADRESNO  int CONSTRAINT FK_kutuphane_adres 
FOREIGN KEY (ADRESNO) REFERENCES adresler(ADRESNO)
);

CREATE TABLE KITAPLAR(
ISBN nvarchar(50) primary key,
KITAPADI nvarchar (50),
SAYFASAYISI int,
YAYINTARIHI DATETIME
);



CREATE TABLE EMANET(
emanetNo int  identity(1,1) not null,
emanetTarihi datetime,
teslimTarihi datetime,
uyeNo int CONSTRAINT FK_uyeler_emanet 
FOREIGN KEY (uyeNo) REFERENCES uyeler(uyeNo),
kutuphaneNo int CONSTRAINT FK_kutuphane_emanet 
FOREIGN KEY (kutuphaneNo) REFERENCES kutuphane(kutuphaneNo),
ISBN nvarchar(50) CONSTRAINT FK_kitap_emanet 
FOREIGN KEY(ISBN) REFERENCES KITAPLAR(ISBN)
);

SELECT * FROM UYELER;
SELECT * FROM ADRESLER;
SELECT * FROM KUTUPHANE;
SELECT * FROM KITAPLAR;
SELECT * FROM EMANET;


