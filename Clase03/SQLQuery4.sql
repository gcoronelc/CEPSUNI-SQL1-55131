-- Operador Like
/*
	Trabaja en base de un patron, hace uso de comodines:

	_   => Un caracter, cualquier caracter
	%   => Una cadena de caracteres
	[]  => Agrupar caracteres

	<columna> [NOT] LIKE '<patron>'

*/


SELECT E.*FROM RH.dbo.empleado EWHERE E.idcargo LIKE 'C0[12]'
GO

SELECT * FROM DBO.EMPLEADO
WHERE APELLIDO LIKE 'c%';

SELECT * FROM DBO.EMPLEADO
WHERE APELLIDO LIKE '%O';



-- OPERADOR BETWEEN
/*
     <COLUMNA? [NOT] BETWEEN <limite inferior> AND <limite superior>

*/

select * 
from rh.dbo.empleado
order by sueldo;
go


select * 
from rh.dbo.empleado
where sueldo between 2500 and 3500
order by sueldo;
go


select * 
from rh.dbo.empleado
where nombre between 'C'and 'M'
order by nombre;
go

