-- FUNCIONES AGREGADAS

SELECT
	COUNT(*) [EMPS],
	COUNT(1) [EMPS],
	COUNT(100) [EMPS],
	SUM(1) [EMPS],
	COUNT(COMISION) [EMPS] -- Cuenta la cantidad de valores no nulos
FROM RH..Empleado ;
GO


SELECT
	COUNT(*) [EMPS],
	COUNT(1) [EMPS],
	COUNT(100) [EMPS],
	SUM(1) [EMPS],
	COUNT(COMISION) [EMPS] -- Cuenta la cantidad de valores no nulos
FROM RH..Empleado 
where sueldo between 3000 and 7000;
GO

-- Ejercicio 1
/*
Desarrolle una sentencia SELECT para calcular el importe de la planilla del departamento de
ventas. Debe incluir el sueldo y la comisión. Base de datos RH.
*/

-- De Diego Arguelles Beteta para todos:  03:35 PM
WITH 
TABLA_APOYO AS (SELECT SUM(sueldo) AS sueldo_total, SUM (comision) AS comision_total
				FROM RH.dbo.empleado
				WHERE iddepartamento=103)
SELECT 
	sueldo_total, 
	comision_total, 
	sueldo_total+comision_total AS planilla_total
FROM TABLA_APOYO;
go


-- De Nina Valladares Marccelo para todos:  03:35 PM

SELECT SUM(E.sueldo + ISNULL(E.comision,0)) [IMPORTE]
FROM RH.dbo.empleado E
WHERE E.iddepartamento = (SELECT iddepartamento FROM RH.dbo.departamento WHERE UPPER(NOMBRE) = 'VENTAS');
go

-- De Nina Valladares Marccelo para todos:  03:43 PM
SELECT 
	SUM(E.sueldo)[SUELDO TOTAL],
	SUM(ISNULL(E.comision,0))[COMISION TOTAL],
	SUM(E.sueldo + ISNULL(E.comision,0)) [IMPORTE]
FROM RH.dbo.empleado E
WHERE E.iddepartamento = (SELECT iddepartamento FROM RH.dbo.departamento WHERE UPPER(NOMBRE) = 'VENTAS');


-- Ejercicio 2
/*
Desarrolle una sentencia SELECT para encontrar el mayor y menor sueldo en el
departamento de ventas. Base de datos RH.
*/

-- De Nina Valladares Marccelo para todos:  03:45 PM

SELECT MAX(E.sueldo)[SUELDO MAYOR], MIN(E.sueldo)[SUELDO MENOR]
FROM RH.dbo.empleado E
WHERE E.iddepartamento = (SELECT iddepartamento FROM RH.dbo.departamento WHERE UPPER(NOMBRE) = 'VENTAS');
go


-- Ejercicio 3
/*
Desarrolle una sentencia SELECT para encontrar el salario promedio en la empresa. 
Base de datos RH.
*/

-- De Nina Valladares Marccelo para todos:

SELECT AVG(E.sueldo + ISNULL(E.comision,0)) [PROMEDIO]
FROM RH.dbo.empleado E;
go


