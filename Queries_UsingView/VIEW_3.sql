--VIEW OLUSTURMA
CREATE VIEW VW_SIPARIS_DETAYLAR 
AS

SELECT 
U.USERNAME_ KULLANICIADI,U.NAMESURNAME ADSOYAD, U.TELNR1 TELNO1, U.TELNR2 TELNO2,

C.COUNTRY ULKE,CT.CITY SEHIR,T.TOWN ILCE,
A.ADDRESSTEXT ACIKADRES,
O.ID SIPARISID, ITM.ITEMCODE URUNKODU, ITM.ITEMNAME URUNADI,ITM.BRAND MARKA,ITM.CATEGORY1,ITM.CATEGORY2,ITM.CATEGORY3,ITM.CATEGORY4,
OD.AMOUNT MIKTAR, OD.UNITPRICE BIRIMFIYAT, OD.LINETOTAL SATIRTOPLAMI,
CONVERT(DATE,O.DATE_) AS SIPARISTARIHI, CONVERT(TIME,O.DATE_) AS SIPARISZAMANI,
DATEPART(YEAR,O.DATE_) AS YIL,
--AYLARA GORE PARCALAMA VE ADLANDIRMA
CASE
WHEN DATEPART(MONTH,O.DATE_) = 1 THEN '01.OCK'
WHEN DATEPART(MONTH,O.DATE_) = 2 THEN '02.�UB'
WHEN DATEPART(MONTH,O.DATE_) = 3 THEN '03.MAR'
WHEN DATEPART(MONTH,O.DATE_) = 4 THEN '04.N�S'
WHEN DATEPART(MONTH,O.DATE_) = 5 THEN '05.MAY'
WHEN DATEPART(MONTH,O.DATE_) = 6 THEN '06.HAZ'
WHEN DATEPART(MONTH,O.DATE_) = 7 THEN '07.TEM'
WHEN DATEPART(MONTH,O.DATE_) = 8 THEN '08.A�U'
WHEN DATEPART(MONTH,O.DATE_) = 9 THEN '09.EYL'
WHEN DATEPART(MONTH,O.DATE_) = 10 THEN '10.EK�'
WHEN DATEPART(MONTH,O.DATE_) = 11 THEN '11.KAS'
WHEN DATEPART(MONTH,O.DATE_) = 12 THEN '12.ARA'
END AY,
CASE
	WHEN DATEPART(DW,O.DATE_)=2 THEN '1.PZT'
	WHEN DATEPART(DW,O.DATE_)=3 THEN '2.SAL'
	WHEN DATEPART(DW,O.DATE_)=4 THEN '3.�AR'
	WHEN DATEPART(DW,O.DATE_)=5 THEN '4.PER'
	WHEN DATEPART(DW,O.DATE_)=6 THEN '5.CUM'
	WHEN DATEPART(DW,O.DATE_)=7 THEN '6.CUMT'
	WHEN DATEPART(DW,O.DATE_)=1 THEN '7.PAZ'
END HAFTANINGUNU
FROM 
ORDERDETAILS OD
INNER JOIN ORDERS O ON OD.ORDERID=O.ID
INNER JOIN ITEMS ITM ON ITM.ID=OD.ITEMID
INNER JOIN USERS U ON U.ID=O.USERID
INNER JOIN ADDRESS A ON A.ID= O.ADDRESSID
INNER JOIN COUNTRIES C ON C.ID=A.COUNTRYID
INNER JOIN CITIES CT ON CT.ID=A.CITYID
INNER JOIN TOWNS T ON T.ID=A.TOWNID
INNER JOIN PAYMENTS P ON P.ORDERID=O.ID