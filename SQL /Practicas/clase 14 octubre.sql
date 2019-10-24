--14 de octubre
SELECT COUNT (*) AS NUMREG FROM airports WHERE alt > 3000
SELECT faa FROM airports WHERE name like '%%CHICAGO%'
-- SI QUITO EL % NO ENCONTRARA NIGUNO PORQUE NINGUNO PONRA EXACTAMENTE CHICAGO
--CUIDADO CON LO DE ARRIBA PORQUE ESA BSUQUEDA LE CUESTA MUCHO A LA BASE DE DATOS
SELECT DISTINCT manufacturer
FROM planes ORDER BY manufacturer
-- en nomcbres exactos la busqueda es peligrosisima hay q proponer en vez de igual igual aribus es porcentaje comilla

SELECT * FROM planes WHERE manufacturer LIKE '%AIRBUS%'
SELECT* FROM planes WHERE seats BETWEEN 220 AND 250
SELECT * FROM planes WHERE manufacturer =='AIRBUS' AND seats<=150

SELECT * FROM flights WHERE dep_delay>200
SELECT faa FROM airports WHERE NAME LIKE '%CHICAGO%'
SELECT * 
FROM flights
 WHERE
 dest IN (SELECT faa FROM airports WHERE NAME LIKE '%CHICAGO%')

SELECT * 
FROM flights
 WHERE
arr_delay>= 120 AND arr_delay<> NA

--modelos unicos, esto no te permite saber cuantos aviones tengo de cada modelo
SELECT DISTINCT model
FROM planes
WHERE manufacturer LIKE '%AIRBUS%' AND seats < 150

--DISTINCT NO PERMITE INCORPORAR FUNCIONES DE AGREGADO PERO GROUP BY SI
SELECT model, COUNT(*)
FROM planes
WHERE manufacturer LIKE '%AIRBUS%' AND seats < 150
GROUP BY model
--sacar fabricantes y modelos de cada uno de los vuelos que van a chicago(primero todos los vuelos q vana  chicago, todos los vuelos de esos aviones q van a chicago...)
SELECT DISTINCT manufacturer, model FROM planes WHERE tailnum IN
(SELECT DISTINCT TAILNUM FROM flights
WHERE dest IN (SELECT faa FROM airports WHERE name LIKE '%CHICAGO%'))
ORDER BY manufacturer, model
--
SELECT * FROM flights
WHERE year==2017 AND month==12 AND day==23
LIMIT 10

SELECT 
carrier || '-'|| flight AS FLIGHT, dest AS DESTINATION, dep_time AS SCHEDULED,
CASE 
WHEN dep_delay <0 THEN 'IN ADVANCE'
WHEN dep_delay =0 THEN 'ON SCHEDULE'
WHEN dep_delay >0 THEN 'DELAYED'
END AS STATUS
FROM flights
WHERE year ==2017 AND month==12 AND day==23
--LIMIT 10-- poner tmbn despues de case when dep_delay='NA' THEN '--	NA--'

--quiero recuperar aviones y categorias q me diga si esta en menos de 50 categoria a, categoria b entre 51 y 150, mas de 151 categoria c
SELECT*,
CASE
WHEN seats <=50 THEN 'A'
WHEN seats BETWEEN 51 AND 150 THEN 'B'
ELSE 'C'
END AS CATEGORY
FROM planes






 