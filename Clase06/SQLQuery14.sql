-- OPERADOR UNION
/*

	SELECT ...
	UNION
	SELECT ...
	UNION
	SELECT ...
	GO

	Condición:
	- Todas las consultas deben tener la misma cantidad de columnas.
	- Las columnas deben ser compatibles.
	- El titulo de las columnas del resultado final lo determina el primer SELECT.
	- Solo en el ultimo SELECT se puede aplicar ORDER BY.

*/


select 'Producto' [TIPO], ProductName [NAME] from dbo.Products
UNION
select 'Cliente', CompanyName from dbo.Customers
UNION
select 'Empleado', concat(LastName,' - ',FirstName) from dbo.Employees order by 1
go



select ProductName [NAME] from dbo.Products
UNION ALL
select ProductName [NAME] from dbo.Products
GO
