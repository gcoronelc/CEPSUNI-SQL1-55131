-- SUBCONSULTAS
-- ==============================================
/*

CONSULTA
---------

   - SELECT
   - INSERT
   - UPDATE
   - DELETE


SUBCONSULTA
------------

    Sentencia SELECT, que se utiliza dentro de una consulta.
	Siempre esta entre parentesis.

*/

-- SUBCONSULTAS QUE RETORNAN UN VALOR
-- Se tratan como un valor escalar

select E.*, (select avg(sueldo) from rh..empleado) SUELDO_PROMEDIO
from rh..empleado E
where E.sueldo < (select avg(sueldo) from rh..empleado);
go


-- SUBCONSULTAS QUE RETORNAN UN CONJUNTO DE VALORES
-- Su resultado puede ser tratado como un conjunto
-- La subconsulta debe retornar una sola columna
/*

	WHERE <columna> [NOT] IN ( <subconsulta> )

*/

select * from edutec..Curso
where IdCurso NOT in (select DISTINCT IdCurso from edutec..CursoProgramado 
					where IdCiclo = '2021-02')
order by 1;
go

-- SUBCONSULTAS COMO TABLAS DERIVADAS
/*

	SELECT .. 
	FROM TABLA
	JOIN ( <subconsulta> ) AS TD

*/

select C.* 
from edutec..Curso C
join (select distinct IdCurso from edutec..CursoProgramado 
	  where IdCiclo = '2021-03') as td
on C.IdCurso = td.IdCurso
order by 1;
go


-- SUBCONSULTAS CORRELACIONADAS
-- Utilizan columnas de la consulta externa
-- Pueden afectar el redimiento de la consulta general


select * from edutec..Curso C
where (	select count(1) 
		from edutec..CursoProgramado CP 
		where CP.IdCiclo = '2021-03'
		and CP.IdCurso = C.IdCurso   ) > 0
order by 1;
go


-- USO DE EXISTS Y NOT EXISTS

select * from edutec..Curso C
where EXISTS ( select 1
		from edutec..CursoProgramado CP 
		where CP.IdCiclo = '2021-03'
		and CP.IdCurso = C.IdCurso )
order by 1;
go


-- INSERCIÓN DE FILAS CON SUBCONSULTA

USE RH;
GO

drop table EMP_AUX;
go

SELECT * INTO EMP_AUX
FROM EMPLEADO
WHERE 1=0;

INSERT INTO EMP_AUX 
SELECT * FROM EMPLEADO;
GO


SELECT * FROM EMP_AUX ;
GO


-------------------------------------------------------------
begin tran;
go

with 
tv1 as (select iddepartamento, avg(sueldo) promedio 
		from rh..empleado group by iddepartamento)
update rh..empleado
set sueldo = sueldo * 1.2
where sueldo < (select tv1.promedio from tv1 
				where rh..empleado.iddepartamento = tv1.iddepartamento );
go


rollback;


with 
tv1 as (select iddepartamento, avg(sueldo) promedio 
		from rh..empleado group by iddepartamento)
update rh..empleado
set sueldo = sueldo * 1.2
from rh..empleado e 
join tv1 on e.iddepartamento = tv1.iddepartamento
where e.sueldo < tv1.promedio;
go


