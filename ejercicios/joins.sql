SELECT carrera_id, COUNT(*) AS cuenta
FROM platzi.alumnos
GROUP BY carrera_id
ORDER BY cuenta DESC;

DELETE FROM platzi.carreras
WHERE id BETWEEN 30 AND 40;

--Exclusive Left Join--
SELECT  a.nombre,
		a.apellido,
		a.carrera_id,
		c.id,
		c.carrera
FROM platzi.alumnos AS a
	LEFT JOIN platzi.carreras AS c
	ON a.carrera_id = c.id
WHERE c.id IS NULL
ORDER BY a.carrera_id;

--Left Join--
SELECT a.nombre, a.apellido, a.carrera_id,
	   c.id, c.carrera
FROM platzi.alumnos AS a
	LEFT JOIN platzi.carreras AS c
	ON a.carrera_id = c.id
ORDER BY c.id DESC;
	
--Full Outer Join--
SELECT a.nombre,a.apellido,a.carrera_id,
       c.id,c.carrera
FROM platzi.alumnos AS a
    FULL OUTER JOIN platzi.carreras as c ON c.id = a.carrera_id
WHERE a.nombre IS NOT NULL
ORDER BY a.carrera_id;

SELECT a.nombre,a.apellido,a.carrera_id,
       c.id,c.carrera
FROM platzi.alumnos AS a
    FULL OUTER JOIN platzi.carreras as c ON c.id = a.carrera_id
ORDER BY a.carrera_id;

--Right JOIN--
SELECT a.nombre, a.apellido, a.carrera_id,
	   c.id, c.carrera
FROM platzi.alumnos AS a
	RIGHT JOIN platzi.carreras AS c
	ON a.carrera_id = c.id
ORDER BY c.id;

--Exclusive Right Join--
SELECT a.nombre, a.apellido, a.carrera_id,
	   c.id, c.carrera
FROM platzi.alumnos AS a
	RIGHT JOIN platzi.carreras AS c
	ON a.carrera_id = c.id
WHERE a.id IS NULL
ORDER BY c.id DESC;

--Inner Join, default--
SELECT a.nombre, a.apellido, a.carrera_id,
	   c.id, c.carrera
FROM platzi.alumnos AS a
	INNER JOIN platzi.carreras AS c
	ON a.carrera_id = c.id
ORDER BY c.id DESC;

--Diferencia Simétrica--
SELECT a.nombre, a.apellido, a.carrera_id,
	   c.id, c.carrera
FROM platzi.alumnos AS a
	FULL OUTER JOIN platzi.carreras AS c
	ON a.carrera_id = c.id
WHERE a.id IS NULL
	OR c.id IS NULL
ORDER BY a.carrera_id DESC, c.id DESC;
