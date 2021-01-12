DELETE FROM platzi.alumnos
WHERE id IN (
	SELECT id
	FROM (
		SELECT id,
		ROW_NUMBER() OVER(
			PARTITION BY
				nombre,
				apellido,
				email,
				colegiatura,
				fecha_incorporacion,
				carrera_id,
				tutor_id
			ORDER BY id ASC 
		)AS row
		FROM platzi.alumnos
	)AS duplicados
	WHERE duplicados.row > 1
);