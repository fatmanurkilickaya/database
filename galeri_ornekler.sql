--1.	Sat�� yap�lan m��terilerin 
--isimlerini listelemek i�in gerekli 
--SQL ifadesini yaz�n�z.

select musteri.mAdi, musteri.mSoyadi from satislar
join musteri on satislar.mNo = musteri.mNo

--2.	Hangi m��teriden hangi arac�n al�nd���n� 
--listelemek i�in gerekli SQL ifadesini yaz�n�z.
SELECT musteri.mAdi, araclar.marka,araclar.model from alislar 
join musteri on musteri.mNo=alislar.mNo 
join araclar on alislar.aNo=araclar.aracNo

--2.	Hangi m��teriden hangi arac� satt���m� 
--listelemek i�in gerekli SQL ifadesini yaz�n�z.
SELECT musteri.mAdi, musteri.mSoyadi, araclar.marka, araclar.model,
satislar.satis_fiyati from satislar
join musteri on musteri.mNo=satislar.mNo
join araclar on araclar.aracNo=satislar.aNo