# Resumen de Consultas SQL - Base de Datos Chinook

Este documento detalla los 10 apartados obligatorios solicitados para la exploración de la base de datos Chinook, incluyendo los criterios aplicados y el comportamiento de los resultados obtenidos.

## Tabla Resumen de Apartados

| No. | Apartado | Objetivo / Pregunta | Resultado y Comportamiento |
|---|---|---|---|
| 1 | Directorio de clientes | Seleccionar identificador, nombre, apellido y correo usando alias descriptivos. | Devuelve la lista de clientes con los encabezados de columna traducidos y personalizados (ej. `id_cliente`, `correo_contacto`). |
| 2 | Países representados | Obtener países distintos usando `DISTINCT` y explicar las filas. | Devuelve 24 filas. Cada fila representa un país único sin repeticiones donde reside al menos un cliente. |
| 3 | Criterio numérico | Filtrar pistas con al menos dos comparaciones numéricas. | Devuelve pistas musicales que duran exactamente entre 3 y 4 minutos (>= 180000 ms y <= 240000 ms). |
| 4 | Alternativas controladas | Combinar `AND` y `OR` con paréntesis para filtrar clientes. | Devuelve únicamente a los clientes de USA o Canadá que son atendidos exclusivamente por el representante de soporte 3. |
| 5 | Pertenencia | Buscar clientes de tres países específicos utilizando `IN`. | Devuelve una lista de clientes filtrada estrictamente a aquellos que residen en Brasil, Alemania o Francia. |
| 6 | Intervalo | Filtrar duración de pistas usando `BETWEEN`. | Devuelve canciones que duran entre 4 y 5 minutos. Demuestra que el límite es inclusivo (incluye los extremos exactos). |
| 7 | Patrones | Comparar búsquedas de texto con `LIKE` e `ILIKE` usando el comodín `%`. | La consulta con `LIKE` trae pocos resultados (solo minúsculas), mientras que `ILIKE` trae muchos más al ignorar mayúsculas/minúsculas. |
| 8 | Ausencias | Consultas con `IS NULL` e `IS NOT NULL` en el campo `company`. | La primera consulta muestra clientes individuales (sin empresa) y la segunda muestra clientes corporativos. |
| 9 | Ranking | Obtener las 10 pistas más largas usando `ORDER BY` con desempate. | Devuelve el Top 10 de pistas con mayor duración, usando el `track_id` ascendente para garantizar que el orden sea estable en cada ejecución. |
| 10 | Paginación | Simular dos páginas consecutivas de 5 clientes con `LIMIT` y `OFFSET`. | Devuelve la página 1 (primeros 5 clientes) y página 2 (siguientes 5). El ordenamiento por `customer_id` asegura que no se repitan registros. |

---

## Detalle de Código y Ejecución

### 1. Directorio de clientes
```sql
SELECT 
    customer_id AS id_cliente,
    first_name AS nombre,
    last_name AS apellido,
    email AS correo_contacto
FROM customer;

SELECT DISTINCT country 
FROM customer;

SELECT 
    name AS nombre_cancion, 
    milliseconds AS duracion_ms, 
    unit_price AS precio
FROM track
WHERE milliseconds >= 180000 
  AND milliseconds <= 240000;

SELECT first_name, last_name, country, support_rep_id
FROM customer
WHERE (country = 'USA' OR country = 'Canada') AND support_rep_id = 3;

SELECT first_name, last_name, country
FROM customer
WHERE country IN ('Brazil', 'Germany', 'France');

SELECT name, milliseconds, composer
FROM track
WHERE milliseconds BETWEEN 240000 AND 300000;

-- Consulta 1: Sensible a mayúsculas
SELECT name AS cancion_con_like
FROM track
WHERE name LIKE '%love%';

-- Consulta 2: Insensible a mayúsculas
SELECT name AS cancion_con_ilike
FROM track
WHERE name ILIKE '%love%';

-- Consulta 1: Clientes sin empresa
SELECT customer_id, first_name, last_name, company
FROM customer
WHERE company IS NULL;

-- Consulta 2: Clientes con empresa
SELECT customer_id, first_name, last_name, company
FROM customer
WHERE company IS NOT NULL;

SELECT track_id, name, milliseconds
FROM track
ORDER BY milliseconds DESC, track_id ASC
LIMIT 10;

-- Página 1: Obtiene los primeros 5 clientes
SELECT customer_id, first_name, last_name
FROM customer
ORDER BY last_name ASC, customer_id ASC
LIMIT 5 OFFSET 0;

-- Página 2: Salta los 5 de la primera página
SELECT customer_id, first_name, last_name
FROM customer
ORDER BY last_name ASC, customer_id ASC
LIMIT 5 OFFSET 5;