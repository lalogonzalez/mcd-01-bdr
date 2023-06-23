-- TRIGGER DE INSERCIÓN
-- Descripción: Este trigger se activa después de insertar un nuevo registro en la tabla "jugadores".
-- Beneficios: Permite realizar acciones adicionales automáticamente después de insertar un jugador, como la actualización de campos relacionados o la generación de registros adicionales en otras tablas.

CREATE OR REPLACE FUNCTION trigger_insert_jugador()
RETURNS TRIGGER AS
$$
BEGIN
  -- Acciones adicionales a realizar después de la inserción del jugador
  -- Ejemplo: Actualizar el número total de jugadores en la tabla "equipos"
  UPDATE equipos
  SET total_jugadores = total_jugadores + 1
  WHERE id = NEW.equipo;

  RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER insercion_jugador
AFTER INSERT ON jugadores
FOR EACH ROW
EXECUTE FUNCTION trigger_insert_jugador();


-- TRIGGER DE ACTUALIZACIÓN
-- Descripción: Este trigger se activa después de actualizar un registro en la tabla "equipos".
-- Beneficios: Permite realizar acciones adicionales automáticamente después de actualizar un equipo, como la verificación de restricciones o la actualización de datos relacionados en otras tablas.

CREATE OR REPLACE FUNCTION trigger_actualizacion_equipo()
RETURNS TRIGGER AS
$$
BEGIN
  -- Acciones adicionales a realizar después de la actualización del equipo
  -- Ejemplo: Verificar si el equipo ha cambiado de conferencia y actualizar la tabla "partidos" en consecuencia
  IF OLD.conferencia <> NEW.conferencia THEN
    UPDATE partidos
    SET conferencia_local = NEW.conferencia
    WHERE equipo_local = NEW.id;
  END IF;

  RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER actualizacion_equipo
AFTER UPDATE ON equipos
FOR EACH ROW
EXECUTE FUNCTION trigger_actualizacion_equipo();


-- TRIGGER DE ELIMINACIÓN
-- Descripción: Este trigger se activa antes de eliminar un registro en la tabla "equipos".
-- Beneficios: Permite realizar acciones adicionales antes de eliminar un equipo, como la eliminación de registros relacionados o la verificación de restricciones.

CREATE OR REPLACE FUNCTION trigger_eliminacion_equipo()
RETURNS TRIGGER AS
$$
BEGIN
  -- Acciones adicionales a realizar antes de la eliminación del equipo
  -- Ejemplo: Eliminar los jugadores asociados al equipo que se está eliminando
  DELETE FROM jugadores
  WHERE equipo = OLD.id;

  RETURN OLD;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER eliminacion_equipo
BEFORE DELETE ON equipos
FOR EACH ROW
EXECUTE FUNCTION trigger_eliminacion_equipo();
