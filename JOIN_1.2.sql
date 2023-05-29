--SELECT * FROM VWORDERS
-- Aylara gore toplam satislari, toplam urun miktarini, toplam musteri sayisini getiren sorgu
-- Query that returns total sales, total product quantity, total number of customers by month

SELECT 
DATEPART(YEAR,O.DATE_) YIL, 
--DATEPART(MONTH,O.DATE_) AY,
--Eger ki aylar� 1-2-3 gibi gormek yerine adlariyla gorunmesi isteniyorsa ;
CASE
	WHEN DATEPART(MONTH,O.DATE_)=1 THEN 'OCAK'
	WHEN DATEPART(MONTH,O.DATE_)=2 THEN 'SUBAT'
	WHEN DATEPART(MONTH,O.DATE_)=3 THEN 'MART'
	WHEN DATEPART(MONTH,O.DATE_)=4 THEN 'NISAN'
	WHEN DATEPART(MONTH,O.DATE_)=5 THEN 'MAYIS'
	WHEN DATEPART(MONTH,O.DATE_)=6 THEN 'HAZIRAN'
	WHEN DATEPART(MONTH,O.DATE_)=7 THEN 'TEMMUZ'
	WHEN DATEPART(MONTH,O.DATE_)=8 THEN 'AGUSTOS'
	WHEN DATEPART(MONTH,O.DATE_)=9 THEN 'EYLUL'
	WHEN DATEPART(MONTH,O.DATE_)=10 THEN 'EK�M'
	WHEN DATEPART(MONTH,O.DATE_)=11 THEN 'KASIM'
	WHEN DATEPART(MONTH,O.DATE_)=12 THEN 'ARALIK'
END AY,
SUM(AMOUNT) TOPLAMMIKTAR,SUM(LINETOTAL) TOPLAMTUTAR, COUNT(OD.ID) URUNSAYISI,
COUNT(DISTINCT O.ID) AS MUSTERISAYISI
FROM 
ORDERDETAILS OD
INNER JOIN ORDERS O ON OD.ORDERID=O.ID
INNER JOIN ITEMS ITM ON ITM.ID=OD.ITEMID
INNER JOIN USERS U ON U.ID=O.USERID
INNER JOIN ADDRESS A ON A.ID=O.ADDRESSID
INNER JOIN COUNTRIES C ON C.ID=A.COUNTRYID
INNER JOIN CITIES CT ON CT.ID=A.CITYID
INNER JOIN TOWNS T ON T.ID=A.TOWNID
INNER JOIN PAYMENTS P ON P.ORDERID=O.ID

GROUP BY DATEPART(YEAR,O.DATE_) , DATEPART(MONTH,O.DATE_)
ORDER BY DATEPART(YEAR,O.DATE_) 