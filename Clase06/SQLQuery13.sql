-- CREAR TABLAS A PARTIR DE UNA CONSULTA

select * 
from dbo.Customers;
go

select * 
into Customers2 -- Crea la nueva tabla con todos los datos
from dbo.Customers;
go


select * 
from dbo.Customers2;
go


select * 
into Customers3 -- Crea la nueva tabla sin datos, solo estructura
from dbo.Customers
where 1=0;
go


select * 
from dbo.Customers3;
go




