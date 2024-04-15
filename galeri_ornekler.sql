--1.	Satýþ yapýlan müþterilerin 
--isimlerini listelemek için gerekli 
--SQL ifadesini yazýnýz.

select musteri.mAdi, musteri.mSoyadi from satislar
join musteri on satislar.mNo = musteri.mNo

--2.	Hangi müþteriden hangi aracýn alýndýðýný 
--listelemek için gerekli SQL ifadesini yazýnýz.
SELECT musteri.mAdi, araclar.marka,araclar.model from alislar 
join musteri on musteri.mNo=alislar.mNo 
join araclar on alislar.aNo=araclar.aracNo

--2.	Hangi müþteriden hangi aracý sattýðýmý 
--listelemek için gerekli SQL ifadesini yazýnýz.
SELECT musteri.mAdi, musteri.mSoyadi, araclar.marka, araclar.model,
satislar.satis_fiyati from satislar
join musteri on musteri.mNo=satislar.mNo
join araclar on araclar.aracNo=satislar.aNo