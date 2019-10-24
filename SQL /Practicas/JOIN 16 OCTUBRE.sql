SELECT*
FROM flights FL
INNER JOIN airports RP ON RP.faa = FL.dest
LIMIT 20
--inner join dice vas a recuperar todos los vuelos que tengan su aeropuerto en la tabla airports y todos aquellos aeropuertos que tengan un vuelo en la tabla flights ¡habra de los dos tipos no hay nada nulo o vacio. Si no estuveria en la tabal de vuelos no apareceria nhinguna relacion

SELECT*
FROM flights FL
LEFT JOIN airports RP ON RP.faa = FL.dest-- left dice te voy a mostrar tdos lso vuelos y si tiene aeropuerto asociado tmbn el aeropuerto asociado. Da lo mismo que el inner
LIMIT 20

--el right recupera todos los aeropuertos y ademas todos los vuelos de esos aeropuertos si tienen vuelos
SELECT COUNT(*)
FROM airports RP
LEFT JOIN flights FL ON FL.dest = RP.faa  --el left cambia de uno a otro


SELECT COUNT(*)
FROM airports RP
INNER JOIN flights FL ON FL.dest = RP.faa -- comun a los dos

--TODOS AEROPUERTOS QUE NO TIENEN VUELOS:
SELECT* FROM airports WHERE faa NOT IN
(SELECT DISTINCT dest FROM flights)

--RECUPERAR NUM DE VUELOS A ORLANDO INCLUYENDO EL NUMERO DE ASIENTOS Y CUANTAS PERSONAS Q SON LA SUMA DE LOS SITIOS(SUM)

SELECT *
FROM flights FL
LEFT JOIN planes PL ON PL.tailnum = FL.tailnum
WHERE FL.dest IN (SELECT faa FROM airports WHERE name LIKE '%ORLANDO%')

SELECT *--SELECCIONAME EL MIN Y EL MAX DE PLAZA DE LOS VULEOS UNIDOS A LOS AVIONES EN LSOC UALES EL DESTINO DEL VUELO SEAN TODOS LOS AEROPUERTOS CUYO NOMBRE INCLUYA ORLANDO
FROM flights FL
LEFT JOIN planes PL ON PL.tailnum = FL.tailnum
WHERE FL.dest IN (SELECT faa FROM airports WHERE name LIKE '%ORLANDO%')
sum(FL seats) AS MAXICAPACITY

--RECUPERAR TODOS LOS VUELOS CON EL NOMBRE DE DESTINO DEL AEROPUERTO
SELECT
FL.*, RP.name

FROM flights FL
LEFT JOIN planes PL ON PL.tailnum = FL.tailnum
LEFT JOIN airports RP ON RP.faa = FL.dest

