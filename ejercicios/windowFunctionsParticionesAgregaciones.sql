SELECT ROW_NUMBER() OVER() AS row_id, *
FROM platzi.alumnos;

SELECT ROW_NUMBER() OVER(ORDER BY fecha_incorporacion) AS row_id, *
FROM platzi.alumnos;

SELECT FIRST_VALUE(colegiatura) OVER(PARTITION BY carrera_id) AS priemra_colegiatura, *
FROM platzi.alumnos;

SELECT LAST_VALUE(colegiatura) OVER(PARTITION BY carrera_id) AS ultima_colegiatura, *
FROM platzi.alumnos;

SELECT NTH_VALUE(colegiatura, 3) OVER(PARTITION BY carrera_id) AS priemra_colegiatura, *
FROM platzi.alumnos;

SELECT *,
		RANK() OVER(PARTITION BY carrera_id ORDER BY colegiatura DESC) AS colegiatura_rank
FROM platzi.alumnos
ORDER BY carrera_id, colegiatura_rank;

SELECT *,
		DENSE_RANK() OVER(PARTITION BY carrera_id ORDER BY colegiatura DESC) AS colegiatura_rank
FROM platzi.alumnos
ORDER BY carrera_id, colegiatura_rank;

--(rank-1) / (total rowa -1)
SELECT *,
		PERCENT_RANK() OVER(PARTITION BY carrera_id ORDER BY colegiatura DESC) AS colegiatura_rank
FROM platzi.alumnos
ORDER BY carrera_id, colegiatura_rank;