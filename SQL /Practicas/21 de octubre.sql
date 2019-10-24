SELECT FL.*, RP.name
FROM flights FL
LEFT JOIN airlines RL ON RL.carrier = FL.carrier
LEFT JOIN airports RP ON RP.faa = FL.dest
WHERE RL.name LIKE "%DELTA%" AND RP.alt > 3000

SELECT*
FROM flights FL
WHERE carrier IN (SELECT carrier FROM airlines WHERE name LIKE "%DELTA%")
AND dest IN (SELECT faa FROM airports WHERE alt >3000

SELECT*
FROM flights FL
LEFT JOIN airlines RL ON RL.carrier = FL.carrier
LEFT JOIN airports RP ON RP.faa = FL.dest
WHERE RP.name LIKE '%ORLANDO%'

--
SELECT RP.name, ROUND(AVG(PL.seats),2) AS MEDIA
FROM flights FL
LEFT JOIN airlines RL ON RL.carrier = FL.carrier
LEFT JOIN planes PL ON PL.tailnum = FL.tailnum
LEFT JOIN airports RP ON RP.faa = FL.dest
WHERE RL.name LIKE '%ALASKA%'
GROUP BY RP.name
ORDER by AVG(PL.seats) DESC

--recover
SELECT RP.faa, RP.name, FL.day
from FLIGHTS FL
LEFT JOIN airlines RL


--determinar que aerolinea coger si nos vamos de vacaciones a orlando, que aerolinea elegir para tener el menor retraso posible

SELECT RL.name, COUNT(arr.delay) AS FLSHUMBER,
MIN(arr.delay) AS MINDELAY, AVG(arr_delay) AS AVGDELAY, MAX(arr_delay) AS MAXDELAY
FROM flights FL
LEFT JOIN airlines RL on ROL.carrier = FL.carrier
LEFT JOIN airports RP ON RP.faa = FL.dest
WHERE RP.name LIKE '%ORLANDO%' AND arr.delay != "NA" AND arr.delay > 0
GROUP BY RL.name ORDER BY AVG(arr_delay)


--calcular





