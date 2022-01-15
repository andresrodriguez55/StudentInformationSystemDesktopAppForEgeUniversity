USE OGRENCI_BILGI_SISTEMI_DUYURU_VERITABANI;

GO
CREATE TRIGGER DISJOINT_BOLUM_DUYURUCUSU ON BOLUM_DUYURUCUSU
AFTER INSERT
AS 
IF EXISTS
		(
			SELECT 1 FROM inserted AS t, FAKULTE_DUYURUCUSU WHERE t.Kimlik_numarasi=FAKULTE_DUYURUCUSU.Kimlik_numarasi UNION ALL
			SELECT 1 FROM inserted AS t, OGRENCI_ISLERI_DUYURUCUSU WHERE t.Kimlik_numarasi=OGRENCI_ISLERI_DUYURUCUSU.Kimlik_numarasi
		)
BEGIN
	ROLLBACK
	RAISERROR ('Böyle bir kimlik numarasýný sahip olan bir fakülte veya öðrenci iþleri personeli var...', 16, 1);
END

GO
CREATE TRIGGER DISJOINT_FAKULTE_DUYURUCUSU ON FAKULTE_DUYURUCUSU
AFTER INSERT
AS 
IF EXISTS
		(
			SELECT 1 FROM inserted AS t, BOLUM_DUYURUCUSU WHERE t.Kimlik_numarasi=BOLUM_DUYURUCUSU.Kimlik_numarasi UNION ALL
			SELECT 1 FROM inserted AS t, OGRENCI_ISLERI_DUYURUCUSU WHERE t.Kimlik_numarasi=OGRENCI_ISLERI_DUYURUCUSU.Kimlik_numarasi
		)
BEGIN
	ROLLBACK
	RAISERROR ('Böyle bir kimlik numarasýný sahip olan bir bölüm veya öðrenci iþleri personeli var...', 16, 1);
END

GO
CREATE TRIGGER DISJOINT_OGRENCI_ISLERI_DUYURUCUSU ON OGRENCI_ISLERI_DUYURUCUSU
AFTER INSERT
AS 
IF EXISTS
		(
			SELECT 1 FROM inserted AS t, BOLUM_DUYURUCUSU WHERE t.Kimlik_numarasi=BOLUM_DUYURUCUSU.Kimlik_numarasi UNION ALL
			SELECT 1 FROM inserted AS t, FAKULTE_DUYURUCUSU WHERE t.Kimlik_numarasi=FAKULTE_DUYURUCUSU.Kimlik_numarasi
		)
BEGIN
	ROLLBACK
	RAISERROR ('Böyle bir kimlik numarasýný sahip olan bir bölüm veya fakülte personeli var...', 16, 1);
END

GO
CREATE TRIGGER DUYURAN_KISI_YETKILI_MI ON DUYURU /* Duyuran kiþinin fakülte, bölüme veya öðrenci iþlerinde yer aldýðýný kontrol edilmeli */
AFTER INSERT
AS 
IF NOT EXISTS
		(
			SELECT 1 FROM inserted AS t, BOLUM_DUYURUCUSU WHERE t.Kimlik_numarasi=BOLUM_DUYURUCUSU.Kimlik_numarasi UNION ALL
			SELECT 1 FROM inserted AS t, FAKULTE_DUYURUCUSU WHERE t.Kimlik_numarasi=FAKULTE_DUYURUCUSU.Kimlik_numarasi UNION ALL
			SELECT 1 FROM inserted AS t, OGRENCI_ISLERI_DUYURUCUSU WHERE t.Kimlik_numarasi=OGRENCI_ISLERI_DUYURUCUSU.Kimlik_numarasi
		)
BEGIN
	ROLLBACK
	RAISERROR ('Duyurucunun alt sýnýfý belirlenmemiþtir, lütfen ilgili duyurucuyu bölüm, fakülte veya öðrenci iþleri personeline kayýtlandýrýnýz.', 16, 1);
END

GO
CREATE TRIGGER GONDERILEN_BOLUMLERE_UYGUNLUK_KONROLU ON YONELIK /* Duyuran kiþinin fakülte, bölüme veya öðrenci iþlerinde yer aldýðýný kontrol edilmeli */
AFTER INSERT
AS 
IF EXISTS
		(
			SELECT *
			FROM inserted as t
			INNER JOIN DUYURU ON t.Duyuru_id=DUYURU.Duyuru_id
			INNER JOIN DUYURUCU ON DUYURUCU.Kimlik_numarasi=DUYURU.Kimlik_numarasi
			INNER JOIN BOLUM_DUYURUCUSU ON BOLUM_DUYURUCUSU.Kimlik_numarasi=DUYURUCU.Kimlik_numarasi
			WHERE BOLUM_DUYURUCUSU.Bolum_ismi != t.Bolum_ismi OR t.Fakulte_ismi IS NOT NULL
		)
BEGIN
	ROLLBACK
	RAISERROR ('Ýlgili bölüm duyurucusu sadece kendi çalýþtýðý bölüme yönelik duyurular paylaþabilir!', 16, 1);
END

GO
CREATE TRIGGER GONDERILEN_FAKULTELERE_UYGUNLUK_KONROLU ON YONELIK /* Duyuran kiþinin fakülte, bölüme veya öðrenci iþlerinde yer aldýðýný kontrol edilmeli */
AFTER INSERT
AS 
IF EXISTS
		(
			SELECT *
			FROM inserted as t
			INNER JOIN DUYURU ON t.Duyuru_id=DUYURU.Duyuru_id
			INNER JOIN DUYURUCU ON DUYURUCU.Kimlik_numarasi=DUYURU.Kimlik_numarasi
			INNER JOIN FAKULTE_DUYURUCUSU ON FAKULTE_DUYURUCUSU.Kimlik_numarasi=DUYURUCU.Kimlik_numarasi
			WHERE FAKULTE_DUYURUCUSU.Fakulte_ismi != t.Fakulte_ismi OR t.Bolum_ismi IS NOT NULL
		)
BEGIN
	ROLLBACK
	RAISERROR ('Ýlgili fakülte duyurucusu sadece kendi çalýþtýðý fakülteye yönelik duyurular paylaþabilir!', 16, 1);
END

/*

Ýlerdeki triggeri ekleme kararý verilmemiþtir.

GO
CREATE TRIGGER OGRENCI_ISLERI_FAKULTELERE_YONELIK_DUYURU_PAYLASMADIGI_KONTROL_ET ON YONELIK 
AFTER INSERT
AS 
IF EXISTS
		(
			SELECT *
			FROM inserted as t
			INNER JOIN DUYURU ON t.Duyuru_id=DUYURU.Duyuru_id
			INNER JOIN DUYURUCU ON DUYURUCU.Kimlik_numarasi=DUYURU.Kimlik_numarasi
			INNER JOIN OGRENCI_ISLERI_DUYURUCUSU ON OGRENCI_ISLERI_DUYURUCUSU.Kimlik_numarasi=DUYURUCU.Kimlik_numarasi
			WHERE t.Fakulte_ismi IS NOT NULL
		)
BEGIN
	ROLLBACK
	RAISERROR ('Ýlgili öðrenci iþleri duyurucusu sadece kendi bölümlere yönelik duyurular paylaþabilir!', 16, 1);
END
*/