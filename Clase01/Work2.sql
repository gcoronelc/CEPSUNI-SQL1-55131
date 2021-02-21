

CREATE DATABASE BD_DOMINGO;
GO


USE BD_DOMINGO;
GO


CREATE TABLE DEMO(
ID INT NOT NULL IDENTITY,
DATO VARCHAR(100)
);
GO


INSERT INTO DEMO(DATO) VALUES
( 'Dato 1' ),
( 'Dato 2' ),
( 'Dato 3' ),
( 'Dato 4' ),
( 'Dato 5' );

select * from demo;
go
