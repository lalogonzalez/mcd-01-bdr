-- Crear una tabla temporal para almacenar los registros duplicados
CREATE TEMPORARY TABLE duplicados_temp AS (
  SELECT nombre, ciudad, MIN(id) AS id
  FROM estadios
  GROUP BY nombre, ciudad
  HAVING COUNT(*) > 1
);

-- Eliminar registros duplicados de la tabla 'resultados'
DELETE FROM resultados
WHERE partido IN (
  SELECT p.id
  FROM partidos p
  JOIN duplicados_temp d ON p.estadio = d.id
);

-- Eliminar registros duplicados de la tabla 'partidos'
DELETE FROM partidos
WHERE estadio IN (
  SELECT id
  FROM duplicados_temp
);

-- Eliminar registros duplicados de la tabla 'estadios' conservando una ocurrencia
DELETE FROM estadios
WHERE (nombre, ciudad) IN (
  SELECT nombre, ciudad
  FROM duplicados_temp
)
AND id NOT IN (
  SELECT id
  FROM (
    SELECT MIN(id) AS id
    FROM duplicados_temp
    GROUP BY nombre, ciudad
  ) AS t
);

-- Eliminar la tabla temporal
DROP TABLE duplicados_temp;
