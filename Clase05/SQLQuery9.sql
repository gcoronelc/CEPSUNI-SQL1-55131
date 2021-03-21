-- GROUP BY
/*

	Sintaxis:

	SELECT 
		<col1>, <col2>, ...
		<funcion1>, <funcion2>, ...
	FROM <tabla>
	GROUP BY <col1>, <col2>, ..

	Aplicar las funciones agregadas junto con GROUP BY
	para obtener resumenes de grupos.

	Por ejemplo:

	1.- Las ventas por producto.
	2.- El promedio por practica del curso SQL1.
	3.- La cantidad de habitantes por distrito, en la ciudad de lima.
	   
*/

-- Ejemplo
-- Cantidad de cursos por tipo de tarifa.

select * from edutec..Tarifa;
go

select c.*, 1
from edutec..Curso c;
go


select IdTarifa, COUNT(1) Cursos
from edutec..Curso
group by IdTarifa;
go


select IdTarifa, SUM(1) Cursos
from edutec..Curso
group by IdTarifa;
go

-- Ejercicio 6
/*
Desarrolle una sentencia SELECT para encontrar el salario promedio por departamento.
Base de datos RH.
*/

-- De Mercedes Desposorio para todos:  01:14 PM
SELECT      Iddepartamento,      AVG (SUELDO) [PROMSUELDO]FROM RH..empleadoGROUP BY iddepartamento;GO

-- De Nina Valladares Marccelo para todos:  01:15 PM
SELECT iddepartamento, AVG(sueldo + ISNULL(comision,0)) [SALARIO PROMEDIO]FROM RH.dbo.empleadoGROUP BY iddepartamento;
GO

-- Ejercicio 7
/*
Desarrolle una sentencia SELECT para encontrar la cantidad de trabajadores por
departamento. Base de datos RH.
*/

-- De Diego Arguelles Beteta para todos:  01:15 PM

SELECT iddepartamento, count (idempleado) AS N_EMPLEADOSFROM RH.dbo.empleadoGROUP BY iddepartamento;
go

-- De Nina Valladares Marccelo para todos:  01:15 PM
SELECT iddepartamento, COUNT(iddepartamento) [CANTIDAD]FROM RH.dbo.empleadoGROUP BY iddepartamento;
GO



-- HAVING
/*
	Para aplicar filtros a nivel de grupos.

	Sintaxis:

	SELECT 
		<col1>, <col2>, ...
		<funcion1>, <funcion2>, ...
	FROM <tabla>
	GROUP BY <col1>, <col2>, ..
	HAVING <Condicion aplicando funciones agregadas: funcion1, funcion2, ...>

	Ejemplo:

	1.- Listado de los estudiantes del curso de SQL1 que tienen
	    promedio en el modulo completo mayor que 15.

	2.- Listado de los mejores clientes. 
	    Los mejores clientes son los que consumen al año mas de 20,000.00


*/

-- Ejemplo

select IdCurso, count(1) Aulas, sum(Matriculados) Matriculados
from edutec..CursoProgramado
where left(IdCiclo,4) = '2021'
group by IdCurso
having count(1) > 10;
go


-- Ejercicio 8
/*
Desarrolle una sentencia SELECT para encontrar los departamentos que tienen más de
5 trabajadores. Base de datos RH.
*/

-- De Mercedes Desposorio para todos:  01:36 PM
SELECT iddepartamento,       COUNT (1) TrabajadoresFROM RH..empleadoGROUP BY iddepartamentoHAVING count(1)>5;
GO



-- Ejercicio 9. 
/*
Desarrolle una sentencia SELECT para encontrar el importe recaudado por curso. Base
de datos EDUCA.
*/

-- De Mercedes Desposorio para todos:  01:45 PM

SELECT CUR_ID,       SUM (pag_importe) SUMAIMPORTEFROM EDUCA..PAGOGROUP BY CUR_ID;
GO

-- De Katherine Vergara para todos:  01:46 PM
SELECT cur_id,  sum (isnull(pag_importe , 0)) importeFROM EDUCA..PAGOGROUP BY cur_id ;
GO



-- Ejercicio 10
/*
Desarrollar una sentencia SELECT para encontrar los profesores que tienen mas de 2
cursos programados en el ciclo actual. Base de datos EDUTEC.
*/

-- De Nina Valladares Marccelo para todos:  01:37 PM
SELECT IdProfesor, COUNT(IdCurso) [CANTIDAD]FROM EduTec.dbo.CursoProgramadoWHERE IdCiclo='2021-01'GROUP BY IdProfesorHAVING COUNT(IdCurso)>2;


-- De Diego Arguelles Beteta para todos:  01:38 PM

SELECT IdProfesor, count (1) AS cursos_progFROM Edutec.dbo.CursoProgramadoWHERE IdCiclo LIKE '2021-01'GROUP BY IdProfesorhaving count (1) >2



-- Ejercicio 11
/*
Desarrollar una sentencia SELECT para encontrar la cantidad de veces que se ha
programado cada curso en cada ciclo en el presente año. Solo se debe mostrar los
cursos que se han programado mas de 2 veces. Base de datos EDUTEC.
*/


-- De Diego Arguelles Beteta para todos:  01:43 PM

SELECT IdCurso, IdCiclo, count (IdCurso) AS cursos_progFROM Edutec.dbo.CursoProgramadoWHERE IdCiclo LIKE '2021%'GROUP BY IdCurso, IdCiclohaving count (1) >2;
go


-- De Nina Valladares Marccelo para todos:  01:44 PM
-- Pregunta 11SELECT IdCurso, IdCiclo, COUNT(IdCurso) [CANTIDAD]FROM EduTec.dbo.CursoProgramadoWHERE LEFT(IdCiclo,4)='2021'GROUP BY IdCurso,IdCicloHAVING COUNT(IdCurso)>2;
GO



	



