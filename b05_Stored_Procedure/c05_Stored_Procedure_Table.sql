USE ETRADE
CREATE TABLE #RAPOR
(
KULLANICIADI VARCHAR(100), ADSOYAD VARCHAR(100), TELNR1 VARCHAR(100), TELNR2 VARCHAR(100),
ULKE VARCHAR(100), SEHIR VARCHAR(100), ILCE VARCHAR(100),ACIKADRES VARCHAR(500),SIPARISID INT,
URUNKODU VARCHAR(500),URUNADI VARCHAR(500),MARKA VARCHAR(500),KATEGORI1 VARCHAR(500),
KATEGORI2 VARCHAR(500),KATEGORI3 VARCHAR(500),KATEGORI4 VARCHAR(500),MIKTAR FLOAT,
BIRIMFIYAT FLOAT, SATIRTOPLAMI FLOAT,SIPARISTARIHI DATE, SIPARISZAMANI TIME , YIL INT,
AY VARCHAR(50), HAFTANINGUNU VARCHAR(50)
)

INSERT INTO #RAPOR
EXEC SP_SATISLAR '20190101', '20190131', '%'

SELECT * FROM #RAPOR WHERE KATEGORI1 = 'GIDA'
SELECT KATEGORI1, SUM(SATIRTOPLAMI)  FROM RAPOR GROUP BY KATEGORI1
DROP TABLE #RAPOR

