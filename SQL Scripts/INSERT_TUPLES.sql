USE OGRENCI_BILGI_SISTEMI_DUYURU_VERITABANI;

INSERT INTO DUYURUCU VALUES(12345678911, 'admin', 'Ahmet', 'Y�lmaz')
INSERT INTO DUYURUCU VALUES(44345678888, 'admin', 'Zeynep', '�al��kan')
INSERT INTO DUYURUCU VALUES(52445699999, 'admin', 'Mehmet', 'Acar')
INSERT INTO DUYURUCU VALUES(88885699888, 'admin', 'Recep', 'Y�lmaz')
INSERT INTO DUYURUCU VALUES(99945699999, 'admin', '4Admin', '7Admin') /* Alt s�n�f� belirlenmemi�tir */

INSERT INTO FAKULTE VALUES('M�hendislik Fak�ltesi')
INSERT INTO FAKULTE VALUES('T�p Fak�ltesi')

INSERT INTO BOLUM VALUES('Bilgisayar M�hendisli�i', 'M�hendislik Fak�ltesi')
INSERT INTO BOLUM VALUES('Makine M�hendisli�i', 'M�hendislik Fak�ltesi')
INSERT INTO BOLUM VALUES('T�p', 'T�p Fak�ltesi')

INSERT INTO OGRENCI_ISLERI_DUYURUCUSU VALUES(12345678911)
INSERT INTO BOLUM_DUYURUCUSU VALUES(12345678911, 'Bilgisayar M�hendisli�i') /* Trigger deneme */
INSERT INTO BOLUM_DUYURUCUSU VALUES(44345678888, 'Bilgisayar M�hendisli�i')
INSERT INTO BOLUM_DUYURUCUSU VALUES(88885699888, 'Makine M�hendisli�i')
INSERT INTO FAKULTE_DUYURUCUSU VALUES(52445699999, 'M�hendislik Fak�ltesi')

INSERT INTO DUYURU(Duyuru_basligi, Duyuru_icerigi, Duyuru_tarihi, Kimlik_numarasi) VALUES('PHP E�itimi Yak�nda!', 
'
	<h1> PHP E�itimleri yak�nda!</h1>

<div style="width:100%; word-wrap: break-word ">
    <p> 
        B�l�m�m�z yak�nda PHP e�itimleri d�zenleyecektir. L�tfen gelecek duyurular� takip ediniz.
    </p>
    
    <img src="https://cdn.otuzbeslik.com/img/mekan/location.12970.360068.jpg" style="width:70%; height: 350px; margin-left: auto; margin-right: auto; display: block; " />
</div>
', GETDATE() , 44345678888)

INSERT INTO DUYURU(Duyuru_basligi, Duyuru_icerigi, Duyuru_tarihi, Kimlik_numarasi)
	VALUES('X E�itimi Yak�nda!', 'Yak�nda ��retim g�revlilerimiz taraf�ndan e�itimler d�zenlenilecektir...', GETDATE() , 99945699999) /* Trigger deneme */
INSERT INTO YONELIK(Duyuru_id, Fakulte_ismi, Bolum_ismi) VALUES(IDENT_CURRENT('DUYURU'), NULL, 'Bilgisayar M�hendisli�i') 
INSERT INTO YONELIK(Duyuru_id, Fakulte_ismi, Bolum_ismi) VALUES(1, NULL, 'Makine M�hendisli�i') /* Trigger deneme */
INSERT INTO YONELIK(Duyuru_id, Fakulte_ismi, Bolum_ismi) VALUES(1, 'M�hendislik Fak�ltesi', NULL) /* Trigger deneme */

INSERT INTO DUYURU(Duyuru_basligi, Duyuru_icerigi, Duyuru_tarihi, Kimlik_numarasi) VALUES('2021-2022 Yaz Okulu Duyurusu', 'Yaz okulunda yer alacak dersleri �n�m�zdeki hafta duyurulacakt�r...', GETDATE() , 52445699999)
INSERT INTO YONELIK(Duyuru_id, Fakulte_ismi, Bolum_ismi) VALUES(IDENT_CURRENT('DUYURU'), 'M�hendislik Fak�ltesi', NULL) 
INSERT INTO YONELIK(Duyuru_id, Fakulte_ismi, Bolum_ismi) VALUES(IDENT_CURRENT('DUYURU'), 'T�p Fak�ltesi', NULL) /* Trigger deneme */
INSERT INTO YONELIK(Duyuru_id, Fakulte_ismi, Bolum_ismi) VALUES(IDENT_CURRENT('DUYURU'), NULL, 'Bilgisayar M�hendisli�i') /* Trigger deneme */

