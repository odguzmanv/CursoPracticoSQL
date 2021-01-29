--Promedio sobre cada carrera--
SELECT *,
		AVG(colegiatura) OVER (PARTITION BY carrera_id)
FROM platzi.alumnos;

--Promedio sobre toda la tabla--
SELECT *,
		AVG(colegiatura) OVER ()
FROM platzi.alumnos;

SELECT *,
		SUM(colegiatura) OVER (ORDER BY colegiatura)
FROM platzi.alumnos;

SELECT *,
		SUM(colegiatura) OVER (PARTITION BY carrera_id ORDER BY colegiatura)
FROM platzi.alumnos;

SELECT *,
		RANK() OVER (PARTITION BY carrera_id ORDER BY colegiatura DESC)
FROM platzi.alumnos;

SELECT *,
		RANK() OVER (PARTITION BY carrera_id ORDER BY colegiatura DESC) AS brand_rank
FROM platzi.alumnos
ORDER BY carrera_id, brand_rank;

SELECT *,
		RANK() OVER (PARTITION BY carrera_id ORDER BY colegiatura DESC) AS brand_rank
FROM platzi.alumnos
WHERE brand_rank < 3 --error, la window function se calcula despues de todo pero antes de order by por lo que no hay columna cuando ponemos el where--
ORDER BY carrera_id, brand_rank;

SELECT *
FROM (
		SELECT *,
		RANK() OVER (PARTITION BY carrera_id ORDER BY colegiatura DESC) AS brand_rank
		FROM platzi.alumnos
) AS ranked_colegiatura_por_carrera
WHERE brand_rank < 3
ORDER BY brand_rank;