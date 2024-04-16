--1.	Sat�� yap�lan m��terilerin isimlerini
--listelemek i�in gerekli SQL ifadesini yaz�n�z.

select ( 'Say�n '+ m.mAdi + ' ' + m.mSoyadi ) as musteriler
from satislar as s
join musteri m on m.mNo = s.mNo

--2.	Hangi m��teriden hangi arac�n al�nd���n� 
--listelemek i�in gerekli SQL ifadesini yaz�n�z.
select m.mAdi, m.mSoyadi, ar.aMarka, ar.aModel 
from alislar as a
join musteri as m on a.mNo = m.mNo
join araclar as ar on ar.aracNo = a.aracNo

select musteri.mAdi, musteri.mSoyadi, araclar.aMarka, araclar.aModel 
from satislar
join musteri  on satislar.mNo = musteri.mNo
join araclar on araclar.aracNo = satislar.aracNo

--4.	Sat�lan ara�lar�n marka ve modelini
--bulmak i�in gerekli SQL ifadesini yaz�n�z.
select araclar.aMarka, araclar.aModel 
from satislar
cross join araclar 









