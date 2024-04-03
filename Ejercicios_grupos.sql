/** de la base de datos supermercado, muestra una tabla que contenga la siguiente información:
   para cada producto distinto, debe mostrar cuanto dinero nos ha ingresado por ventas de él(
   ojo: no las ganancias); el total de productos vendidos de ese tipo; en cuantas órdenes se han 
   realizado sus ventas; cuantó fue la entrada maxima  de dinero de ese producto, cuanto fue la
   entrada minima de dinero de ese producto y cuanto fue el promedio de dinero que entró por ese
   producto. La tabla debe estar ordenada de manera descendente por total de dinero que nos ha 
   ingresado por ventas **/
 --primero visualizamos la base de datos--
SELECT * FROM sales;
--realizamos el ejercicio--
SELECT DISTINCT product_id, 
SUM(sales) AS "ventas por producto", 
count(product_id) AS "ordenes realizadas", 
max(sales) AS "maximo venta", 
min(sales) AS "minim venta"
FROM sales 
GROUP BY product_id
ORDER BY SUM(sales) DESC;

/** 2 Muestra los ids de los productos donde la cantidad de vendidos sea al menos 10.**/

SELECT DISTINCT product_id,
COUNT(product_id) AS "productos vendidos"
FROM sales
GROUP BY product_id
HAVING COUNT(product_id)<10;

/* 3 supongamos que tienes tabla estudiantes con las columnas codigo_estudiante, nombres,
   apellidos, correo, celular, fecha_nacimiento, materia y calificación. 
   
   Toma en cuenta que entonces un mismo alumno ppuede aparecer en varios renglones (pues
   pudo haber inscrito varias materias). Se define el promedio final de cada alumno como el 
   promedio de sus calificaciones mayores a 5(por ejemplo, si juan tiene 7 en matematicas, 
   5 en ingles y 8 en literatura, entonces su promedio final es (7+8)/2, que es el promedio
   de las calificaciones que aprobo)
   ¿Que codigo utilizarias para calcular el promedio final de cada joven?  */
   
SELECT DISTINCT codigo_estudiante,
calificacion,
materia,
SUM(calificacion)/COUNT(materia) AS "promedio_final"
FROM tabla_estudiantes
GROUP BY codigo_estudiante
HAVING calificacion >5;

--- probemos con base datos estudiantes--
CREATE TABLE estudiantes(
codigo_estudiante int PRIMARY KEY,
nombre VARCHAR,
calif int);

COPY estudiantes(codigo_estudiante,nombre,calif)
FROM 'C:\Users\Public\Documents\data_sql\estudiantes.csv'
DELIMITER ',' CSV HEADER;

SELECT * FROM estudiantes;

SELECT DISTINCT codigo_estudiante,-- observamos que si funcionò--
calif,
SUM(calif)/COUNT(calif) AS "promedio_final"
FROM estudiantes
GROUP BY codigo_estudiante
HAVING calif >=60;

DELETE FROM estudiantes; --borramos los datos de la tabla y luego borramos tabla--
