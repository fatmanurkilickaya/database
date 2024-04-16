﻿CREATE DATABASE OKUL_KUTUPHANESI;
USE OKUL_KUTUPHANESI
CREATE TABLE UYELER(
	UYE_NO INT IDENTITY(1,1),
	UYE_ADI VARCHAR(20),
	UYE_SOYADI VARCHAR(20),
	CINSIYET VARCHAR(5),
	TELEFON VARCHAR(15),
	EPOSTA VARCHAR(40),
	ADRES_NO INT,
	PRIMARY KEY("UYE_NO")
);



CREATE TABLE ADRESLER(
	ADRES_NO INT IDENTITY(1,1),
	CADDE VARCHAR(20),
	MAHALLE VARCHAR(20),
	BINA_NO VARCHAR(20),
	SEHIR VARCHAR(20),
	POSTA_KODU INT, 
	ULKE VARCHAR(20),
	PRIMARY KEY ("ADRES_NO")
);

ALTER TABLE UYELER ADD CONSTRAINT "ADRESLER_UYELER" 
FOREIGN KEY (ADRES_NO) REFERENCES ADRESLER(ADRES_NO);


CREATE TABLE EMANET(
	EMANET_NO INT IDENTITY(1,1),
	ISBN VARCHAR(20) NOT NULL,
	UYE_NO INT NOT NULL,
	KUTUPHANE_NO INT NOT NULL,
	EMANET_TARIHI DATETIME,
	TESLIM_TARIHI DATETIME,
	PRIMARY KEY ("EMANET_NO")
);

CREATE TABLE KITAPLAR(
	ISBN VARCHAR(20),
	KITAP_ADI VARCHAR(20),
	YAYIN_TARIHI VARCHAR(20),
	S_SAYISI INT,
	PRIMARY KEY ("ISBN")
);

CREATE TABLE YAZARLAR(
	YAZAR_NO INT IDENTITY(1,1),
	YAZAR_ADI VARCHAR(20),
	YAZAR_SOYADI VARCHAR(20),
	PRIMARY KEY ("YAZAR_NO")
);

CREATE TABLE KATEGORILER(
	KATEGORI_NO INT IDENTITY(1,1),
	KATEGORI_ADI VARCHAR(20),
	PRIMARY KEY ("KATEGORI_NO")
);

CREATE TABLE KUTUPHANE(
	KUTUPHANE_NO INT IDENTITY(1,1),
	KUTUPHANE_ADI VARCHAR(20),
	ACIKLAMA VARCHAR(20),
	ADRES_NO INT,
	PRIMARY KEY ("KUTUPHANE_NO")
);

CREATE TABLE KITAP_KUTUPHANE(
	KUTUPHANE_NO INT NOT NULL,
	ISBN VARCHAR(20) NOT NULL,
	MIKTAR INT,
	CONSTRAINT "KITAP_KUTUPHANE_PK" PRIMARY KEY ("KUTUPHANE_NO", "ISBN"),
	CONSTRAINT "KITAP_KUTUPHANE_FK" FOREIGN KEY ("KUTUPHANE_NO") REFERENCES KATEGORILER(KATEGORI_NO)

);

ALTER TABLE KITAP_KUTUPHANE ADD CONSTRAINT "KITAP_KUTUPHANE_KITAPLAR_FK" FOREIGN KEY ("ISBN") REFERENCES KITAPLAR(ISBN);


CREATE TABLE KITAP_KATEGORI(
	ISBN VARCHAR(20) NOT NULL,
	KATEGORI_NO INT NOT NULL,
	CONSTRAINT "KITAP_KATEGORI_PK" PRIMARY KEY ("KATEGORI_NO", "ISBN")
);

CREATE TABLE KITAP_YAZAR(
	ISBN VARCHAR(20) NOT NULL,
	YAZAR_NO INT NOT NULL,
	CONSTRAINT "KITAP_YAZAR_PK" PRIMARY KEY ("YAZAR_NO", "ISBN")
);


---KUTUPHANE
USE OKUL_KUTUPHANESI;
ALTER TABLE KUTUPHANE ADD CONSTRAINT "ADRESLER_KUTUPHANE" 
FOREIGN KEY (ADRES_NO) REFERENCES ADRESLER(ADRES_NO)
ON DELETE SET NULL
ON UPDATE CASCADE;

--- EMANET

USE OKUL_KUTUPHANESI;
ALTER TABLE EMANET ADD CONSTRAINT "UYELER_EMANET" 
FOREIGN KEY (UYE_NO) REFERENCES UYELER(UYE_NO);

USE OKUL_KUTUPHANESI;
ALTER TABLE EMANET ADD CONSTRAINT "EMANET_KITAPLAR" 
FOREIGN KEY (ISBN) REFERENCES KITAPLAR(ISBN);

USE OKUL_KUTUPHANESI;
ALTER TABLE EMANET ADD CONSTRAINT "KUTUPHANE_EMANET" 
FOREIGN KEY (KUTUPHANE_NO) REFERENCES KUTUPHANE(KUTUPHANE_NO);

---KITAP_KATEGORI
USE OKUL_KUTUPHANESI;
ALTER TABLE KITAP_KATEGORI ADD CONSTRAINT KATEGORILER_KITAP_KATEGORI
FOREIGN KEY (KATEGORI_NO) REFERENCES KATEGORILER(KATEGORI_NO);

USE OKUL_KUTUPHANESI;
ALTER TABLE KITAP_KATEGORI ADD CONSTRAINT KITAPLAR_KITAP_KATEGORI
FOREIGN KEY (ISBN) REFERENCES KITAPLAR(ISBN);

---KITAP_YAZAR
USE OKUL_KUTUPHANESI;
ALTER TABLE KITAP_YAZAR ADD CONSTRAINT YAZARLAR_KITAP_YAZAR
FOREIGN KEY (YAZAR_NO) REFERENCES YAZARLAR(YAZAR_NO);

USE OKUL_KUTUPHANESI;
ALTER TABLE KITAP_YAZAR ADD CONSTRAINT KITAPLAR_KITAP_YAZAR
FOREIGN KEY (ISBN) REFERENCES KITAPLAR(ISBN);

---KITAP_KUTUPHANE
USE OKUL_KUTUPHANESI;
ALTER TABLE KITAP_KUTUPHANE ADD CONSTRAINT KUTUPHANE_KITAP_KUTUPHANE
FOREIGN KEY (KUTUPHANE_NO) REFERENCES KUTUPHANE(KUTUPHANE_NO);

USE OKUL_KUTUPHANESI;
ALTER TABLE KITAP_KUTUPHANE ADD CONSTRAINT KITAPLAR_KITAP_KUTUPHANE
FOREIGN KEY (ISBN) REFERENCES KITAPLAR(ISBN);

USE OKUL_KUTUPHANESI
SELECT * FROM ADRESLER


INSERT INTO ADRESLER VALUES('Orhangazi', 'Esentepe','5','Tokat',60100,'Türkiye');
INSERT INTO ADRESLER VALUES('Sivas', 'Kemer','34','Samsun',50456,'Türkiye');
INSERT INTO ADRESLER VALUES('Atatürk', 'Barbaros','78','Ýstanbul',245879,'Türkiye');
INSERT INTO ADRESLER VALUES('Sipahi', 'Þamlar','72','Amasya',78212,'Türkiye');
INSERT INTO ADRESLER VALUES('Null', 'Kaþ','89','Antalya',15465,'Türkiye');
INSERT INTO ADRESLER VALUES('Onbeþ Temmuz', 'Kýzýlay','15','Ankara',1578,'Türkiye');
INSERT INTO ADRESLER VALUES('Mevlana', 'Mevlana','38','Kayseri',47845,'Türkiye');
INSERT INTO ADRESLER VALUES('Gürsel', 'Tuna','56','Ýzmir',264,'Türkiye');
INSERT INTO ADRESLER VALUES('Nilüfer', 'Bahçelievler','42','Bursa',45787,'Türkiye');
INSERT INTO ADRESLER VALUES('Bahçesaray', 'Taþpazar','68','Aksaray',15478,'Türkiye');

 INSERT INTO UYELER VALUES('Ayþe', 'Kara', 'K',3561,'ak@mail.com',1) 
 INSERT INTO UYELER VALUES('Ali', 'Uçar', 'E',7845,'au@mail.com',2); 
 INSERT INTO UYELER VALUES('Ahmet', 'Davut', 'E',5878,'ad@mail.com',3); 
 INSERT INTO UYELER VALUES('Murat', 'Sönmez', 'E',4787,'ms@mail.com',8); 
 INSERT INTO UYELER VALUES('Burak', 'Torun', 'E',7857,'bt@mail.com',4); 
 INSERT INTO UYELER VALUES('Ayla', 'Yýlmaz', 'K',4785,'ay@mail.com',7) ;
 INSERT INTO UYELER VALUES('Mustafa', 'Demir', 'E',4057,'md@mail.com',5) ;
 INSERT INTO UYELER VALUES('Turgut', 'Murat', 'E',7812,'tm@mail.com',9); 
 INSERT INTO UYELER VALUES('Fevzi', 'Yýlmaz', 'E',4987,'fy@mail.com',6); 
 INSERT INTO UYELER VALUES('Elif', 'Uymaz', 'K',7812,'eu@mail.com',10); 
 select * from UYELER where TELEFON like '%5%'

 select UYE_ADI, UYE_SOYADI 
 from UYELER where UYE_ADI like '%a%'

 --3. ÜYELER tablosunda kayıtların var olduğu varsayıldığında, 
 --kayıtları “UyeNo” sütununa göre
--artan sırada listelemek için gerekli SQL ifadesini yazınız
select * from UYELER order by UYE_NO ASC
SELECT * FROM UYELER ORDER BY UYE_SOYADI DESC

SELECT UYELER.UYE_ADI FROM ADRESLER
JOIN UYELER ON UYELER.ADRES_NO = ADRESLER.ADRES_NO
WHERE ADRESLER.SEHIR = 'Antalya'
order by uyeler.UYE_ADI asc


SELECT * FROM ADRESLER
SELECT * FROM UYELER

SELECT * FROM ADRESLER
JOIN UYELER ON UYELER.ADRES_NO = ADRESLER.ADRES_NO
WHERE ADRESLER.ULKE = 'Kazakistan'
--order by uyeler.UYE_ADI asc
