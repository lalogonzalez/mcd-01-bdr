-- Insertar registros en la tabla equipos
INSERT INTO equipos (id, nombre, ciudad, conferencia, division) VALUES
  (1, 'New England Patriots', 'Foxborough', 'AFC', 'Este'),
  (2, 'Kansas City Chiefs', 'Kansas City', 'AFC', 'Oeste'),
  (3, 'Seattle Seahawks', 'Seattle', 'NFC', 'Oeste'),
  (4, 'Dallas Cowboys', 'Dallas', 'NFC', 'Este'),
  (5, 'Pittsburgh Steelers', 'Pittsburgh', 'AFC', 'Norte');

-- Insertar registros en la tabla jugadores
INSERT INTO jugadores (id, nombre, apellido, posicion, equipo) VALUES
  (1, 'Tom', 'Brady', 'Quarterback', 1),
  (2, 'Patrick', 'Mahomes', 'Quarterback', 2),
  (3, 'Russell', 'Wilson', 'Quarterback', 3),
  (4, 'Ezekiel', 'Elliott', 'Running Back', 4),
  (5, 'Ben', 'Roethlisberger', 'Quarterback', 5);

-- Insertar registros en la tabla estadios
INSERT INTO estadios (id, nombre, ciudad, capacidad) VALUES
  (1, 'Gillette Stadium', 'Foxborough', 65000),
  (2, 'Arrowhead Stadium', 'Kansas City', 76416),
  (3, 'CenturyLink Field', 'Seattle', 69000),
  (4, 'AT&T Stadium', 'Dallas', 80000),
  (5, 'Heinz Field', 'Pittsburgh', 68500);

-- Insertar registros en la tabla partidos
INSERT INTO partidos (id, fecha, equipo_local, equipo_visitante, estadio) VALUES
  (1, '2023-01-01', 1, 2, 1),
  (2, '2023-02-15', 3, 1, 2),
  (3, '2023-03-10', 2, 3, 3),
  (4, '2023-04-05', 4, 5, 4),
  (5, '2023-05-20', 5, 3, 1);

-- Insertar registros en la tabla resultados
INSERT INTO resultados (id, partido, puntos_local, puntos_visitante) VALUES
  (1, 1, 28, 24),
  (2, 2, 17, 14),
  (3, 3, 31, 27),
  (4, 4, 21, 28),
  (5, 5, 35, 28);
