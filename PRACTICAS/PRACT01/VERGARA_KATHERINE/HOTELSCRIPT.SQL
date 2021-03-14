

-- =============================================
-- Creación de la Base de Datos
-- =============================================

USE master;
go

IF( EXISTS ( SELECT name FROM master.sys.databases WHERE name = 'HOTEL' ) )
BEGIN
	DROP DATABASE HOTEL;
END;
go

CREATE DATABASE HOTEL;
go


-- =============================================
-- Creció la Base de Datos
-- =============================================

use HOTEL;
go



------------------------------------------------------
CREATE TABLE RECEPCIONISTA
( 
	IDRECEPCIONISTA      integer IDENTITY ( 1,1 ) ,
	NOMBRESREP           varchar(100)  NOT NULL ,
	APELLIDOREP          varchar(100)  NOT NULL ,
	TURNO                varchar(20)  NOT NULL ,
	FECHACONTRATACION    datetime  NOT NULL ,
	TELEFONO             integer  NOT NULL ,
	 PRIMARY KEY (IDRECEPCIONISTA ASC)
)
go

------------------------------------------------------

CREATE TABLE TIPO_HABITACION
( 
	IDTIPOHAB            integer  NOT NULL ,
	TIPO_HAB             varchar(20)  NOT NULL ,
	CANTIDAD             integer  NOT NULL ,
	PRECIO               integer  NOT NULL ,
	 PRIMARY KEY (IDTIPOHAB ASC)
)
go

ALTER TABLE HOTEL..TIPO_HABITACION
ADD CONSTRAINT CK_TIPO_HABITACION_CANTIDAD
CHECK (CANTIDAD > 0 AND CANTIDAD<7);
GO
----------------------------------------------


CREATE TABLE HABITACION
( 
	IDHABITACION         integer IDENTITY ( 1,1 ) ,
	ESTADO               varchar(20)  NOT NULL ,
	IDTIPOHAB            integer  NULL ,
	 PRIMARY KEY (IDHABITACION ASC),
	 FOREIGN KEY (IDTIPOHAB) REFERENCES TIPO_HABITACION(IDTIPOHAB)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
)
go


------------------------------------------------------

CREATE TABLE SERVICIO
( 
	IDSERVICIO           integer  NOT NULL ,
	TIPO                 varchar(50)  NOT NULL ,
	ESTADO               varchar(20)  NOT NULL ,
	AFORO                integer  NOT NULL ,
	 PRIMARY KEY (IDSERVICIO ASC)
)
go

ALTER TABLE HOTEL..SERVICIO
ADD CONSTRAINT CK_SERVICIO_AFORO
CHECK (AFORO>0 AND AFORO < 10);
GO
------------------------------------------------------

CREATE TABLE RESERVA
( 
	IDRESERVA            integer  NOT NULL ,
	ENTRADA              datetime  NOT NULL ,
	SALIDA               datetime  NOT NULL ,
	CANTIDAD             integer  NOT NULL ,
	DESCRIPCION          varchar(100)  NULL ,
	IDRECEPCIONISTA      integer  NOT NULL ,
	IDHABITACION         integer  NOT NULL ,
	IDSERVICIO           integer  NOT NULL ,
	 PRIMARY KEY (IDRESERVA ASC),
	 FOREIGN KEY (IDRECEPCIONISTA) REFERENCES RECEPCIONISTA(IDRECEPCIONISTA)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
 FOREIGN KEY (IDHABITACION) REFERENCES HABITACION(IDHABITACION)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
 FOREIGN KEY (IDSERVICIO) REFERENCES SERVICIO(IDSERVICIO)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
)
go

ALTER TABLE HOTEL..RESERVA
ADD CONSTRAINT CK_RESERVA_CANTIDAD
CHECK (CANTIDAD>0 AND CANTIDAD < 6);
GO

------------------------------------------------------

CREATE TABLE CLIENTE
( 
	IDCLIENTE            integer IDENTITY ( 1,1 ) ,
	NOMBRECLI            varchar(100)  NOT NULL ,
	APELLIDOSCLI         varchar(100)  NOT NULL ,
	DNI                  varchar(8)  NOT NULL ,
	PROCEDENCIA          varchar(50)  NOT NULL ,
	ESTADO_SALUD         varchar(20)  NOT NULL ,
	 PRIMARY KEY (IDCLIENTE ASC)
)
go


------------------------------------------------------

CREATE TABLE ALQUILER
( 
	IDALQUILER           integer  NOT NULL ,
	FECHA_ENTRADA        datetime  NOT NULL ,
	FECHA_SALIDA         datetime  NOT NULL ,
	IDRESERVA            integer  NOT NULL ,
	IDCLIENTE            integer  NOT NULL ,
	 PRIMARY KEY (IDALQUILER ASC),
	 FOREIGN KEY (IDRESERVA) REFERENCES RESERVA(IDRESERVA)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
 FOREIGN KEY (IDCLIENTE) REFERENCES CLIENTE(IDCLIENTE)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
)
go


------------------------------------------------------

CREATE TABLE GERENTE
( 
	IDGERENTE            integer IDENTITY ( 1,1 ) ,
	NOMBREGER            varchar(100)  NOT NULL ,
	APELLIDOGER          varchar(100)  NOT NULL ,
	TELEFONO             integer  NOT NULL ,
	IDRECEPCIONISTA      integer  NULL ,
	 PRIMARY KEY (IDGERENTE ASC),
	 FOREIGN KEY (IDRECEPCIONISTA) REFERENCES RECEPCIONISTA(IDRECEPCIONISTA)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
)
go

----------------------------------------------------------------

----------------------RECEPCIONISTA-----------------------------
SET IDENTITY_INSERT HOTEL..RECEPCIONISTA ON;

INSERT INTO HOTEL..RECEPCIONISTA(IDRECEPCIONISTA,NOMBRESREP,APELLIDOREP,TURNO,FECHACONTRATACION,TELEFONO) VALUES
('01','PAMELA','MELENDEZ','MAÑANA' , '12/30/2020' , '999000999'),
('02','PATRICIA','VERGARA','TARDE' , '12/20/2020' , '999000777');

SET IDENTITY_INSERT HOTEL..RECEPCIONISTA OFF;

SELECT * FROM RECEPCIONISTA;
-----------------------------------------------------------------
----------------------TIPO_HABITACION----------------------------
INSERT INTO HOTEL..TIPO_HABITACION(IDTIPOHAB,TIPO_HAB,CANTIDAD,PRECIO) VALUES

('01','INDIVIDUAL','4','80'),
('02','MATRIMONIAL','1','200'),
('03','TRIPLE','1','100');

SELECT * FROM TIPO_HABITACION;
---------------------------------------------------------------
----------------------HABITACION-----------------------------
SET IDENTITY_INSERT HOTEL..HABITACION ON;

INSERT INTO HOTEL..HABITACION(IDHABITACION,ESTADO,IDTIPOHAB) VALUES
('01','OCUPADO','01'),
('02','DESOCUPADO','02'),
('03','DESOCUPADO','03'),
('04','DESOCUPADO','02'),
('05','DESOCUPADO','03'),
('06','OCUPADO','01');

SET IDENTITY_INSERT HOTEL..HABITACION OFF;

SELECT * FROM HABITACION;
-----------------------------------------------------------------
----------------------SERVICIO----------------------------
INSERT INTO HOTEL..SERVICIO(IDSERVICIO,TIPO,ESTADO,AFORO) VALUES

('01','BAR','DISPONIBLE','5'),
('02','RESTAURANT','NO DISPONIBLE','5');

SELECT * FROM SERVICIO;
---------------------------------------------------------------
----------------------RESERVA-----------------------------
INSERT INTO HOTEL..RESERVA(IDRESERVA,ENTRADA,SALIDA,CANTIDAD,DESCRIPCION,IDRECEPCIONISTA,IDHABITACION,IDSERVICIO) VALUES
('01','03/02/2021','03/12/2021','1','TURISMO','01','01','01'),
('02','03/12/2021','03/30/2021','2','TURISMO','02','01','02');

SELECT * FROM RESERVA;
---------------------------------------------------------------
----------------------CLIENTE-----------------------------
SET IDENTITY_INSERT HOTEL..CLIENTE ON;

INSERT INTO HOTEL..CLIENTE(IDCLIENTE,NOMBRECLI,APELLIDOSCLI,DNI,PROCEDENCIA,ESTADO_SALUD) VALUES
('01','ARLET','LAZARO','11223344','LIMA','CORRECTO'),
('02','PEDRO','LUGO','22223355','COLOMBIA','CORRECTO'),
('03','PAOLA','ALEGRE','77220044','LIMA','CORRECTO');

SET IDENTITY_INSERT HOTEL..CLIENTE OFF;

SELECT * FROM CLIENTE;
-----------------------------------------------------------------
----------------------ALQUILER-----------------------------
INSERT INTO HOTEL..ALQUILER(IDALQUILER,FECHA_ENTRADA,FECHA_SALIDA,IDRESERVA,IDCLIENTE) VALUES
('01','03/02/2021','03/12/2021','01','01'),
('02','03/12/2021','03/30/2021','02','02');

SELECT * FROM ALQUILER;
---------------------------------------------------------------
----------------------GERENTE-----------------------------
SET IDENTITY_INSERT HOTEL..GERENTE ON;

INSERT INTO HOTEL..GERENTE(IDGERENTE,NOMBREGER,APELLIDOGER,TELEFONO,IDRECEPCIONISTA) VALUES
('01','KATHERINE','VERGARA MELENDEZ','999777544',01),
('02','PAMELA','MELENDEZ','888666555', 02);

SET IDENTITY_INSERT HOTEL..GERENTE OFF;

SELECT * FROM GERENTE;
---------------------------------------------------------------