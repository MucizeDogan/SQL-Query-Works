--SELECT * FROM CUSTOMERS

-- CRM2 database inde bulunan customers tablosunda customer bilgileri bulunmakta. Burada dogum tarihi girilen bir fonksiyon yazilsin ve dogum tarihi girilen kisinin yasini versin
--There is customer information in the customers table in the CRM2 database. Here, write a function with the date of birth and give the age of the person whose date of birth is entered.

CREATE FUNCTION DBO.CALCULATE_AGE(@BIRTHDATE AS DATE)
RETURNS INT

BEGIN
	DECLARE @AGE AS INT
	SET @AGE=DATEDIFF(YEAR,@BIRTHDATE,GETDATE())
	RETURN @AGE
END

SELECT DBO.CALCULATE_AGE('2000-12-06')


--olusturdugumuz fonksiyonu bir tabloda kullanma
-- fonkiyonumuz tabloda satýr satýr calisacak

SELECT TOP 50000 *,
DBO.CALCULATE_AGE(BIRTHDATE) AS AGE --> bu birthdate tabloda olan birthdate sutununun 
from CUSTOMERS

