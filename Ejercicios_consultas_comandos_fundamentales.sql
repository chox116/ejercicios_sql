/*1a)Crea una base de datos llamada "salón de clases"*/
CREATE DATABASE Salón_de_clases;
/**1b) Crea una tabla llamada clase ciencias con 3 columnas: # de lista,nombre, calificación 
y deduce el tipo de datos que se requiere**/
CREATE TABLE clase_ciencias(
Num_lista INT PRIMARY KEY, /* buscamos que el # lista sea el identificador de cada registro*/
nombre CHAR(20), /* tipo de archivo de caracteres*/
calificacion INT NOT NULL /* como si o si debe haber calificaciones pedimos que sea no nulo y tipo entero*/
);
/*******************************************************************************************/
/************************ 2 Insertar e importar datos **************************************/
/*******************************************************************************************/

/** Cambiamos el tamaño de los caracteres aceptados**/
ALTER TABLE clase_ciencias
ALTER COLUMN nombre TYPE CHAR(20);

/** a) Insertar los siguientes registros 1-popeye-33, 2-Olivia-54, 3-Brutus-98**/
INSERT INTO clase_ciencias
VALUES (1,'Popeye',33), (2,'Olivia',54), (3,'Brutus', 98);

/**** Importa la tabla estudiantes.csv y ponla en la tabla clase_ciencias****/
COPY clase_ciencias(Num_lista, nombre, calificacion) FROM 'C:\Users\Public\Documents\data_sql\estudiantes.csv'
DELIMITER ',' CSV HEADER; /*HEADER indica que el archivo tiene titulo y se va a ignorar*/


/*******************************************************************************************/
/************************** 3 SELECT WHERE *************************************************/
/*******************************************************************************************/

/********* a) Muestra todos los registros de la tabla ************/

SELECT * FROM clase_ciencias;

/********* b) Muestra los nombres de los alumnos con calificación >60 ************/
SELECT nombre FROM clase_ciencias WHERE calificacion>60;
/********* c) muestra toda la informacion de los alumnos con calificacion mayor a 35 y menor a 60
************/
SELECT * FROM clase_ciencias WHERE calificacion>35 AND calificacion<60; 
/********* d) muestra toda la informacion de los alumnos que no cumplen con el criterio anterior
************/
SELECT * FROM clase_ciencias WHERE NOT(calificacion>35 AND calificacion<60); 

/*******************************************************************************************/
/************************** 4 Actualizacion de una tabla ***********************************/
/*******************************************************************************************/

/**** Cambia la calificacion de popeye a 45 *****/
UPDATE clase_ciencias SET calificacion=45 WHERE num_lista=1;

/** Borra el registro de RAUL **/
SELECT num_lista FROM clase_ciencias WHERE nombre='Raul';

DELETE FROM clase_ciencias WHERE num_lista=8;
/* o podria ser*/
DELETE FROM clase_ciencias WHERE nombre='Raul';

/**** 4)Cambia el nombre de de la columna donde estan los nombres de
estudiantes a estudiantes****/

ALTER TABLE clase_ciencias RENAME COLUMN nombre TO estudiantes;

SELECT * FROM clase_ciencias;