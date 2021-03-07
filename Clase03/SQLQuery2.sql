
SELECT * FROM RH..empleado;
GO

alter table empleado
add constraint u_empleado_email
unique ( email );
go

SELECT * FROM RH..empleado;
GO

update empleado 
set email = 'gcoronelc@gmail.com'
where idempleado = 'E0005';
go

