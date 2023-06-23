-- Vista con inner join: Muestra el nombre del equipo y el nombre de los jugadores asociados
-- Beneficio: Proporciona una vista consolidada de los equipos y sus jugadores, facilitando consultas que requieran información conjunta de ambas tablas.

CREATE OR REPLACE VIEW vista_inner_join AS
SELECT e.nombre AS nombre_equipo, j.nombre AS nombre_jugador
FROM equipos e
INNER JOIN jugadores j ON e.id = j.equipo;

-- Vista con left join: Muestra el nombre del equipo y la cantidad total de jugadores asociados
-- Beneficio: Permite obtener una visión general de los equipos y el número de jugadores que tienen asociados, incluso aquellos equipos que no tienen jugadores.

CREATE OR REPLACE VIEW vista_left_join AS
SELECT e.nombre AS nombre_equipo, COUNT(j.id) AS total_jugadores
FROM equipos e
LEFT JOIN jugadores j ON e.id = j.equipo
GROUP BY e.nombre;

-- Vista con right join: Muestra el nombre de los jugadores y el nombre de los equipos asociados
-- Beneficio: Proporciona una vista que muestra todos los jugadores y el equipo al que están asociados, incluso aquellos jugadores que no tienen un equipo asignado.

CREATE OR REPLACE VIEW vista_right_join AS
SELECT j.nombre AS nombre_jugador, e.nombre AS nombre_equipo
FROM jugadores j
RIGHT JOIN equipos e ON e.id = j.equipo;

-- Vista con subconsulta: Muestra el nombre del equipo, la ciudad y el nombre de los jugadores asociados a los equipos que hayan tenido partidos a partir del 1 de enero de 2023
-- Beneficio: Permite obtener una lista de equipos con sus respectivas ciudades y los jugadores asociados, limitados a aquellos equipos que hayan tenido partidos a partir de una fecha específica.

CREATE OR REPLACE VIEW vista_subconsulta AS
SELECT e.nombre AS nombre_equipo, e.ciudad, j.nombre AS nombre_jugador
FROM equipos e
INNER JOIN jugadores j ON e.id = j.equipo
WHERE e.id IN (
  SELECT p.equipo_local
  FROM partidos p
  WHERE p.fecha >= '2023-01-01'::date
);
