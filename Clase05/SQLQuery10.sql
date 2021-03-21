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







