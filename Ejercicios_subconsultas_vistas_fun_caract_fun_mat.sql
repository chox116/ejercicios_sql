/* Muestra todas las columnas de la tabla de ventas junto con el nombre del cliente que realizó 
   la compra, su edad, el nombre del producto que compró y la categoria del producto que compró
   Todo en la misma tabla(sug:utiliza JOIN como subconsulta)*/
--visalizamos donde estan los datos--
SELECT * FROM sales; --sales
SELECT * FROM customer;--customer_name,age
SELECT * FROM product; -- product_name, category

SELECT
s.*,
c.customer_name,
c.age,
p.product_name,
p.category
FROM sales AS s
 LEFT JOIN
  (SELECT customer_id,customer_name, age FROM customer
  GROUP BY customer_id,customer_name, age) AS c
 ON s.customer_id=c.customer_id 
LEFT JOIN product AS p
ON s.product_id=p.product_id;

/************************************ VISTAS **************************************/

/** Crea una vista que contenga los numeros de orden,identificador de producto,ventas y 
descuentos realizados en la fecha mas antigua de la tabla  ventas y llamala
'primer dia de trabajo' **/

SELECT * FROM sales; --order_id, product_id,sales,profit ordenados en la fecha mas antigua de order_date

CREATE VIEW "primer dia de trabajo" AS
SELECT
order_id,
product_id,
sales,
profit
FROM sales
ORDER BY ship_date ASC;

SELECT * FROM public."primer dia de trabajo";

DROP VIEW "primer dia de trabajo";


/************************ FUNCIONES DE CARACTER ************************/

/** 1¿Cual es el producto cuyo nombre tiene mas caracteres?Mostrar el resultado como una
    tabla de dos columnas donde la primera sea el nombre de ese(o esos productos en caso
	de haberlos) y el numero de caracteres **/
	
SELECT product_name, LENGTH(product_name) AS "numero de caracteres" FROM product;

/** 2 Muestra una consulta con las columnas nombre del producto, subcategoria y categoria
    y una columna extra donde aparezca la frase "el producto bla bla bla es de la subcategoria
	bla bla bla que pertenece a la categoria bla bla bla" **/

SELECT * FROM product;
SELECT 
product_name,
sub_category,
category,
product_id||'el producto '||product_name||'es de la subcategoria '||sub_category||'que pertenece a la categoria '||category
FROM product;	
	
/** 3Analiza como se forma el id de los productos. Muestra una consulta de cuatro columnas donde
    se indique el id de cada producto y las otras tres sean el desgloce del id en las tres 
	partes que lo forman **/
	
SELECT DISTINCT product_id,category, sub_category, LENGTH(product_name) FROM product;	--observamos que los 3 primeros carecteres son de su categoria
-- los dos siguientes son los dos primeros caracteres de subcategoria y los ultimos son numeros 

SELECT product_id, 
UPPER(SUBSTRING(category FOR 3)) AS categoria, 
UPPER(SUBSTRING(sub_category FOR 2)) AS subcategoria,
TRIM(BOTH UPPER(SUBSTRING(category FOR 3))||'-'||UPPER(SUBSTRING(sub_category FOR 2)) FROM product_id) AS numeros
FROM product;
	
/** 4 Muestra una tabla de dos filas y dos columnas: la primer columna tendrá los valores 
    Tables y Chairs; la segunda  columna serán los nombres de los productos de subcategoria 
	tables o charis separados por una coma.**/
	
SELECT DISTINCT sub_category, STRING_AGG(product_name,', ')
FROM product
WHERE (sub_category LIKE 'Chairs') OR
(sub_category LIKE 'Tables')
GROUP BY sub_category;


/************************ FUNCIONES MATEMATICAS ************************/

/** 1- vas a realizar una rifa entre tus clientes. Selecciona aleatoriamente a los 5 ganadores 
de tu tabla clientes utilizando la funcion random. **/
SELECT * FROM customer;

SELECT 
FLOOR(RANDOM()* COUNT(customer_id)) + 1
FROM customer;

/** 2-Supongamos que por alguna razon no puedes utilizar decimales en tu reporte de ventas.
Por ejemplo, si tienes una compra de 1.63, solo puedes mostrar un 1 o un 2 . En este escenario muestra 
una tabla con 3 columnas:
-la primera son las ventas si solo puedes redondear al entero más proximo que es 
menor que la venta real. Por ejemplo, las ventas de 1.63 y 23.48 se mostraran como 1 y 23.
-La segunda son las ventas si solo puedes redondear al entero más próximo que es mayor que la 
venta real. Por ejemplo, las ventas de 1.63 y 23.48 se mostrarian como 2 y 24
-La tercera son las ventas si solo puedes redondear al entero. Por ejemplo ventas 
1.63 y 23.48 se mostrarian como 2 y 23.**/

SELECT sales,FLOOR(sales),CEIL(sales), ROUND(sales) FROM sales;


/** 3¿Cuantó representan las ventas totales de las columnas de la tabla anterior? Muestra una
tabla con cuatro columnas y un renglon: la primer columna es el total de ventas de la primer 
columna de la tabla del inciso anterior; la segunda columna es el total de ventas de la segunda
columna de la tabla del inciso anterior; la tercer columna es el total de ventas de la tercer columna
de la tbla del inciso anterior; la cuarta columa es el total de ventas reales.
**/

SELECT 
SUM(FLOOR(sales)) AS "total ventas piso",
SUM(CEIL(sales)) AS "total ventas techo", 
SUM(ROUND(sales)) AS "total ventas proximo", 
SUM(sales) AS "total ventas reales"
FROM sales;