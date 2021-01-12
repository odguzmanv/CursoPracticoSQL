SELECT ROW_NUMBER() OVER() AS row_id, *
FROM platzi.alumnos
WHERE id IN (
	SELECT id
    FROM platzi.alumnos
	WHERE tutor_id = 30
);

SELECT ROW_NUMBER() OVER() AS row_id, *
FROM platzi.alumnos
WHERE id IN (
	SELECT id
    FROM platzi.alumnos
	WHERE tutor_id <> 30
);

SELECT ROW_NUMBER() OVER() AS row_id, *
FROM platzi.alumnos
WHERE id NOT IN (
	SELECT id
    FROM platzi.alumnos
	WHERE tutor_id = 30
);