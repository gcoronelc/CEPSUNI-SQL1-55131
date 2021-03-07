-- Seleccionar columnas

select * 
from edutec.dbo.Alumno;
go

select IdAlumno, ApeAlumno, NomAlumno 
from edutec.dbo.Alumno;
go

select IdAlumno codigo, ApeAlumno apellidos, NomAlumno nombres 
from edutec.dbo.Alumno;
go


-- Ejercicio 1
-- Desarrolle una sentencia SELECT para consultar el nombre, apellido 
-- y correo de los empleados de la base de datos RH.


-- Ejercicio 2
-- Desarrolle una sentencia SELECT para consultar el nombre, vacantes 
-- y precio de cada curso de la base de datos EDUCA.

SELECT cur_nombre,cur_vacantes,cur_precioFROM EDUCA.dbo.CURSO;GO


-- Campos calculados y operadores aritméticos
-- Columnas que solo se muestran en el resultado.

-- Ejemplo

select 
	idempleado, apellido, nombre,
	sueldo, sueldo * 1.20 as "futuro sueldo"
from rh.dbo.empleado;
go

-- Ejercicio 3. 
-- Desarrollar una sentencia SELECT que permita obtener el importe que se 
-- obtendría en cada curso, si se logra vender todas las vacantes por cada curso. 
-- Base de datos EDUCA.

-- De Diana Contreras Castro para todos:  02:30 PM

select	cur_nombre, cur_precio, cur_vacantes,	cur_precio * cur_vacantes [Importe total]from EDUCA.dbo.CURSO;go

select * from educa.dbo.curso;


-- Ejercicio 4. 
-- Desarrollar una consulta que permita mostrar las vacantes programas, los 
-- matriculados y las vacantes disponibles de cada curso de la base de datos EDUTEC.


-- De Juan Carlos Flower Estrada para todos:  02:31 PM

SELECT Vacantes,Matriculados,Matriculados-Vacantes "Disponibles"FROM EduTec.dbo.cursoProgramadoGO




-- Operadores de concatenación

-- Ejemplo con el operador +

select 
	idempleado codigo,
	apellido + ', ' + nombre [Nombre completo]
from rh..empleado;
go

select 
	idempleado CODIGO,
	concat(apellido, ', ', nombre) [NOMBRE COMPLETO]
from rh..empleado;
go


-- De Diana Contreras Castro para todos:  02:46 PM
select	idempleado codigo,	concat(nombre, ', ', apellido) [Nombre completo]from rh..empleado;go


-- De Diego Arguelles Beteta para todos:  02:46 PM

SELECT idempleado, CONCAT (apellido, ', ', nombre) AS NOMBRE_APELLIDOFROM RH.dbo.empleado;GO

-- De Mercedes Desposorio para todos:  02:47 PM

SELECT nombre + apellido [Nombre completo]FROM RH.dbo.empleado;


select	concat(nombre, ', ', apellido) [Nombre completo]from rh..empleado;go


-- De Marccelo Nina para todos:  02:53 PM

SELECT 	CP.IdCursoProg [CODIGO],	CP.IdCiclo+'/'+CP.IdCurso [CURSO],	CP.Matriculados+'/'+CP.Vacantes [VACANTES]FROM Edutec.dbo.CursoProgramado CP;
go

SELECT 	CP.IdCursoProg [CODIGO], 	CP.IdCiclo+'/'+CP.IdCurso [CURSO],	CONCAT(CONCAT(CP.Matriculados,' / '),	CP.Vacantes) [VACANTES]FROM Edutec.dbo.CursoProgramado CP;
go



-- filtros de filas


select * 
from rh..empleado
where sueldo > 15000;

-- Operadores de comparación
-- AND
-- OR
-- NOT


SELECT * 
FROM EDUTEC.DBO.CursoProgramado
WHERE LEFT(IDCICLO,4) = '2020';
GO




-- De Marccelo Nina para todos:  03:09 PM
--PREGUNTA 9SELECT D.iddepartamento FROM RH.dbo.departamento D WHERE UPPER(D.nombre)= 'CONTABILIDAD';GOSELECT E.*FROM RH.dbo.empleado EWHERE E.iddepartamento = 101;GO--PREGUNTA 10SELECT E.*FROM RH.dbo.empleado EWHERE E.iddepartamento = (SELECT D.iddepartamento FROM RH.dbo.departamento D WHERE UPPER(D.nombre)= 'GERENCIA');

-- De Diego Arguelles Beteta para todos:  03:10 PM
SELECT	idempleado, apellido, nombre, iddepartamentoFROM RH.dbo.empleadoWHERE iddepartamento='100';GO


-- De Juan Carlos Flower Estrada para todos:  03:13 PM
SELECT *FROM RH.dbo.empleadoWHERE idcargo = 'C02'go

-- De Marccelo Nina para todos:  03:14 PM
SELECT E.*FROM RH.dbo.empleado EWHERE E.idcargo='C02' OR E.idcargo='C01';
GO


-- OPERADORES RELACIONALES
-- =, >, >=, <, <=, <>


-- OPERADORE LOGICOS
-- AND, OR, NOT <CONDICION>

SELECT * 
FROM RH..EMPLEADO  
WHERE SUELDO > 3500 AND SUELDO < 7000;
GO


SELECT * 
FROM RH..EMPLEADO  
WHERE COMISION IS NOT NULL;
GO

-- DeL Diego Arguelles Beteta para todos:  03:15 PM
SELECT	idempleado, apellido, nombre, idcargoFROM RH.dbo.empleadoWHERE idcargo='C01' OR idcargo = 'C02'GO


-- De Diego Arguelles Beteta para todos:  03:27 PM
SELECT *FROM EDUCA.dbo.CURSOWHERE cur_profesor = ' ' OR cur_profesor IS NULL;GO
 
-- De Marccelo Nina para todos:  03:27 PM
-- PREGUNTA 12SELECT *FROM RH.dbo.empleado EWHERE E.iddepartamento=101 AND E.sueldo>10000;


-- De Adrián Mestanza Villacorta para todos:  03:28 PM
-- PREGUNTA 11
SELECT *FROM EDUCA..CURSOWHERE cur_matriculados = 0;GO
