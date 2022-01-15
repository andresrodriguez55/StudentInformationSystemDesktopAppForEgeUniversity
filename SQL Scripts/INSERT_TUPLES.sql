USE OGRENCI_BILGI_SISTEMI_DUYURU_VERITABANI;

INSERT INTO DUYURUCU VALUES(12345678911, 'admin', 'Ahmet', 'Yýlmaz')
INSERT INTO DUYURUCU VALUES(44345678888, 'admin', 'Zeynep', 'Çalýþkan')
INSERT INTO DUYURUCU VALUES(52445699999, 'admin', 'Mehmet', 'Acar')
INSERT INTO DUYURUCU VALUES(88885699888, 'admin', 'Recep', 'Yýlmaz')
INSERT INTO DUYURUCU VALUES(99945699999, 'admin', '4Admin', '7Admin') /* Alt sýnýfý belirlenmemiþtir */

INSERT INTO FAKULTE VALUES('Mühendislik Fakültesi')
INSERT INTO FAKULTE VALUES('Týp Fakültesi')

INSERT INTO BOLUM VALUES('Bilgisayar Mühendisliði', 'Mühendislik Fakültesi')
INSERT INTO BOLUM VALUES('Makine Mühendisliði', 'Mühendislik Fakültesi')
INSERT INTO BOLUM VALUES('Týp', 'Týp Fakültesi')

INSERT INTO OGRENCI_ISLERI_DUYURUCUSU VALUES(12345678911)
INSERT INTO BOLUM_DUYURUCUSU VALUES(12345678911, 'Bilgisayar Mühendisliði') /* Trigger deneme */
INSERT INTO BOLUM_DUYURUCUSU VALUES(44345678888, 'Bilgisayar Mühendisliði')
INSERT INTO BOLUM_DUYURUCUSU VALUES(88885699888, 'Makine Mühendisliði')
INSERT INTO FAKULTE_DUYURUCUSU VALUES(52445699999, 'Mühendislik Fakültesi')

INSERT INTO DUYURU(Duyuru_basligi, Duyuru_icerigi, Duyuru_tarihi, Kimlik_numarasi) VALUES('PHP Eðitimi Yakýnda!', 
'
	<h1> PHP Eðitimleri yakýnda!</h1>

<div style="width:100%; word-wrap: break-word ">
    <p> 
        Bölümümüz yakýnda PHP eðitimleri düzenleyecektir. Lütfen gelecek duyurularý takip ediniz.
    </p>
    
    <img src="https://cdn.otuzbeslik.com/img/mekan/location.12970.360068.jpg" style="width:70%; height: 350px; margin-left: auto; margin-right: auto; display: block; " />
</div>
', GETDATE() , 44345678888)

INSERT INTO DUYURU(Duyuru_basligi, Duyuru_icerigi, Duyuru_tarihi, Kimlik_numarasi)
	VALUES('X Eðitimi Yakýnda!', 'Yakýnda öðretim görevlilerimiz tarafýndan eðitimler düzenlenilecektir...', GETDATE() , 99945699999) /* Trigger deneme */
INSERT INTO YONELIK(Duyuru_id, Fakulte_ismi, Bolum_ismi) VALUES(IDENT_CURRENT('DUYURU'), NULL, 'Bilgisayar Mühendisliði') 
INSERT INTO YONELIK(Duyuru_id, Fakulte_ismi, Bolum_ismi) VALUES(1, NULL, 'Makine Mühendisliði') /* Trigger deneme */
INSERT INTO YONELIK(Duyuru_id, Fakulte_ismi, Bolum_ismi) VALUES(1, 'Mühendislik Fakültesi', NULL) /* Trigger deneme */

INSERT INTO DUYURU(Duyuru_basligi, Duyuru_icerigi, Duyuru_tarihi, Kimlik_numarasi) VALUES('2021-2022 Yaz Okulu Duyurusu', 'Yaz okulunda yer alacak dersleri önümüzdeki hafta duyurulacaktýr...', GETDATE() , 52445699999)
INSERT INTO YONELIK(Duyuru_id, Fakulte_ismi, Bolum_ismi) VALUES(IDENT_CURRENT('DUYURU'), 'Mühendislik Fakültesi', NULL) 
INSERT INTO YONELIK(Duyuru_id, Fakulte_ismi, Bolum_ismi) VALUES(IDENT_CURRENT('DUYURU'), 'Týp Fakültesi', NULL) /* Trigger deneme */
INSERT INTO YONELIK(Duyuru_id, Fakulte_ismi, Bolum_ismi) VALUES(IDENT_CURRENT('DUYURU'), NULL, 'Bilgisayar Mühendisliði') /* Trigger deneme */

