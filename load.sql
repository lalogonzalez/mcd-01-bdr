-- Insertar registros en la tabla equipos desde el archivo equipos.csv
LOAD DATA INFILE './csv/equipos.csv'
INTO TABLE equipos
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

-- Insertar registros en la tabla jugadores desde el archivo jugadores.csv
LOAD DATA INFILE './csv/jugadores.csv'
INTO TABLE jugadores
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

-- Insertar registros en la tabla estadios desde el archivo estadios.csv
LOAD DATA INFILE './csv/estadios.csv'
INTO TABLE estadios
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

-- Insertar registros en la tabla partidos desde el archivo partidos.csv
LOAD DATA INFILE './csv/partidos.csv'
INTO TABLE partidos
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

-- Insertar registros en la tabla resultados desde el archivo resultados.csv
LOAD DATA INFILE './csv/resultados.csv'
INTO TABLE resultados
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
