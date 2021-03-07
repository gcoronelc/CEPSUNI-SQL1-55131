
CREATE TABLE Algo
( 
	ID                   integer IDENTITY ( 1,1 ) ,
	FECHA                datetime  NOT NULL ,
	CONSTRAINT XPKAlgo PRIMARY KEY (ID ASC)
)
go

SET DATEFORMAT dmy;
GO

INSERT INTO ALGO(FECHA) VALUES('07/03/2021');
GO

SELECT * FROM Algo;
go

INSERT INTO ALGO(FECHA, fecha2) VALUES('20210308', '20210308');
GO

alter table algo 
add fecha2 date;
