select MUSTERI.mAdi, MUSTERI.mSoyadi from Satislar
inner join MUSTERI on MUSTERI.mNo = Satislar.mNo

select +m.mAdi + ' '+ m.mSoyadi from Satislar as s
inner join MUSTERI as m on m.mNo = s.mNo

 select * from alislar
 join MUSTERI on MUSTERI.mNo =alislar.mNo
 join ARACLAR on  ARACLAR.aracno = alislar.aracNo

 select count(alislar.aracNo) from alislar
 join MUSTERI on alislar.mNo = MUSTERI.mNo
 join ARACLAR on ARACLAR.aracno= alislar.aracNo
   

   select ARACLAR.marka,ARACLAR.MODEL from Satislar
   join ARACLAR on   ARACLAR.aracno= Satislar.aracNo

   SELECT (SELECT SUM(satisFiyati) FROM Satislar) - 
   (SELECT SUM(alisFiyati) FROM alislar) AS CIKARILANTUTAR,
  (SELECT SUM(satisFiyati) from Satislar) as satistoplam,
  (select sum(alisFiyati) from alislar) as alistoplam


  select SUM(satisFiyati) from Satislar
  SELECT SUM(alisFiyati) FROM alislar

  SELECT SUM(satisFiyati)-SUM(alisFiyati) FROM ARACLAR a
  JOIN Satislar as s ON s.aracNo = a.aracno
  JOIN alislar al on al.aracNo = a.aracno

  select * from ARACLAR WHERE aracno not in  
  (select aracNo from Satislar) 

  select avg (satisFiyati)  from Satislar
  join ARACLAR on  ARACLAR.aracno=Satislar.aracNo

  select count(*) from araclar where aracno in
  ( select aracno from alislar where aracno in 
  ( select aracno from satislar))

  select * from Satislar
  join ARACLAR on ARACLAR.aracno = Satislar.aracNo
  join MUSTERI on MUSTERI.mNo = Satislar.mNo
  where satisFiyati > 20000

  select * from Satislar
  join MUSTERI on MUSTERI.	mNo = Satislar.mNO
 join ARACLAR ON ARACLAR.aracno = Satislar.aracNo
 where MUSTERI.mAdres ='tokat'
