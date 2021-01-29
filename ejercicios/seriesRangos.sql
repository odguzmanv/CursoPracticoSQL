SELECT *
FROM generate_series(1,4);

--Esto genera un fallo (vacio), necesita de un "paso"--
SELECT *
FROM generate_series(5,1);

SELECT *
FROM generate_series(5,1, -2);

--Solo hace un paso--
SELECT *
FROM generate_series(4,4);

--el mismo error que arriba pero al revés--
SELECT *
FROM generate_series(3,5,-1);

SELECT *
FROM generate_series(1.1,4,1.3);

--Series de tiempo--
--fecha actual--
SELECT current_date + s.a AS dates
FROM generate_series(0,14,7) AS s(a);

--fecha dada--
SELECT *
FROM generate_series('2020-09-01 00:00:00'::timestamp,
					'2020-09-04 12:00:00', '10 hours');

SELECT a.id,
		a.nombre,
		a.apellido,
		a.carrera_id,
		s.a
FROM platzi.alumnos AS a
	INNER JOIN generate_series(0,10) AS s(a)
	ON s.a = carrera_id
ORDER BY a.carrera_id;

Select lpad('*', CAST(ordinality AS int), '*')
FROM generate_series(10,2,-2) WITH ordinality;

Select *
FROM generate_series(10,2,-2) WITH ordinality;

--En SQL de microsoft--
CREATE SEQUENCE Test.CountBy1  
    START WITH 5  
    INCREMENT BY 5;

drop table #Generar_Rangos

create table #Generar_Rangos
(
[Numero] FLOAT not null
)

declare @valorInicial FLOAT = 1.1
declare @valorFinal FLOAT = 4
declare @delta FLOAT = 1.3

;with genera as (
        select @valorInicial as VI
        union all
        select VI+ @delta from genera where VI+ @delta <= @valorFinal
)
insert into #Generar_Rangos (Numero)
select * from genera



select * from #Generar_Rangos




----ejercicio 2 por fechas

drop table #Generar_Rangos

create table #Generar_Rangos
(
[Fecha] date not null
)

declare @valorInicial date = convert (date,getdate ())
declare @valorFinal date = convert (date,getdate ()+10)
declare @delta FLOAT = 2

;with genera as (
        select @valorInicial as VI
        union all
        select  DATEADD(day,@delta,VI) from genera where DATEADD(day,@delta,VI) <= @valorFinal
)
insert into #Generar_Rangos (Fecha)
select * from genera

select * from #Generar_Rangos>
