CREATE OR REPLACE FUNCTION calcular_regresion_lineal(
    x numeric[],
    y numeric[]
)
RETURNS TABLE (intercept numeric, slope numeric) AS
$$
DECLARE
    n integer;
    sumX numeric;
    sumY numeric;
    sumXY numeric;
    sumX2 numeric;
    meanX numeric;
    meanY numeric;
BEGIN
    -- Obtener el número de elementos en los conjuntos de datos
    n := array_length(x, 1);

    -- Calcular las sumas de los elementos de cada conjunto
    SELECT sum(d) INTO sumX FROM unnest(x) AS d;
    SELECT sum(d) INTO sumY FROM unnest(y) AS d;

    -- Calcular la suma del producto de los elementos de los conjuntos
    SELECT sum(x[i] * y[i]) INTO sumXY FROM generate_subscripts(x, 1) i;

    -- Calcular la suma de los cuadrados de los elementos de x
    SELECT sum(d * d) INTO sumX2 FROM unnest(x) AS d;

    -- Calcular las medias de los conjuntos de datos
    meanX := sumX / n;
    meanY := sumY / n;

    -- Calcular los coeficientes de la regresión lineal (intercept y slope)
    intercept := (sumY * sumX2 - sumX * sumXY) / (n * sumX2 - sumX * sumX);
    slope := (n * sumXY - sumX * sumY) / (n * sumX2 - sumX * sumX);

    -- Devolver el intercepto y la pendiente de la regresión lineal
    RETURN QUERY SELECT intercept, slope;
END;
$$
LANGUAGE plpgsql;
