-- 1. Directorio de clientes
SELECT 
    customer_id AS id_cliente,
    first_name AS nombre,
    last_name AS apellido,
    email AS correo_contacto
FROM customer;

-- 2. Países representados
SELECT DISTINCT country 
FROM customer;

-- 3. Criterio numérico
SELECT 
    name AS nombre_cancion, 
    milliseconds AS duracion_ms, 
    unit_price AS precio
FROM track
WHERE milliseconds >= 180000 
  AND milliseconds <= 240000;

-- 4. Alternativas controladas
SELECT first_name, last_name, country, support_rep_id
FROM customer
WHERE (country = 'USA' OR country = 'Canada') AND support_rep_id = 3;

-- 5. Pertenencia
SELECT first_name, last_name, country
FROM customer
WHERE country IN ('Brazil', 'Germany', 'France');

-- 6. Intervalo
SELECT name, milliseconds, composer
FROM track
WHERE milliseconds BETWEEN 240000 AND 300000;

-- 7. Patrones (Comparación LIKE vs ILIKE)
SELECT name AS cancion_con_like
FROM track
WHERE name LIKE '%love%';

-- Consulta 2 usando ILIKE
SELECT name AS cancion_con_ilike
FROM track
WHERE name ILIKE '%love%';

-- 8. Ausencias
-- Consulta 1: Clientes individuales (sin empresa registrada, company es NULL)
SELECT customer_id, first_name, last_name, company
FROM customer
WHERE company IS NULL;

-- Consulta 2: Clientes corporativos (con empresa registrada, company no es NULL)
SELECT customer_id, first_name, last_name, company
FROM customer
WHERE company IS NOT NULL;

-- 9. Ranking
SELECT track_id, name, milliseconds
FROM track
ORDER BY milliseconds DESC, track_id ASC
LIMIT 10;

-- 10. Paginación
-- Página 1: Obtiene los primeros 5 clientes
SELECT customer_id, first_name, last_name
FROM customer
ORDER BY last_name ASC, customer_id ASC
LIMIT 5 OFFSET 0;

-- Página 2: Obtiene los siguientes 5 clientes (salta los 5 de la primera página)
SELECT customer_id, first_name, last_name
FROM customer
ORDER BY last_name ASC, customer_id ASC
LIMIT 5 OFFSET 5;
