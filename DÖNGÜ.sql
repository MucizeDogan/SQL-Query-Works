--DÖNGÜ

DECLARE @I AS INT = 0 -- i deðiþkeni tanýmladým ve baþlangýç deðerini 0 olarak atadým  
WHILE @I<10 -- i 10 dan küçük olana kadar aþaðýdali iþlemi gerçekleþtirmesini istiyorum.  
BEGIN
	INSERT INTO TARIHLER (TARIH) VALUES (GETDATE())
	WAITFOR DELAY '00:00:01' --1 SANÝYE BEKLEYEREK VERÝ EKLE
	SET @I = @I+1 -- her seferinde i yi 1 arttýr.
END

SELECT * FROM TARIHLER


TRUNCATE TABLE TARIHLER
