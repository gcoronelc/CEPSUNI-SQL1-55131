



-- =============================================
-- Creación de la Base de Datos
-- =============================================

USE master;
go

IF( EXISTS ( SELECT name FROM master.sys.databases WHERE name = 'CLINICA' ) )
BEGIN
	DROP DATABASE CLINICA;
END;
go

CREATE DATABASE CLINICA;
go


-- =============================================
-- Creció la Base de Datos
-- =============================================

use clinica;
go





CREATE TABLE TURNO
( 
	IDTURNO              char(18)  NOT NULL ,
	NOMBRE               varchar(50)  NOT NULL ,
	INICIA               varchar(20)  NOT NULL ,
	FINALIZA             varchar(20)  NOT NULL ,
	CONSTRAINT XPKTURNO PRIMARY KEY (IDTURNO ASC)
)
go



CREATE TABLE EMPLEADO
( 
	IDEMPLEADO           integer IDENTITY ( 1,1 ) ,
	NOMBRE               varchar(100)  NOT NULL ,
	APELLIDO             varchar(100)  NOT NULL ,
	CORREO               varchar(20)  NOT NULL ,
	DNI                  varchar(20)  NOT NULL ,
	TELEFONO             varchar(20)  NOT NULL ,
	CONSTRAINT XPKEMPLEADO PRIMARY KEY (IDEMPLEADO ASC)
)
go



CREATE TABLE CONSULTORIO
( 
	IDCONSULTORIO        integer  NOT NULL ,
	NOMBRE               varchar(20)  NOT NULL ,
	PISO                 integer  NOT NULL ,
	NUMERO               integer  NOT NULL ,
	CONSTRAINT XPKCONSULTORIO PRIMARY KEY (IDCONSULTORIO ASC)
)
go



CREATE TABLE PACIENTE
( 
	IDPACIENTE           integer IDENTITY ( 1,1 ) ,
	APELLIDO             varchar(100)  NOT NULL ,
	NOMBRE               varchar(100)  NOT NULL ,
	TELEFONO             varchar(20)  NOT NULL ,
	DNI                  varchar(20)  NOT NULL ,
	CORREO               varchar(20)  NOT NULL ,
	CONSTRAINT XPKPACIENTE PRIMARY KEY (IDPACIENTE ASC)
)
go



CREATE TABLE ESPECIALIDAD
( 
	IDESPECIALIDAD       integer  NOT NULL ,
	NOMBRE               varchar(100)  NOT NULL ,
	CAPACIDAD            integer  NOT NULL ,
	CONSTRAINT XPKESPECIALIDAD PRIMARY KEY (IDESPECIALIDAD ASC)
)
go



CREATE TABLE MEDICO
( 
	IDMEDICO             integer IDENTITY ( 1,1 ) ,
	IDESPECIALIDAD       integer  NOT NULL ,
	NOMBRE               varchar(100)  NOT NULL ,
	APELLIDO             varchar(100)  NOT NULL ,
	DNI                  varchar(20)  NOT NULL ,
	TELEFONO             varchar(20)  NOT NULL ,
	CORREO               varchar(20)  NOT NULL ,
	CONSTRAINT XPKMEDICO PRIMARY KEY (IDMEDICO ASC),
	CONSTRAINT FK_MEDICO_ESPECIALIDAD FOREIGN KEY (IDESPECIALIDAD) REFERENCES ESPECIALIDAD(IDESPECIALIDAD)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
)
go


