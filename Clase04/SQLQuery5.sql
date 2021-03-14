-- OPERADOR IN
/*

	También llamado operador de conjuntos.
	Verifica si el valor de una columna pertenece o no pertenece a un conjutno de datos.

	<columna> [NOT] IN ( <elem1>, <elem2>, ... )

	<columna> [NOT] IN ( SELECT <columna> FROM <tabla> WHERE <filtro> )

*/

-- Ejemplo 1

select * 
from rh..empleado;
go

select * 
from rh..empleado
where idcargo NOT IN ( 'C02', 'C04', 'C07' );
go


-- Ejemplo 2

select * 
from rh..empleado
where idcargo IN ( select idcargo from rh..cargo where nombre like '%gerente%' );
go



