-- VIEW OLUSTURMA
--VIEW bizi ard arda joýn kullanýmýnda kurtarýyor. aþaðýdaki yapýyý oluþturduðumuzda baþka bir sorguda tekrardan joýnlere gerek kalmadan 
-- adýný verdiðimiz view ý çaðýrarak ulaþabiliyoruz...
-- Bir sql sorgusunu bir tablo gibi kullanbiliyoruz.
CREATE VIEW VWORDERS
AS

-- JOIN kullanarak sipariþ detaylarý kullanýcý detaylarý, adres detaylarý vs çeken sorgu..
SELECT 
--DISTINCT
U.USERNAME_,U.NAMESURNAME,C.COUNTRY,CT.CITY,T.TOWN,A.ADDRESSTEXT,O.ID,O.DATE_,ITM.ITEMCODE,ITM.ITEMNAME,ITM.BRAND
, OD.AMOUNT, OD.UNITPRICE,OD.LINETOTAL
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
