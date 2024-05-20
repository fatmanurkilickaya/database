--B�RDEN FAZLA TABLO �ZER�NDEN SORGULAR
--1.	Sat�� yap�lan m��terilerin isimlerini listelemek i�in gerekli SQL ifadesini yaz�n�z.
--JOIN
SELECT (m.mAdi+ ''+mSoyadi)as satis_yapilanlar 
FROM Satislar s
INNER JOIN MUSTERI m ON  s.mNo = m.mNo
--ALT SORGU
SELECT (mAdi+ '' + mSoyadi)as satis_yapilanlar
FROM MUSTERI WHERE mNo
IN(select mNo from Satislar)

--2.	Hangi m��teriden hangi arac�n al�nd���n� listelemek i�in gerekli SQL ifadesini yaz�n�z.

SELECT * FROM alislar a 

INNER JOIN MUSTERI m on a.mNo= m.mNo
INNER JOIN ARACLAR ar on ar.aracno = a.aracNo

--3.	Her bir m��teriden al�nan ara�lar�n say�s�n� listelemek i�in gerekli SQL ifadesini yaz�n�z.


select count(alislar.mNo) from alislar 
join MUSTERI on alislar.mNo = MUSTERI.mNo


select count(mNo) from MUSTERI where mNo in(  select mNo from alislar )

--4.	Sat�lan ara�lar�n marka ve modelini bulmak i�in gerekli SQL ifadesini yaz�n�z.-

SELECT ARACLAR.marka ,ARACLAR.model from Satislar
JOIN ARACLAR on ARACLAR.aracno=Satislar.aracNo

--5.	Toplam sat�� ve toplam al�m tutarlar�n� ve bunlar�n fark�n� bulmak i�in gerekli SQL ifadesini yaz�n�z.

select (SELECT SUM(satisFiyati) FROM Satislar) - (select sum(alisFiyati) from alislar) as CikarilanTutar

SELECT (select SUM(satisFiyati) FROM Satislar as ToplamSatis) as ToplamSatis,
(select sum(alisFiyati) from alislar) as ToplamAlis,
(SELECT SUM(satisFiyati) FROM Satislar) - (select sum(alisFiyati) from alislar) as CikarilanTutar

--6.soru (join)

select *  from ARACLAR
join Satislar on Satislar.aracNo =ARACLAR.aracno where not exists(select Satislar.aracNo)

select * from ARACLAR where aracno
not in(select aracno from Satislar)


--7.	Her arac�n ortalama sat�� tutar�n� bulmak i�in gerekli SQL ifadesini yaz�n�z.
select AVG(Satislar.satisFiyati) from Satislar 
JOIN ARACLAR on Satislar.aracNo = ARACLAR.aracno

--8.	Al�m� ve sat��� yap�lan t�m ara�lar�n marka, model ve al�m-sat�� say�s�n� listelemek i�in gerekli SQL ifadesiniz yaz�n�z.
SELECT *FROM ARACLAR WHERE aracno
IN (select aracno from alislar where aracno IN (select aracno from Satislar))


--9.	20000�den fazla tutara sat�lan ara�lar� kimlerin hangi arac� ald���n� bulmak i�in gerekli SQL ifadesini yaz�n�z
select * from Satislar 
join ARACLAR on ARACLAR.aracno = Satislar.aracNo
join MUSTERI on MUSTERI.mNo = Satislar.mNo
where satisFiyati > 20000

--10.	Tokatta bulunan m��terilere sat��� yap�lan ara�lar� listelemek i�in gerekli SQL ifadesini yaz�n�z.
select * from Satislar
join MUSTERI on MUSTERI.mNo = Satislar.mNo
join ARACLAR on ARACLAR.aracno = Satislar.aracNo
where MUSTERI.mAdres = 'TOKAT'

