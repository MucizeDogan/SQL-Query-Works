-- Names ve Surnames tablolar�nda bulunan Name,Gender,Surname rastgele de�erler �ekip yeni bir tabloda birle�tiriyorum
--Yeni tablomuz olan Persons tablosuna ek olarak ki�iye rastgele bir do�um tarihi verip buradan ya��n� ve kendi belirledi�im ya� gruplar�n� ekliyorum.


--SELECT * FROM NAMES
--SELECT * FROM SURNAMES

--TRUNCATE TABLE PERSONS

DECLARE @I AS INT = 0
DECLARE @NAME AS VARCHAR(50)
DECLARE @SURNAME AS VARCHAR(50)
DECLARE @GENDER AS VARCHAR(1)
DECLARE @BIRTHDATE AS DATE
DECLARE @AGE AS INT
DECLARE @AGEGROUP AS VARCHAR(30)

WHILE @I<1000
BEGIN

SELECT @NAME=NAME,@GENDER=GENDER FROM NAMES WHERE ID = ROUND(RAND()*611,0)
SELECT @SURNAME=SURNAME FROM SURNAMES WHERE ID = ROUND(RAND()*1000,0)

	SET @BIRTHDATE=DATEADD(DAY,ROUND(RAND()*21900,0),'1950-01-01') -- 1950 ile 2010 y�llar� aras�nda rastgele do�um g�n� t�retme (21900=365*60)
	SET @AGE=DATEDIFF(YEAR,@BIRTHDATE,GETDATE())
	
	IF @AGE BETWEEN 13 AND 20
		SET @AGEGROUP='UNDER 20 AGE'
	IF @AGE BETWEEN 21 AND 30
		SET @AGEGROUP='BETWEEN 20 AND 30 AGE'
	IF @AGE BETWEEN 31 AND 40
		SET @AGEGROUP='BETWEEN 30 AND 40 AGE'
	IF @AGE BETWEEN 41 AND 50
		SET @AGEGROUP='BETWEEN 40 AND 50 AGE'
	IF @AGE BETWEEN 51 AND 60
		SET @AGEGROUP='BETWEEN 50 AND 60 AGE'
	IF @AGE BETWEEN 61 AND DATEDIFF(YEAR,@BIRTHDATE,GETDATE())
		SET @AGEGROUP='OVER 60 AGE'

--SELECT @NAME,@SURNAME,@GENDER,@BIRTHDATE,@AGE, @AGEGROUP

INSERT INTO PERSONS (NAME,SURNAME,GENDER,BIRTHDATE,AGE,[AGE GROUP])
VALUES (@NAME,@SURNAME,@GENDER,@BIRTHDATE,@AGE,@AGEGROUP)

	SET @I=@I+1
END

--SELECT * FROM PERSONS


