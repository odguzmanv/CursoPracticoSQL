SELECT *
FROM platzi.alumnos
FETCH FIRST 5 ROWS ONLY;

SELECT *
FROM platzi.alumnos
LIMIT 5;

SELECT *
FROM(
	SELECT ROW_NUMBER() OVER() AS row_id, *
    FROM platzi.alumnos
) AS alumnos_with_row_num
WHERE row_id < 6;