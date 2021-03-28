-- OPERADOR TOP
/*

	TOP (expression) [PERCENT] [ WITH TIES]

	- TOP 3
	  Muestra los 3 primeros

	- TOP 3 PERCENT
	  Muestra el 3% del total.

	- TOP 1 WITH TIES
	  Te muestra el 1 registro y si hay empates, te muestra los empatados tambien.

*/

select top 5 * 
from dbo.Customers 
order by ContactName;
go


select top 15 PERCENT * 
from dbo.Customers 
order by ContactName;
go


select top 1 with ties * 
from rh..empleado
where idcargo in ('C04','C03')
order by sueldo desc;
GO
