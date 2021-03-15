-- VALORES NULOS
/*
	Toda operación con valores nulos, es otro valor nulo.
*/

select 8 + 6 + null as [suma];
go

-- FUNCION: ISNULL
-- Su objetivo es reemplazar el valor nulo por un valor no nulo.

SELECT 
	ISNULL(10,20) [Resultado 1],
	ISNULL(NULL,20) [Resultado 2];
go

-- COALESCE
-- Su objetivo es retornar el primer valor no nulo de un conjunto de valores

SELECT 
	COALESCE(10, 20, 30) [Resultado 1],
	COALESCE(NULL, 20, 30) [Resultado 2],
	COALESCE(NULL, NULL, 30) [Resultado 3];
GO


-- IIF( <condicion>, <resultado TRUE>, <resultado FALSE> )
-- El objetivo es retornar un valor en función a la condición

SELECT 
	IIF(30>20, 'Voy al cine', 'Vol al parque') [Resultado 1],
	IIF(100>300, 'Es hora del desayuno', 'Es hora del almuerzo') [Resultado 2];
GO

-- Ejemplo 1

SELECT e.*, (sueldo + comision) [total]
FROM rh.dbo.empleado e;
go

SELECT e.*, (sueldo + isnull(comision,0)) [total]
FROM rh.dbo.empleado e;
go

SELECT e.*, (sueldo + COALESCE(comision,0)) [total]
FROM rh.dbo.empleado e;
go

SELECT e.*, (sueldo + IIF(comision IS NULL,0,comision)) [total]
FROM rh.dbo.empleado e;
go


-- Ejercicio 20
/*
Desarrollar una sentencia SELECT para consultar los empleados cuyos ingresos totales es
menor a 8,000.00. Base de datos RH.
*/

-- De Nina Valladares Marccelo para todos:  02:19 PM

SELECT 	E.idempleado [CODIGO],	E.apellido+' '+E.nombre [EMPLEADO],	E.sueldo [SUELDO],	ISNULL(E.comision,0) [COMISION],	E.sueldo + ISNULL(E.comision,0) [TOTAL],	IIF((sueldo + ISNULL(comision,0))<8000,'CUMPLE','NO CUMPLE') [ESTATUS]FROM RH.dbo.empleado EWHERE (E.sueldo + ISNULL(E.comision,0)) < 8000;
go


-- De Mercedes Desposorio para todos:  02:19 PM

SELECT *FROM (SELECT e.*, (sueldo + COALESCE(comision,0)) [total]      FROM rh.dbo.empleado e) aWHERE a.total<8000;GO
