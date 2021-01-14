SELECT a.nombre,
	a.apellido,
	t.nombre,
	t.apellido
FROM platzi.alumnos AS a
	INNER JOIN platzi.alumnos AS t ON a.tutor_id = t.id;

SELECT CONCAT(a.nombre, ' ', a.apellido) AS alumno,
	CONCAT(t.nombre, ' ', t.apellido) AS tutor
FROM platzi.alumnos AS a
	INNER JOIN platzi.alumnos AS t ON a.tutor_id = t.id;

SELECT CONCAT(t.nombre, ' ', t.apellido) AS tutor,
	COUNT(*) AS alumnos_por_tutor
FROM platzi.alumnos AS a
	INNER JOIN platzi.alumnos AS t ON a.tutor_id = t.id
GROUP BY tutor
ORDER BY alumnos_por_tutor DESC;

SELECT CONCAT(t.nombre, ' ', t.apellido) AS tutor,
	COUNT(*) AS alumnos_por_tutor
FROM platzi.alumnos AS a
	INNER JOIN platzi.alumnos AS t ON a.tutor_id = t.id
GROUP BY tutor
ORDER BY alumnos_por_tutor DESC
LIMIT 10;

SELECT AVG (alumnos_por_tutor) AS promedio_alumnos_por_tutor
	FROM (
		SELECT CONCAT(t.nombre, ' ', t.apellido) AS tutor,
		COUNT(*) AS alumnos_por_tutor
	FROM platzi.alumnos AS a
		INNER JOIN platzi.alumnos AS t ON a.tutor_id = t.id
	GROUP BY tutor
	ORDER BY alumnos_por_tutor DESC
) AS promedio;

SELECT AVG (alumnos_por_carrera) AS promedio_alumnos_por_carrera
	FROM (
		SELECT CONCAT(t.nombre, ' ', t.apellido) AS carrera,
		COUNT(*) AS alumnos_por_carrera
FROM platzi.alumnos AS a
	INNER JOIN platzi.alumnos AS t ON a.carrera_id = t.id
GROUP BY carrera
ORDER BY alumnos_por_carrera DESC) AS promedio;

SELECT AVG(dc.tutor_por_carrera)
	FROM(
-- seleciona cuantas tutorias realiza en una carrera--
SELECT 	CONCAT(t.nombre,' ',	t.apellido) AS tutor,
	COUNT(*) AS tutor_por_carrera,
	a.carrera_id
FROM platzi.alumnos AS a
	INNER JOIN platzi.alumnos AS t ON a.tutor_id=t.id 
		AND a.carrera_id=t.tutor_id
GROUP BY tutor, a.carrera_id	
ORDER BY tutor_por_carrera DESC) AS dc

