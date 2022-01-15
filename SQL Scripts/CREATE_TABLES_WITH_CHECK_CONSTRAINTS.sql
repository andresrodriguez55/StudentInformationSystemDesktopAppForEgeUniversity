CREATE DATABASE OGRENCI_BILGI_SISTEMI_DUYURU_VERITABANI

USE OGRENCI_BILGI_SISTEMI_DUYURU_VERITABANI;

CREATE TABLE DUYURUCU 
(
	Kimlik_numarasi BIGINT, /* TC kimlik numaras� 11 haneden olu�ur */
	Sifre VARCHAR (22) NOT NULL,
	Ad VARCHAR (43) NOT NULL, /* T�rkiye'de en uzun isim 43 harften olu�uyor; Aybike G�liz Enzel Ya�mur Eflinnisa Nebio�ullar� */
	Soyad VARCHAR (35) NOT NULL,

	PRIMARY KEY (Kimlik_numarasi),

	/* TC K�ML�K NUMARASI KURALLARI 
	    -TC kimlik no 11 haneli rakamlardan olu�ur.
		-�lk rakam s�f�r (0) olamaz.
		*-1, 3, 5, 7 ve 9. hanelerin toplam�n�n 7 kat� ile 2, 4, 6 ve 8. hanelerin toplam� ��kart�l�r, sonucun 10�a b�l�m�nden kalan� 10. haneyi verir.
		*-�lk 10 hanenin toplam�n�n 10�a b�l�m�nden kalan, son haneyi verir.
		*-Ayr�ca �e�itli hatal� kabul edilen TC kimlik numaralar� vard�r. */

	CHECK (Kimlik_numarasi>09999999999), 
	CHECK (Kimlik_numarasi<100000000000)
);

CREATE TABLE OGRENCI_ISLERI_DUYURUCUSU 
(
	Kimlik_numarasi BIGINT,

	PRIMARY KEY (Kimlik_numarasi),
	FOREIGN KEY (Kimlik_numarasi) REFERENCES DUYURUCU (Kimlik_numarasi) ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE FAKULTE  
(
	Fakulte_ismi VARCHAR(30),

	CHECK ( LEN(Fakulte_ismi) > 5 ),

	PRIMARY KEY(Fakulte_ismi),
);

CREATE TABLE BOLUM
(
	Bolum_ismi VARCHAR(30),
	Fakulte_ismi VARCHAR(30),

	CHECK ( LEN(Bolum_ismi) > 2 ),

	PRIMARY KEY(Bolum_ismi),
	FOREIGN KEY (Fakulte_ismi) REFERENCES FAKULTE (Fakulte_ismi) ON DELETE SET NULL ON UPDATE CASCADE,
);

CREATE TABLE BOLUM_DUYURUCUSU  
(
	Kimlik_numarasi BIGINT,
	Bolum_ismi VARCHAR(30),

	PRIMARY KEY(Kimlik_numarasi),
	FOREIGN KEY (Kimlik_numarasi) REFERENCES DUYURUCU (Kimlik_numarasi) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (Bolum_ismi) REFERENCES BOLUM (Bolum_ismi) ON DELETE SET NULL ON UPDATE CASCADE,
);

CREATE TABLE FAKULTE_DUYURUCUSU 
(
	Kimlik_numarasi BIGINT,
	Fakulte_ismi VARCHAR(30),

	PRIMARY KEY(Kimlik_numarasi),
	FOREIGN KEY (Kimlik_numarasi) REFERENCES DUYURUCU (Kimlik_numarasi) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (Fakulte_ismi) REFERENCES FAKULTE (Fakulte_ismi) ON DELETE SET NULL ON UPDATE CASCADE,
);

CREATE TABLE DUYURU 
(
	Duyuru_id INT IDENTITY(1,1),
	Duyuru_basligi VARCHAR(100) NOT NULL, 
	Duyuru_icerigi VARCHAR(8000) NOT NULL,
	Duyuru_tarihi DATE NOT NULL,
	Kimlik_numarasi BIGINT NOT NULL,
	
	PRIMARY KEY(Duyuru_id),
	FOREIGN KEY(Kimlik_numarasi) REFERENCES DUYURUCU(Kimlik_numarasi) ON DELETE CASCADE ON UPDATE CASCADE,

	CHECK (Duyuru_id>=1), /* E�er manual girilirse */
	CHECK (LEN(Duyuru_basligi)>6), 
	CHECK (LEN(Duyuru_icerigi)>15), 
);

CREATE TABLE YONELIK  
(
	Yonelik_id INT IDENTITY(1,1),
	Duyuru_id INT NOT NULL,
	Fakulte_ismi VARCHAR(30),
	Bolum_ismi VARCHAR(30),

	PRIMARY KEY(Yonelik_id),
	UNIQUE(Duyuru_id, Fakulte_ismi, Bolum_ismi), /* MSSQL Composite Primary Keylerinde bir s�t�n�n NULL de�eri i�ermesine izin vermedi�inden dolay� UNIQUE kullan�lm��t�r.*/
	FOREIGN KEY (Duyuru_id) REFERENCES DUYURU(Duyuru_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(Bolum_ismi) REFERENCES BOLUM(Bolum_ismi)  ON DELETE NO ACTION ON UPDATE NO ACTION,
	FOREIGN KEY(Fakulte_ismi) REFERENCES FAKULTE(Fakulte_ismi) ON DELETE NO ACTION ON UPDATE CASCADE,
);