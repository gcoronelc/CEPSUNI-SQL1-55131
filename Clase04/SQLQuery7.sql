-- Funciones de conversión

-- CAST
/*
	CAST ( expression AS data_type [ ( length ) ] )
*/

SELECT 7 + CAST('56' AS NUMERIC) [SUMA];
GO


-- CONVERT
/*
	CONVERT ( data_type [ ( length ) ] , expression [ , style ] ) 
*/

SELECT CONVERT(DATE,'03/24/2021',101) [FECHA];
GO


-- FUNCIONES DE FECHA

SELECT 
	YEAR(GETDATE()) [Año],
	MONTH(GETDATE()) [Mes],
	DATEPART(YEAR,GETDATE()) [Año],
	DATEPART(QQ,GETDATE()) [Trimestre];
GO

SELECT 
	DATENAME(MONTH,GETDATE()) [Año],
	DATENAME(DW,GETDATE()) [Trimestre];
GO


-- Ejercicio 21
/*
Desarrollar una sentencia SELECT para consultar los empleados que ingresaron a la empresa
un mes de enero. Base de datos RH.
*/

-- De Nina Valladares Marccelo para todos:  02:37 PM

SELECT E.*
FROM RH.dbo.empleado E
WHERE MONTH(E.fecingreso)=1;
go


-- De Diego Arguelles Beteta para todos:  02:38 PM

SELECT * 
FROM RH.dbo.empleado
WHERE MONTH(fecingreso)=1;
go


-- De Juan Carlos Flower Estrada para todos:  02:41 PM

SELECT *
FROM RH.dbo.empleado
where fecingreso IN (select fecingreso from RH.dbo.empleado where MONTH(fecingreso) = 1);


-- Ejercicio 22
/*
Desarrollar una sentencia SELECT para consultar las matrículas del último mes. 
Base de datos EDUCA.
*/

-- De Diego Arguelles Beteta para todos:  02:58 PM

SELECT*
FROM EDUCA.dbo.MATRICULA
WHERE month(mat_fecha) = month(getdate());
go

-- De Nina Valladares Marccelo para todos:  03:01 PM

SELECT *
FROM EduTec.dbo.MATRICULA
WHERE MONTH(FecMatricula)=(MONTH(GETDATE())-1) AND YEAR(FecMatricula)=YEAR(GETDATE());
go

-- DATEADD

SELECT GETDATE(), DATEADD(MM,-1,GETDATE());
GO



SELECT *
FROM EduTec.dbo.MATRICULA
WHERE MONTH(FecMatricula)=MONTH(DATEADD(MM,-1,GETDATE())) 
AND YEAR(FecMatricula)=YEAR(DATEADD(MM,-1,GETDATE()));
go









