--D�NG�

DECLARE @I AS INT = 0 -- i de�i�keni tan�mlad�m ve ba�lang�� de�erini 0 olarak atad�m  
WHILE @I<10 -- i 10 dan k���k olana kadar a�a��dali i�lemi ger�ekle�tirmesini istiyorum.  
BEGIN
	INSERT INTO TARIHLER (TARIH) VALUES (GETDATE())
	WAITFOR DELAY '00:00:01' --1 SAN�YE BEKLEYEREK VER� EKLE
	SET @I = @I+1 -- her seferinde i yi 1 artt�r.
END

SELECT * FROM TARIHLER


TRUNCATE TABLE TARIHLER
