SELECT lpad('sql', 15, '*');

SELECT rpad('sql', 15, '*');

SELECT lpad ('sql', id, '*')
FROM platzi.alumnos
WHERE id < 10;

SELECT rpad ('sql', id, '*')
FROM platzi.alumnos
WHERE id < 10;

SELECT lpad ('*', id, '*')
FROM platzi.alumnos
WHERE id < 10;

SELECT rpad ('*', id, '*')
FROM platzi.alumnos
WHERE id < 10;

SELECT lpad ('*', id, '*'), carrera_id
FROM platzi.alumnos
WHERE id < 10
ORDER BY carrera_id;

SELECT rpad ('*', id, '*'), carrera_id
FROM platzi.alumnos
WHERE id < 10
ORDER BY carrera_id;

SELECT *
FROM (
	SELECT ROW_NUMBER() OVER() AS row_id, *
	FROM platzi.alumnos
) AS alumnos_with_row_id
WHERE row_id <= 5;

SELECT lpad('*', CAST(row_id AS int), '*')
FROM (
	SELECT ROW_NUMBER() OVER() AS row_id, *
	FROM platzi.alumnos
) AS alumnos_with_row_id
WHERE row_id <= 5;

SELECT rpad('*', CAST(row_id AS int), '*')
FROM (
	SELECT ROW_NUMBER() OVER() AS row_id, *
	FROM platzi.alumnos
) AS alumnos_with_row_id
WHERE row_id <= 5;

SELECT lpad('*', CAST(row_id AS int), '*')
FROM (
	SELECT ROW_NUMBER() OVER(ORDER BY carrera_id) AS row_id, *
	FROM platzi.alumnos
) AS alumnos_with_row_id
WHERE row_id <= 5
ORDER BY carrera_id;

SELECT rpad('*', CAST(row_id AS int), '*')
FROM (
	SELECT ROW_NUMBER() OVER(ORDER BY carrera_id) AS row_id, *
	FROM platzi.alumnos
) AS alumnos_with_row_id
WHERE row_id <= 5
ORDER BY carrera_id;

--un árbol--
SELECT lpad('\', s.a, rpad(lpad('/', d.e, ' '), s.a, '*'))
FROM generate_series(18, 26) AS s(a),
	 generate_series(17,0,-2) AS d(e)
LIMIT 10;