
-- REGRESION LINEAL
SELECT * FROM calcular_regresion_lineal(
    -- Ambos conjuntos deben tener la misma cantidad de elementos
    ARRAY[1, 2, 3, 4, 5],
    ARRAY[2, 4, 6, 8, 10]
);


-- CANTIDAD DE ELEMENTOS EN ARREGLO
SELECT obtener_cantidad_elementos(ARRAY[1, 2, 3, 4, 5]);
