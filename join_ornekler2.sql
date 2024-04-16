create database galeri
use galeri;
create table musteri(
mNo int identity(1,1) Primary Key not null,
mAdi nvarchar(50),
mSoyadi nvarchar(50),
mTelefon int,
mAdres nvarchar(100)
);


create table araclar(
aracNo int identity(1,1) Primary Key not null,
aModel nvarchar(50),
aMarka nvarchar(50),
yil int,
plaka nvarchar(100),
fiyat int
);

create table satislar(
satisNo int identity(1,1) Primary Key not null,
mNo int Foreign Key references musteri(mNo),
aracNo int Foreign Key references araclar(aracNo),
satis_tarihi datetime,
satis_fiyati int
);


create table alislar(
alisNo int identity(1,1) Primary Key not null,
mNo int Foreign Key references musteri(mNo),
aracNo int Foreign Key references araclar(aracNo),
alis_tarihi datetime,
alis_fiyati int
);


select * from araclar
select * from musteri
select * from alislar
select * from satislar

insert into musteri values ('fatma nur', 'kýlýçkaya',2454,'Kayseri');
insert into musteri values ('dicle', 'çizik',893,'izmir');
insert into musteri values ('ahmet', 'özdoðan',728,'bursa');
insert into musteri values ('yaren', 'soysal',786,'antep');
insert into musteri values ('þahin', 'koç',76,'adana');
insert into musteri values ('özlem', 'güney',76633,'istanbul');


insert into araclar values('opel', 'astra',2024,'38F3535',70000);
insert into araclar values('mercedes', 'c200',2024,'38f835',70000);
insert into araclar values('audi', 'a4',2024,'38dfy3464',70000);
insert into araclar values('ford', 'fiesta',2024,'45R3573',70000);

insert into alislar values (5,3,'2024-04-16',100000);
insert into satislar values (1,4,'2024-04-16',100000);
insert into satislar values (2,3,'2024-04-16',100000);
insert into satislar values (3,2,'2024-04-16',100000);
insert into satislar values (4,1,'2024-04-16',100000);