create database galeri
use galeri

create table musteri(
mNO int not null Primary Key,
mAdi nvarchar(50),
mSoyadi nvarchar(50),
mAdres nvarchar(100),
mTelefon int
);
insert into musteri values
(1,'Fatma Nur', 'Kýlýçkaya','Kayseri',896)

insert into musteri values
(2,'Yýldýz', 'Coþkun','Kayseri',125)
select mAdi from musteri

select * 
from musteri
join
where
Group by
having
order by;


select * from musteri 
where mNo NOT IN
(select mNo from musteri where mAdres = 'Kayseri')

CREATE TABLE ARACLAR(
AracNo int not null primary key,
yil int,
Marka nvarchar(50),
model nvarchar(50),
plaka nvarchar(50),
fiyat int
)

insert into ARACLAR values
(1,2020,'mercedes','AMG','61LJ25',750000)
insert into ARACLAR values
(2,2010,'BMW','M5','38HZ159',500000)

SELECT plaka FROM ARACLAR WHERE AracNo = 1
CREATE TABLE satis(
SatNo int not null primary key ,
Mno int constraint 
"mNo_FK" FOREIGN KEY (Mno)  REFERENCES  musteri(mNo),
AracNo int constraint "ano_fk" FOREIGN KEY (AracNo)
REFERENCES araclar(aracNo),
Sat_Tarih date,
Sfiyat int);

insert into satis values (1,2,1,'2024-03-12',125000)
insert into satis values (2,2,2,'2022-07-23',98700)

create table alislar(
alisNo int primary key,
mNo int constraint "muno_fk" foreign key(mNo) 
references musteri(mNo),
AracNo int constraint "arno_fk" foreign key(AracNo) 
references araclar(AracNo),
AlimTarih datetime,
aFiyat int);

insert into alislar values (1,1,2,'2024-01-19',350000)
insert into alislar values (2,2,1,'2024-02-18',400000)

select * from musteri
Insert into musteri values (3,'Turgut','Özseven','Ýzmir',789)

select * from satis
insert into satis values(3,3,1,'2024-05-14',789450)





select * from ARACLAR 
join satis on satis.AracNo = ARACLAR.AracNo
join musteri on musteri.mNO = satis.AracNo
where araclar.AracNo=
(select AracNo from satis 
where Mno =3)



SELECT * FROM musteri WHERE mNO 
IN (select Mno from satis where aracNo =
(select AracNo from satis where Mno=3))
 
 select * from ARACLAR where AracNo in 
 (select AracNo from satis);

 select * from satis where Sfiyat < any 
 (Select aFiyat from alislar)

 select*from ARACLAR
 insert into ARACLAR values (3,2000,'opel','corsa','38cn34',1412)
 select*from satis
 insert into satis values (4,3,3,'2024-08-12',56767)

 select*from musteri where mNO=
 (select mNO from satis where AracNo=
 (select AracNo from ARACLAR where marka like '%opel%'))
