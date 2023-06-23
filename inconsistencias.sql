-- Buscar elementos vacíos en la tabla equipos
SELECT *
FROM equipos
WHERE nombre IS NULL OR nombre = '' OR ciudad IS NULL OR ciudad = '' OR conferencia IS NULL OR conferencia = '' OR division IS NULL OR division = '';


-- Buscar elementos vacíos en la tabla estadios
SELECT *
FROM estadios
WHERE nombre IS NULL OR nombre = '' OR ciudad IS NULL OR ciudad = '' OR capacidad IS NULL;


-- Buscar elementos vacíos en la tabla jugadores
SELECT *
FROM jugadores
WHERE nombre IS NULL OR nombre = '' OR apellido IS NULL OR apellido = '' OR posicion IS NULL OR posicion = '' OR equipo IS NULL;



-- Buscar duplicados en la tabla equipos basado en el nombre y ciudad
SELECT nombre, ciudad, COUNT(*)
FROM equipos
GROUP BY nombre, ciudad
HAVING COUNT(*) > 1;



-- Buscar duplicados en la tabla jugadores basado en el nombre y apellido
SELECT nombre, apellido, COUNT(*)
FROM jugadores
GROUP BY nombre, apellido
HAVING COUNT(*) > 1;

-- Eliminar registros duplicados de la tabla jugadores
DELETE FROM jugadores
WHERE (nombre, apellido) IN (
  SELECT nombre, apellido
  FROM jugadores
  GROUP BY nombre, apellido
  HAVING COUNT(*) > 1
);



-- Buscar duplicados en la tabla estadios basado en el nombre y ciudad
SELECT nombre, ciudad, COUNT(*)
FROM estadios
GROUP BY nombre, ciudad
HAVING COUNT(*) > 1;