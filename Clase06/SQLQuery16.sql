-- DISTINCT
/*
	Anula los repetidos.
*/

-- Que cargos estan ocupando los empleados actualmente

select c.* 
from rh..cargo c
join (select distinct idcargo from rh..empleado) T
on c.idcargo = T.idcargo;
go

-- Consultar el numero de pedidos de cada cliente y el importe que representa.

select 
	C.CustomerID, C.CompanyName, count(distinct O.OrderID) Pedidos,
	sum(od.Quantity*od.UnitPrice*(1-od.Discount)) Importe
from Northwind..Customers C
join Northwind..Orders O on C.CustomerID = O.CustomerID
join Northwind..[Order Details] od on o.OrderID = od.OrderID
group by C.CustomerID, C.CompanyName;
go

select * from Northwind..Orders;
go

select sum(Quantity * UnitPrice*(1-Discount))
from Northwind..[Order Details];
go

