
--TARIH TANIMLAMA
DECLARE @TARIH AS DATETIME
	SET @TARIH ='2023-01-01 16:33:29'
DECLARE @TARIH2 AS DATETIME

-- DATEADD -> GUN,AY,YIL,SAAT EKLEME 
	SET @TARIH2=DATEADD(YEAR,6,@TARIH)
DECLARE @TARIH3 AS INT

-- DATEDIFF -> ZAMAN FARKI BULMA
	SET @TARIH3 =DATEDIFF(MONTH,@TARIH,@TARIH2)
SELECT @TARIH AS ZAMAN1,@TARIH2 AS ZAMAN2, @TARIH3 AS FARKZAMAN 

-- DATEPART -> TARIH ICINDEN ISTENILEN ZAMAN DILIMINI ALMA
DECLARE @TARIH4 AS DATETIME
	SET @TARIH4='2023-06-25 12:25:36'
SELECT DATEPART(DAY,@TARIH4)

-- GETDATE -> ANLIK TARIHI GETIRIR
 SELECT GETDATE()

 DECLARE @BIRTHDATE AS DATETIME
	SET @BIRTHDATE='2000-06-12'
 DECLARE @AGE AS INT
	SET @AGE = DATEDIFF(YEAR,@BIRTHDATE,GETDATE())
 SELECT @BIRTHDATE AS BIRTHDATE,@AGE AS AGE 


