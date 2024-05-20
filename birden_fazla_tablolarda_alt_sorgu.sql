--BÝRDEN FAZLA TABLO ÜZERÝNDEN SORGULAR
--1.	Satýþ yapýlan müþterilerin isimlerini listelemek için gerekli SQL ifadesini yazýnýz.
--JOIN
SELECT (m.mAdi+ ''+mSoyadi)as satis_yapilanlar 
FROM Satislar s
INNER JOIN MUSTERI m ON  s.mNo = m.mNo
--ALT SORGU
SELECT (mAdi+ '' + mSoyadi)as satis_yapilanlar
FROM MUSTERI WHERE mNo
IN(select mNo from Satislar)

--2.	Hangi müþteriden hangi aracýn alýndýðýný listelemek için gerekli SQL ifadesini yazýnýz.

SELECT * FROM alislar a 

INNER JOIN MUSTERI m on a.mNo= m.mNo
INNER JOIN ARACLAR ar on ar.aracno = a.aracNo

--3.	Her bir müþteriden alýnan araçlarýn sayýsýný listelemek için gerekli SQL ifadesini yazýnýz.


select count(alislar.mNo) from alislar 
join MUSTERI on alislar.mNo = MUSTERI.mNo


select count(mNo) from MUSTERI where mNo in(  select mNo from alislar )

--4.	Satýlan araçlarýn marka ve modelini bulmak için gerekli SQL ifadesini yazýnýz.-

SELECT ARACLAR.marka ,ARACLAR.model from Satislar
JOIN ARACLAR on ARACLAR.aracno=Satislar.aracNo

--5.	Toplam satýþ ve toplam alým tutarlarýný ve bunlarýn farkýný bulmak için gerekli SQL ifadesini yazýnýz.

select (SELECT SUM(satisFiyati) FROM Satislar) - (select sum(alisFiyati) from alislar) as CikarilanTutar

SELECT (select SUM(satisFiyati) FROM Satislar as ToplamSatis) as ToplamSatis,
(select sum(alisFiyati) from alislar) as ToplamAlis,
(SELECT SUM(satisFiyati) FROM Satislar) - (select sum(alisFiyati) from alislar) as CikarilanTutar

--6.soru (join)

select *  from ARACLAR
join Satislar on Satislar.aracNo =ARACLAR.aracno where not exists(select Satislar.aracNo)

select * from ARACLAR where aracno
not in(select aracno from Satislar)


--7.	Her aracýn ortalama satýþ tutarýný bulmak için gerekli SQL ifadesini yazýnýz.
select AVG(Satislar.satisFiyati) from Satislar 
JOIN ARACLAR on Satislar.aracNo = ARACLAR.aracno

--8.	Alýmý ve satýþý yapýlan tüm araçlarýn marka, model ve alým-satýþ sayýsýný listelemek için gerekli SQL ifadesiniz yazýnýz.
SELECT *FROM ARACLAR WHERE aracno
IN (select aracno from alislar where aracno IN (select aracno from Satislar))


--9.	20000’den fazla tutara satýlan araçlarý kimlerin hangi aracý aldýðýný bulmak için gerekli SQL ifadesini yazýnýz
select * from Satislar 
join ARACLAR on ARACLAR.aracno = Satislar.aracNo
join MUSTERI on MUSTERI.mNo = Satislar.mNo
where satisFiyati > 20000

--10.	Tokatta bulunan müþterilere satýþý yapýlan araçlarý listelemek için gerekli SQL ifadesini yazýnýz.
select * from Satislar
join MUSTERI on MUSTERI.mNo = Satislar.mNo
join ARACLAR on ARACLAR.aracno = Satislar.aracNo
where MUSTERI.mAdres = 'TOKAT'

