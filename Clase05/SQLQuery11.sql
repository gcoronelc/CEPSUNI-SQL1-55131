-- OUTER JOIN
/*

	<tablaLeft> {LEFT|RIGHT|FULL} [OUTER] JOIN <tablaRight> 
	ON < Ccondicion> 

	LEFT: Filas que se combinas + filas de <tablaLeft> que no se combinan.

	RIGHT: Filas que se combinas + filas de <tablaRight> que no se combinan.

	FULL: Filas que se combinas + filas de <tablaLeft> que no se combinan
								+ filas de <tablaRight> que no se combinan.

*/

-- TABLA DE HOMBRES

CREATE TABLE HOMBRE(
ID INTEGER PRIMARY KEY,
NOMBRE VARCHAR(30),
COLOR VARCHAR(15)
);
GO

INSERT INTO HOMBRE VALUES(1,'JORGE','MOSTAZA');
INSERT INTO HOMBRE VALUES(2,'PEDRO','MARRON');
INSERT INTO HOMBRE VALUES(3,'MANUEL','MOSTAZA');
INSERT INTO HOMBRE VALUES(4,'RICARDO','ROSA');
INSERT INTO HOMBRE VALUES(5,'JUAN','MOSTAZA');
INSERT INTO HOMBRE VALUES(6,'ARTURO','CELESTE');
INSERT INTO HOMBRE VALUES(7,'BORIS','AMARILLO');
GO

SELECT * FROM HOMBRE;
GO

-- TABLA DE MUJERES

CREATE TABLE MUJER(
ID INTEGER PRIMARY KEY,
NOMBRE VARCHAR(30),
COLOR VARCHAR(15)
);
GO

INSERT INTO MUJER VALUES(1,'CLAUDIA','NARANJA');
INSERT INTO MUJER VALUES(2,'KARLA','ROSA');
INSERT INTO MUJER VALUES(3,'DANIELA','NARANJA');
INSERT INTO MUJER VALUES(4,'DORIS','CELESTE');
INSERT INTO MUJER VALUES(5,'ALEJANDRA','AMARILLO');
INSERT INTO MUJER VALUES(6,'JIMENA','MARRON');
INSERT INTO MUJER VALUES(7,'THALIA','NARANJA');
GO

SELECT * FROM MUJER;
GO

-- INNER JOIN

SELECT * 
FROM HOMBRE H
JOIN MUJER M ON H.COLOR = M.COLOR;
GO

/*
ID          NOMBRE        COLOR           ID          NOMBRE         COLOR
----------- ------------- --------------- ----------- -------------- ---------------
4           RICARDO       ROSA            2           KARLA          ROSA
6           ARTURO        CELESTE         4           DORIS          CELESTE
7           BORIS         AMARILLO        5           ALEJANDRA      AMARILLO
2           PEDRO         MARRON          6           JIMENA         MARRON

(4 rows affected)
*/


-- LEFT OUTER JOIN

SELECT * 
FROM HOMBRE H
LEFT JOIN MUJER M ON H.COLOR = M.COLOR
ORDER BY 4 DESC;
GO

/*
ID          NOMBRE       COLOR           ID          NOMBRE         COLOR
----------- ------------ --------------- ----------- -------------- ---------------
2           PEDRO        MARRON          6           JIMENA         MARRON
7           BORIS        AMARILLO        5           ALEJANDRA      AMARILLO
6           ARTURO       CELESTE         4           DORIS          CELESTE
4           RICARDO      ROSA            2           KARLA          ROSA
5           JUAN         MOSTAZA         NULL        NULL           NULL
3           MANUEL       MOSTAZA         NULL        NULL           NULL
1           JORGE        MOSTAZA         NULL        NULL           NULL

(7 rows affected)
*/


-- RIGHT OUTER JOIN

SELECT * 
FROM HOMBRE H
RIGHT JOIN MUJER M ON H.COLOR = M.COLOR
ORDER BY 1 DESC;
GO

/*
ID          NOMBRE        COLOR           ID          NOMBRE         COLOR
----------- ------------- --------------- ----------- -------------- ---------------
7           BORIS         AMARILLO        5           ALEJANDRA      AMARILLO
6           ARTURO        CELESTE         4           DORIS          CELESTE
4           RICARDO       ROSA            2           KARLA          ROSA
2           PEDRO         MARRON          6           JIMENA         MARRON
NULL        NULL          NULL            7           THALIA         NARANJA
NULL        NULL          NULL            3           DANIELA        NARANJA
NULL        NULL          NULL            1           CLAUDIA        NARANJA

(7 rows affected)
*/



-- FULL OUTER JOIN

SELECT * 
FROM HOMBRE H
FULL JOIN MUJER M ON H.COLOR = M.COLOR
ORDER BY 1 DESC;
GO

/*
ID          NOMBRE         COLOR           ID          NOMBRE        COLOR
----------- -------------- --------------- ----------- ------------- ---------------
7           BORIS          AMARILLO        5           ALEJANDRA     AMARILLO
6           ARTURO         CELESTE         4           DORIS         CELESTE
4           RICARDO        ROSA            2           KARLA         ROSA
2           PEDRO          MARRON          6           JIMENA        MARRON
NULL        NULL           NULL            1           CLAUDIA       NARANJA
NULL        NULL           NULL            3           DANIELA       NARANJA
NULL        NULL           NULL            7           THALIA        NARANJA
5           JUAN           MOSTAZA         NULL        NULL          NULL
3           MANUEL         MOSTAZA         NULL        NULL          NULL
1           JORGE          MOSTAZA         NULL        NULL          NULL

(10 rows affected)

*/


-- Que pasa si se inserta este regustro?

INSERT INTO HOMBRE VALUES(8,'ANGEL','NARANJA');
go

SELECT * 
FROM HOMBRE H
JOIN MUJER M ON H.COLOR = M.COLOR
ORDER BY 1;
GO

SELECT * 
FROM HOMBRE H
RIGHT JOIN MUJER M ON H.COLOR = M.COLOR
ORDER BY 1 DESC;
GO

-- Ejercicio 9
-- De Nina Valladares Marccelo para todos:  03:20 PM
SELECT D.iddepartamento, D.nombre, COUNT(E.idempleado) [CANTIDAD]FROM RH.dbo.departamento D	LEFT JOIN RH.dbo.empleado E ON(E.iddepartamento=D.iddepartamento)GROUP BY D.iddepartamento, D.nombre;
GO

-- CROSS JOIN
-- Tambien se conoce como producto cartesiano

SELECT * 
FROM HOMBRE H CROSS JOIN MUJER M 
ORDER BY 1 DESC;
GO



-- Ejercicio 10
-- De Nina Valladares Marccelo para todos:  03:29 PM

SELECT D.nombre,C.nombreFROM RH.dbo.departamento DCROSS JOIN RH.dbo.cargo C;
GO




SELECT * FROM RH..empleado;
GO


SELECT e.nombre empleado, j.nombre jefe
FROM RH..empleado E
JOIN RH..empleado J ON E.jefe = J.idempleado;
GO

