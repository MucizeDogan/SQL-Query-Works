--QUERY Afyonkarahisar - Esrefpasa mahallesine giden siparisler. (View kullanarak join tekrarindan kurtulduk.)

--SELECT * FROM VWORDERS
--WHERE CITY='AFYONKARAH�SAR' AND ADDRESSTEXT LIKE '%E�REFPA�A%'


--QUERY Sehirlere gore satis toplami getiren sorgu

--SELECT 
--CITY, SUM(LINETOTAL),COUNT(*)
--FROM VWORDERS

--GROUP BY CITY 