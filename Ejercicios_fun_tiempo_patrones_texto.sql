/********************* Funciones de fecha *****************************/

/* 1La primera aparicion de Spiderman fue el 10 de agosto de 1962.¿Cuanto tiempo ha pasado desde
 entonces hasta el estreno de su pelicula mas reciente? */
--la mas reciente fue atraves del spiderverso el  1 de junio de 2023

SELECT AGE('2023-06-01','1962-08-10');

/* 2Analiza los meses en que se han vendido productos de la subcategoria de sillas. ¿Encuentras
algo interesante?*/

SELECT DISTINCT order_date, 
EXTRACT(month FROM order_date) AS "mes de orden",
COUNT(EXTRACT(month FROM order_date)) AS "sillas vendidas"
FROM sales
WHERE product_id LIKE 'FUR-CH%' --buscamos las sillas CHairs
GROUP BY order_date --agrupamos para poder usar count
ORDER BY "mes de orden" DESC; --pedimos que se ordene respecto al mes de manera descendiente

/** se puede observar que la mayor cantidad de sillas que se vende es en los meses de septiembre a enero
    Que corresponden a las estaciones de otoño, invierno, mientras que las ventas son mucho menores en
	primavera y verano **/


/********************* Patrones en textos *****************************/

/* 1Encuentra los clientes con dos nombres; cada nombre debe tener exactamente 5 caracteres 
y el segundo nombre debe iniciar con a,b,c o d */

SELECT * FROM customer
WHERE customer_name ~*'^[a-z]{5}\s(a|b|c|d)[a-z]+$'; --pedimos que inicie con mayus o minusc, con 
--caracteres de la a a la z y se repita 5 veces, un espacio y que la siguiente palabra inicie con 
--a,b,c o d y lo siguiente tenga de la a a la z y se repita 1 o mas veces

/* 2crea la siguiente tabla llamada zipcode 
   pinzip
   234432
   23345
   sdfe4
   123&3
   67424
   7895432
   12312
   
   Encuentra los valores que pertenecen realmente al codigo postal
   (5-6 caracteres numericos)*/
   
CREATE TABLE zipcode( --creamos tabla
); 
ALTER TABLE zipcode --ponemos el tipo de variable
ADD PIN_ZIP varchar;

SELECT * FROM zipcode;

INSERT INTO zipcode(pin_zip) --insetamos los datos en la columna
VALUES (234432),
('sdfe4'),
('123&3'),
(67424),
(7895432),
(12312); 

SELECT pin_zip FROM zipcode 
WHERE pin_zip ~*'^[0-9]{5,6}$';--buscamos los codigos postales