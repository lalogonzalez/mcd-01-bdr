CREATE OR REPLACE FUNCTION obtener_cantidad_elementos(arreglo anyarray)
  RETURNS integer AS
$$
DECLARE
  cantidad_elementos integer;
BEGIN
  -- Utiliza la función array_length para obtener la cantidad de elementos del arreglo
  cantidad_elementos := array_length(arreglo, 1);
  
  -- Devuelve la cantidad de elementos calculada
  RETURN cantidad_elementos;
END;
$$
LANGUAGE plpgsql;
