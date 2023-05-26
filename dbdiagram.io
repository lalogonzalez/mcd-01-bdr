// FCFM MCD
// Bases de Datos Relacionales
// Eduardo David Gonzalez Flores
// 1515489
// Esquema Tarea 1
// https://dbdiagram.io/d

Table equipos {
  id int [pk]
  nombre varchar
  ciudad varchar
  conferencia varchar
  division varchar
}

Table jugadores {
  id int [pk]
  nombre varchar
  apellido varchar
  posicion varchar
  equipo int [ref: > equipos.id]
}

Table partidos {
  id int [pk]
  fecha date
  equipo_local int [ref: > equipos.id]
  equipo_visitante int [ref: > equipos.id]
  estadio int [ref: > estadios.id]
}

Table estadios {
  id int [pk]
  nombre varchar
  ciudad varchar
  capacidad int
}

Table resultados {
  id int [pk]
  partido int [ref: > partidos.id]
  puntos_local int
  puntos_visitante int
}

