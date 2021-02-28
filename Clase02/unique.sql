-- UNIQUE

INSERT INTO CLINICA..EMPLEADO(NOMBRE,APELLIDO,CORREO,DNI,TELEFONO) 
VALUES ('PEDRO','MARRUFO','pmarrufo@gmail.com','65782345','6578234567');
go

select * from clinica..EMPLEADO;
go

delete from clinica..EMPLEADO;
go


ALTER TABLE clinica..empleado
add constraint u_empleado_dni 
unique( dni );
go


INSERT INTO CLINICA..EMPLEADO(NOMBRE,APELLIDO,CORREO,DNI,TELEFONO) 
VALUES ('PEDRO','MARRUFO','pmarrufo@gmail.com','65782345','6578234567');
go

select * from clinica..EMPLEADO;
go