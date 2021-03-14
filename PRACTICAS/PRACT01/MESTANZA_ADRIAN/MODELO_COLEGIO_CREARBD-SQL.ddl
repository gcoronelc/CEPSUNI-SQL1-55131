
-- =============================================
-- Creaci�n de la Base de Datos
-- =============================================

USE master;
go

IF( EXISTS ( SELECT name FROM master.sys.databases WHERE name = 'COLEGIO' ) )
BEGIN
	DROP DATABASE COLEGIO;
END;
go

CREATE DATABASE COLEGIO;
go

USE COLEGIO;
go





CREATE TABLE FAMILIA
( 
	CODFAMILIA           integer IDENTITY ( 1,1 ) ,
	FAMILIA              varchar(20)  NOT NULL ,
	NUMHIJOS             integer  NOT NULL ,
	HIJOSCICLOACTUAL     integer  NOT NULL ,
	CONSTRAINT XPKFAMILIA PRIMARY KEY (CODFAMILIA ASC)
)
go



CREATE TABLE ALUMNO
( 
	CODALUMNO            integer IDENTITY ( 1,1 ) ,
	NOMBRE               varchar(20)  NOT NULL ,
	APELLIDO             varchar(20)  NOT NULL ,
	CORREO               varchar(50)  NOT NULL ,
	TELEFONO             varchar(20)  NOT NULL ,
	TIPODOC              varchar(20)  NOT NULL ,
	GRADO                varchar(20)  NOT NULL ,
	SECCION              varchar(20)  NOT NULL ,
	FAMILIA              varchar(20)  NOT NULL ,
	ESTADOACADEMICO      varchar(20)  NOT NULL ,
	ESTADOALUMNO         varchar(20)  NOT NULL ,
	ESTADOMATRICULA      varchar(20)  NOT NULL ,
	CODFAMILIA           integer  NOT NULL ,
	CONSTRAINT XPKALUMNO PRIMARY KEY (CODALUMNO ASC),
	CONSTRAINT FK_ALUMNO_FAMILIA FOREIGN KEY (CODFAMILIA) REFERENCES FAMILIA(CODFAMILIA)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
)
go



CREATE TABLE CURSO
( 
	CODCURSO             integer  NOT NULL ,
	ABREVIATURA          integer  NOT NULL ,
	CONSTRAINT XPKCURSO PRIMARY KEY (CODCURSO ASC)
)
go



CREATE TABLE PROFESOR
( 
	CODPROFESOR          integer IDENTITY ( 1,1 ) ,
	NOMBRE               varchar(20)  NOT NULL ,
	APELLIDO             varchar(20)  NOT NULL ,
	TELEFONO             varchar(20)  NOT NULL ,
	CORREO               varchar(50)  NOT NULL ,
	TIPODOC              varchar(20)  NOT NULL ,
	CODCURSO             integer  NULL ,
	CONSTRAINT XPKPROFESOR PRIMARY KEY (CODPROFESOR ASC),
	CONSTRAINT FK_PROFESOR_CURSO FOREIGN KEY (CODCURSO) REFERENCES CURSO(CODCURSO)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
)
go



CREATE TABLE GRADO
( 
	CODGRADO             integer  NOT NULL ,
	CAPACIDAD            integer  NOT NULL ,
	CODPROFESOR          integer  NOT NULL ,
	CONSTRAINT XPKGRADO PRIMARY KEY (CODGRADO ASC),
	CONSTRAINT FK_GRADO_PROFESOR FOREIGN KEY (CODPROFESOR) REFERENCES PROFESOR(CODPROFESOR)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
)
go



CREATE TABLE ADMINISTRATIVO
( 
	CODADMIN             integer IDENTITY ( 1,1 ) ,
	NOMBRE               varchar(20)  NOT NULL ,
	APELLIDO             varchar(20)  NOT NULL ,
	CORREO               varchar(50)  NOT NULL ,
	TELEFONO             varchar(20)  NOT NULL ,
	TIPODOC              varchar(20)  NOT NULL ,
	CARGO                varchar(20)  NOT NULL ,
	CONSTRAINT XPKADMINISTRATIVO PRIMARY KEY (CODADMIN ASC)
)
go



CREATE TABLE MATRICULA
( 
	CODMATRICULA         integer IDENTITY ( 1,1 ) ,
	CODALUMNO            integer  NOT NULL ,
	CODCURSO             integer  NOT NULL ,
	CODADMIN             integer  NOT NULL ,
	CODGRADO             integer  NOT NULL ,
	FECHA                datetime  NOT NULL ,
	COSTOMATR            integer  NOT NULL ,
	ESTADOMATRICULA      varchar(20)  NOT NULL ,
	CONSTRAINT XPKMATRICULA PRIMARY KEY (CODMATRICULA ASC),
	CONSTRAINT FK_MATRICULA_ALUMNOS FOREIGN KEY (CODALUMNO) REFERENCES ALUMNO(CODALUMNO)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
CONSTRAINT FK_MATRICULA_CURSOS FOREIGN KEY (CODCURSO) REFERENCES CURSO(CODCURSO)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
CONSTRAINT FK_MATRICULA_ADMINISTRATIVOS FOREIGN KEY (CODADMIN) REFERENCES ADMINISTRATIVO(CODADMIN)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
CONSTRAINT FK_MATRICULA_GRADO FOREIGN KEY (CODGRADO) REFERENCES GRADO(CODGRADO)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
)
go



CREATE TABLE ASIGNACION
( 
	CODASIGNACION        integer IDENTITY ( 1,1 ) ,
	CODALUMNO            integer  NOT NULL ,
	CODGRADO             integer  NOT NULL ,
	CODMATRICULA         integer  NULL ,
	CONSTRAINT XPKASIGNACION PRIMARY KEY (CODASIGNACION ASC),
	CONSTRAINT FK_ALUMNO_ASIGNACION FOREIGN KEY (CODALUMNO) REFERENCES ALUMNO(CODALUMNO)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
CONSTRAINT FK_GRADO_ASIGNACION FOREIGN KEY (CODGRADO) REFERENCES GRADO(CODGRADO)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
CONSTRAINT FK_PROGRAMACION_ASIGNACION FOREIGN KEY (CODMATRICULA) REFERENCES MATRICULA(CODMATRICULA)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
)
go


