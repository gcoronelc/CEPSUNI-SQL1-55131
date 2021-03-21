-- INNER JOIN
/*

	FROM <tabla1> T1
	JOIN <tabla2> T2 ON <condicion1>
	JOIN <tabla3> T3 ON <condicion2>
	JOIN <tabla4> T4 ON <condicion3>
	. . .

*/

-- Ejemplo

select T.IdTarifa, T.Descripcion Nombre, COUNT(1) Cursos
from edutec..Curso C
join EduTec..Tarifa T on C.IdTarifa = T.IdTarifa
group by T.IdTarifa, T.Descripcion;
go


-- Ejemplo 2

SELECT      D.iddepartamento, D.nombre,      AVG (SUELDO) [SUELDO PROMEDIO]FROM RH..departamento Djoin RH..empleado E on D.iddepartamento = E.iddepartamentoGROUP BY D.iddepartamento, D.nombre;GO


-- Ejercicio 1. 
/*
Desarrolle una sentencia SELECT para obtener un listado que incluya el nombre del
curso con sus respectivos nombres de alumnos. Base de datos EDUCA.
*/

-- De Mercedes Desposorio para todos:  02:29 PM

SELECT M.cur_id, C.cur_nombre, M.alu_id, A.alu_nombreFROM EDUCA..MATRICULA MINNER JOIN EDUCA..ALUMNO A ON M.alu_id=A.alu_idINNER JOIN EDUCA..CURSO C ON M.cur_id=C.cur_id;
go

select * from EDUCA..CURSO;
go




-- Ejercicio 2. 
/*
Desarrolle una sentencia SELECT que muestre el nombre del alumno y la suma de
todos sus pagos. Base de datos EDUCA.
*/

-- De Diego Arguelles Beteta para todos:  02:34 PM

SELECT b.alu_id, b.alu_nombre, SUM(a.pag_importe) AS PAGOFROM EDUCA.dbo.PAGO aJOIN EDUCA.dbo.ALUMNO b ON a.alu_id=b.alu_idGROUP BY b.alu_id, b.alu_nombre;
go

select * from EDUCA..PAGO;
go





-- Ejercicio 3. 
/*
Desarrolle una sentencia SELECT que muestre el nombre del curso y la suma de todos
sus pagos. Base de datos EDUCA.
*/

-- De Nina Valladares Marccelo para todos:  02:38 PM
-- Pregunta 3SELECT C.cur_id,C.cur_nombre,SUM(P.pag_importe) [SUMA PAGOS]FROM EDUCA.dbo.CURSO C	INNER JOIN EDUCA.dbo.PAGO P ON(P.cur_id=C.cur_id)GROUP BY C.cur_id,C.cur_nombre;
go

-- De Katherine Vergara para todos:  02:39 PM
---3------SELECT C.cur_nombre ,  SUM ( ISNULL(P.pag_importe, 0)) PAGOSFROM EDUCA..PAGO PINNER JOIN EDUCA..CURSO C ON P.cur_id=C.cur_idGROUP BY C.cur_nombre;
go


-- Ejercicio 4. 
/*
Desarrolle una sentencia SELECT que muestre el nombre del departamento y el importe
de su planilla. Base de datos RH.
*/

-- De Nina Valladares Marccelo para todos:  02:42 PM
--Pregunta 4SELECT D.iddepartamento [CODIGO],UPPER(D.nombre) [DEPARTAMENTO],SUM(E.sueldo + ISNULL(E.comision,0)) [IMPORTE PLANILLA]FROM RH.dbo.empleado E	INNER JOIN RH.dbo.departamento D ON(D.iddepartamento=E.iddepartamento)GROUP BY D.iddepartamento,D.nombre;
go




-- Ejercicio 5. 
/*
Desarrolle una sentencia SELECT para encontrar la cantidad de trabajadores en cada
ciudad. Base de datos RH.
*/




-- Ejercicio 6. 
/*
Desarrollar una sentencia SELECT para encontrar la cantidad de alumnos matriculados
por curso en el ciclo actual. El resultado debe mostrar tres columnas: código del curso,
nombre del curso y cantidad de alumnos matriculados. Base de datos EDUTEC.
*/




-- Ejercicio 7. 
/*
Desarrollar una sentencia SELECT para encontrar el pago que se le debe hacer a cada
profesor en el ciclo actual. Base de datos EDUTEC.
*/



-- Ejercicio 8. 
/*
Desarrollar una sentencia SELECT para encontrar los ingresos por curso en el periodo
actual. Base de datos EDUTEC.
*/



