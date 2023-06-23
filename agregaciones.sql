-- Conteo de frecuencias de posiciones de jugadores en un equipo específico (por ejemplo, el equipo con ID 1)
SELECT posicion, COUNT(*) AS frecuencia
FROM jugadores
--WHERE equipo = 1
GROUP BY posicion;

-- Cálculo de la media de la capacidad de los estadios
SELECT AVG(capacidad) AS media_capacidad
FROM estadios;

-- Valor mínimo y máximo de puntos anotados en un partido
SELECT MIN(puntos_local) AS min_puntos, MAX(puntos_local) AS max_puntos
FROM resultados;

-- Capacidad mínima y máxima de estadios
SELECT MIN(capacidad) AS min_capacidad, MAX(capacidad) AS max_capacidad
FROM estadios;

--Estadio con la capacidad mínima
SELECT estadios.nombre
FROM estadios
WHERE capacidad = (SELECT MIN(capacidad) FROM estadios);

-- Cálculo del primer cuartil (25%) de la capacidad de los estadios
SELECT PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY capacidad) AS primer_cuartil
FROM estadios
WHERE capacidad IS NOT NULL;

-- Cálculo de la moda de las posiciones de los jugadores en un equipo específico (por ejemplo, el equipo con ID 1)
SELECT MODE() WITHIN GROUP (ORDER BY posicion) AS moda, COUNT(*)
FROM jugadores
WHERE equipo = 1;

-- Cálculo de la moda de las posiciones de los jugadores en un equipo específico (por ejemplo, el equipo con ID 1)
SELECT posicion, COUNT(*) AS frecuencia
FROM jugadores
WHERE equipo = 1
GROUP BY posicion
HAVING COUNT(*) = (
    SELECT MAX(frecuencia)
    FROM (
        SELECT posicion, COUNT(*) AS frecuencia
        FROM jugadores
        WHERE equipo = 1
        GROUP BY posicion
    ) AS subquery
);
