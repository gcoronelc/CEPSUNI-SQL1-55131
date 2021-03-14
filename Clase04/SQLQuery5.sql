-- OPERADOR IN
/*

	También llamado operador de conjuntos.
	Verifica si el valor de una columna pertenece o no pertenece a un conjutno de datos.

	<columna> [NOT] IN ( <elem1>, <elem2>, ... )

	<columna> [NOT] IN ( SELECT <columna> FROM <tabla> WHERE <filtro> )

*/

-- Ejemplo 1

select * 
from rh..empleado;
go

select * 
from rh..empleado
where idcargo NOT IN ( 'C02', 'C04', 'C07' );
go


-- Ejemplo 2

select * 
from rh..cargo 
where nombre like '%gerente%';
go

select * 
from rh..empleado
where idcargo IN ( select idcargo from rh..cargo where nombre like '%gerente%' );
go

-- Ejercicio 1
/*
Se necesita una conulta para saber la programación de los
cursos que tienen tarifa A en el ciclo actual.
*/

-- De Mercedes Desposorio para todos:  01:15 PM

SELECT *FROM EduTec..CursoProgramadoWHERE IdCurso IN (SELECT IdCurso FROM EduTec..Curso WHERE IdTarifa like 'A');
go

-- De Nina Valladares Marccelo para todos:  01:15 PM

SELECT *FROM EduTec.dbo.CursoProgramadoWHERE IdCurso IN (SELECT IdCurso FROM EduTec.dbo.Curso WHERE UPPER(IdTarifa) = 'a') AND	  IdCiclo='2021-03';
go

-- Otra respuesta

select cp.idciclo , c.nomcurso , cp.horariofrom edutec..cursoprogramado CPjoin edutec..curso c on cp.IdCurso = c.IdCursowhere c.idtarifa = 'A' and cp.IdCiclo='2021-03';
go


-- Ejercicio 2
/*
Desarrollar una sentencia SELECT que permita averiguar quiénes son los empleados de los
departamentos de contabilidad y ventas. Base de datos RH.
*/

-- De Nina Valladares Marccelo para todos:  01:29 PM
SELECT *FROM RH.dbo.empleadoWHERE iddepartamento IN (SELECT iddepartamento FROM RH.dbo.departamento 
						WHERE UPPER(nombre) IN ('CONTABILIDAD','VENTAS'))
order by nombre;
GO

-- De Diego Arguelles Beteta para todos:  01:31 PM
SELECT *FROM RH.dbo.empleadoWHERE iddepartamento IN (SELECT iddepartamento FROM RH.dbo.departamento 					WHERE nombre IN ( 'Contabilidad','Ventas'))order by 2 desc;GO


