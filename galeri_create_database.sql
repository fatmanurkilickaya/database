create database galeri;
use galeri;

create table musteri(
mNo int identity(1,1) Primary Key not null,
mAdi nvarchar(50),
mSoyadi nvarchar(50),
mTelefon int,
mAdres nvarchar(150),
);

create table araclar(
aracNo int identity(1,1) Primary Key not null,
model nvarchar(50),
marka nvarchar(50),
yil int,
plaka nvarchar(50),
fiyat int
);


create table alislar(
alisNo int identity(1,1) Primary Key not null,
mNo int,
aNo int,
alis_tarihi datetime,
alis_fiyati int
);

create table satislar(
satisNo int identity(1,1) Primary Key not null,
mNo int,
aNo int,
satis_tarihi datetime,
satis_fiyati int
);

select * from musteri;
select * from alislar;
select * from satislar;
select * from araclar;

insert into musteri 
values('Fatma Nur', 'Kýlýçkaya',5678,'Kayseri');
insert into musteri 
values('Emre', 'Oskay',56374,'Antalya');
insert into musteri 
values('Mükremin', 'Evci',123,'Ýzmir');
insert into musteri 
values('Anton', 'Anton',7856,'Kazakistan');
insert into musteri 
values('adilbelk', 'adilbelk',7465,'Kazakistan');

select mTelefon from musteri
where mAdres ='roma' and 
(mAdi like '%t' or mSoyadi like '%i%')

insert into araclar
values('fiesta','ford',2024,'45R35',7000);
insert into araclar
values('astra','opel',2014,'38F35',12000);
insert into araclar
values('C200','mercedes',2022,'68M35',52000);

insert into satislar values(1,3,'2024-04-15',70000)
insert into alislar values(2,1,'2022-12-10',1000)

