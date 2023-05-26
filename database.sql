-- Crear la tabla equipos
CREATE TABLE equipos (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  ciudad VARCHAR(100) NOT NULL,
  conferencia VARCHAR(10) NOT NULL,
  division VARCHAR(10) NOT NULL
);

-- Crear la tabla jugadores
CREATE TABLE jugadores (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido VARCHAR(100) NOT NULL,
  posicion VARCHAR(50) NOT NULL,
  equipo INT NOT NULL
);

-- Crear la tabla partidos
CREATE TABLE partidos (
  id SERIAL PRIMARY KEY,
  fecha DATE NOT NULL,
  equipo_local INT NOT NULL,
  equipo_visitante INT NOT NULL,
  estadio INT NOT NULL
);

-- Crear la tabla estadios
CREATE TABLE estadios (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  ciudad VARCHAR(100) NOT NULL,
  capacidad INT NOT NULL
);

-- Crear la tabla resultados
CREATE TABLE resultados (
  id SERIAL PRIMARY KEY,
  partido INT NOT NULL,
  puntos_local INT NOT NULL,
  puntos_visitante INT NOT NULL
);

-- Crear las relaciones
ALTER TABLE jugadores ADD FOREIGN KEY (equipo) REFERENCES equipos (id);
ALTER TABLE partidos ADD FOREIGN KEY (equipo_local) REFERENCES equipos (id);
ALTER TABLE partidos ADD FOREIGN KEY (equipo_visitante) REFERENCES equipos (id);
ALTER TABLE partidos ADD FOREIGN KEY (estadio) REFERENCES estadios (id);
ALTER TABLE resultados ADD FOREIGN KEY (partido) REFERENCES partidos (id);
