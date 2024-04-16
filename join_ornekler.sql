--1.	Satýþ yapýlan müþterilerin isimlerini
--listelemek için gerekli SQL ifadesini yazýnýz.

select ( 'Sayýn '+ m.mAdi + ' ' + m.mSoyadi ) as musteriler
from satislar as s
join musteri m on m.mNo = s.mNo

--2.	Hangi müþteriden hangi aracýn alýndýðýný 
--listelemek için gerekli SQL ifadesini yazýnýz.
select m.mAdi, m.mSoyadi, ar.aMarka, ar.aModel 
from alislar as a
join musteri as m on a.mNo = m.mNo
join araclar as ar on ar.aracNo = a.aracNo

select musteri.mAdi, musteri.mSoyadi, araclar.aMarka, araclar.aModel 
from satislar
join musteri  on satislar.mNo = musteri.mNo
join araclar on araclar.aracNo = satislar.aracNo

--4.	Satýlan araçlarýn marka ve modelini
--bulmak için gerekli SQL ifadesini yazýnýz.
select araclar.aMarka, araclar.aModel 
from satislar
cross join araclar 









