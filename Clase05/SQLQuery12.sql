-- common table expressions
-- -----------------------------------------------------


WITH 
TV1 AS (SELECT SUM(SUELDO) TOTAL FROM RH..empleado),
TV2 AS (SELECT			D.iddepartamento, D.nombre,			SUM (SUELDO) [PLANILLA]		FROM RH..departamento D		join RH..empleado E on D.iddepartamento = E.iddepartamento		GROUP BY D.iddepartamento, D.nombre)
SELECT 	TV2.iddepartamento, TV2.nombre, TV2.PLANILLA, TV1.TOTAL,	(TV2.PLANILLA * 100 / TV1.TOTAL) PORCENTAJEFROM TV1 CROSS JOIN TV2;




