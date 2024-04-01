USE OKUL_KUTUPHANESI
select * from KUTUPHANE

ALTER TABLE KUTUPHANE ALTER COLUMN KUTUPHANE_ADI nvarchar(100)

INSERT INTO KUTUPHANE VALUES('Tokat Üniversitesi','Merkez Kutuphanesi',1);
INSERT INTO KUTUPHANE VALUES('Ýstanbul Üniversitesi','Merkez Kutuphanesi',3);
INSERT INTO KUTUPHANE VALUES('Antalya Üniversitesi','Merkez Kutuphanesi',5);
INSERT INTO KUTUPHANE VALUES('ErciyesÜniversitesi','Merkez Kutuphanesi',7);
INSERT INTO KUTUPHANE VALUES('Uludað Üniversitesi','Merkez Kutuphanesi',9);
INSERT INTO KUTUPHANE VALUES('Aksaray Üniversitesi','Merkez Kutuphanesi',10);

