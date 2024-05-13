CREATE DATABASE GALERI

USE GALERI

CREATE TABLE MUSTERI(
mNo int not null Primary Key,
mAdi nvarchar(50),
mSoyadi nvarchar(50),
mTelefon int,
mAdres nvarchar(100)
);

insert into MUSTERI values
(1,'Fatma Nur', 'Kýlýçkaya',555,'Kayseri')

select * from MUSTERI 
where mNo = 
(select mNo from MUSTERI where mNo = 1)

CREATE TABLE ARACLAR(
aracno int not null identity (1,1) Primary Key,
model nvarchar(50),
marka nvarchar(50),
yil int,
plaka nvarchar(100),
fiyat int
);
insert into ARACLAR values
('fiesta','ford',2024,'21 tw 29',40456)
select * from ARACLAR where plaka='21 tw 29'

create table Satislar(
satNo int identity(1,1) not null primary key,
mNo int constraint "mNo_FK" foreign key
(mNo) references MUSTERI(mNo),
aracNo int constraint "aracNo_FK" foreign key
(aracNo) references ARACLAR(aracNo),
satisTarihi datetime,
satisFiyati int
);

insert into MUSTERI values
(2,'Elif','Sosun',500,'Ankara')

insert into ARACLAR values
('golf','volkswagen',2024,'06 SSN 000',500000)

insert into Satislar values
(2,1,'2020-05-10',600000)
select * from Satislar 
where mNo=2

create table alislar (
alisNo int identity (1,1) primary key not null,
mNo int constraint "musteriNo_FK" foreign key
(mNo) references MUSTERI(mNo),
aracNo int constraint "aNo_FK" foreign key
(aracNo) references ARACLAR(aracNo),
alisTarihi datetime,
alisFiyati int
);

insert into alislar 
values (4, 1, '2025-10-23',21020)

insert into MUSTERI values (4, 'Merve', 'Cidecio' , 5288, 'Kayseri')
select*from MUSTERI
USE GALERI
insert into MUSTERI values(3,'Turgut','Özseven',893,'Kayseri')
insert into Satislar values(3,1,'2021-05-04', 7000)
select * from Satislar
insert into Satislar values(1,2,'2019-10-10',80000)
--1
SELECT m.mAdi, m.mSoyadi FROM Satislar S
join MUSTERI M on m.mNo = s.mNo
where aracNo = 
(select aracNo from Satislar where mNo =3)

--1
SELECT *  FROM MUSTERI where Mno IN
(Select mNo from Satislar where aracNo =
(select aracNo from Satislar where mNo =3))
--2
SELECT *FROM ARACLAR WHERE aracNo IN 
(SELECT aracNo FROM Satislar);

SELECT * FROM alislar
SELECT * FROM Satislar
--3
SELECT * FROM Satislar WHERE satisFiyati <
(SELECT alisFiyati FROM alislar ) 
--4
insert into ARACLAR values
('corsa', 'opel', 2021 , '40 PKA 350', 45000)
insert into Satislar values
(2,3,'2021-08-10',50000)


select * from MUSTERI WHERE mNo=
(SELECT mNo FROM Satislar WHERE aracNo=
(SELECT aracno FROM ARACLAR WHERE marka like '%opel%'))

select * from MUSTERI where mNo in
(select mNo from Satislar where aracNo
=(select aracNo from ARACLAR where marka like '%opel%'))
or mNo in (select mNo from alislar where aracNo
=(select aracNo from ARACLAR where marka like '%opel%'))


--10
select * from MUSTERI
join Satislar on Satislar.mNo = MUSTERI.mNo
join ARACLAR on araclar.aracno = Satislar.aracNo
where MUSTERI.mNo =
(select mNo from satislar where satisFiyati = 
(select max(satisFiyati) from  satislar ))



