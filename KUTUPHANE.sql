USE OKUL_KUTUPHANESI
select * from KUTUPHANE

ALTER TABLE KUTUPHANE ALTER COLUMN KUTUPHANE_ADI nvarchar(100)

INSERT INTO KUTUPHANE VALUES('Tokat �niversitesi','Merkez Kutuphanesi',1);
INSERT INTO KUTUPHANE VALUES('�stanbul �niversitesi','Merkez Kutuphanesi',3);
INSERT INTO KUTUPHANE VALUES('Antalya �niversitesi','Merkez Kutuphanesi',5);
INSERT INTO KUTUPHANE VALUES('Erciyes�niversitesi','Merkez Kutuphanesi',7);
INSERT INTO KUTUPHANE VALUES('Uluda� �niversitesi','Merkez Kutuphanesi',9);
INSERT INTO KUTUPHANE VALUES('Aksaray �niversitesi','Merkez Kutuphanesi',10);

