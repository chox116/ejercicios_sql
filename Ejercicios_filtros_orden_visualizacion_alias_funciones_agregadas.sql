/**********************************************************************/
/******************************** FILTROS *****************************/
/**********************************************************************/

/******************** 1 encuentra lo siguiente ****************************/
/************* a)la lista de todas las ciudades cuya region es norte u oeste y 
presentarla sin duplicados ********************/

SELECT DISTINCT region FROM customer;/*consultamos los datos unicos de region*/
SELECT DISTINCT city FROM customer WHERE region in ('North', 'West');

/************* b)la lista de todos los numeros de pedido donde el ingreso fue entre 100 y 500 
*****************/

SELECT * FROM sales;
SELECT quantity FROM sales WHERE sales BETWEEN 100 AND 500;

/************* La lista de todos los clientes cuyo último nombre tiene exactamente 
cuatro caracteres.********************/
SELECT customer_name FROM customer
WHERE customer_name LIKE '%____';

/**********************************************************************/
/******************************** Orden Visualizacion y alias *****************************/
/**********************************************************************/

/***** 1a) encuentra la lista de todos los pedidos donde se realizo algun descuento ordenadas 
en forma descendiente respecto al descuento    ***/
SELECT product_id FROM sales WHERE NOT discount= 0
ORDER BY discount DESC;

/** Muestra los 10 primeros resultados de la consulta anterior **/
SELECT product_id FROM sales WHERE NOT discount=0
ORDER BY discount DESC LIMIT 10;

/**********************************************************************/
/******************************** Funciones agregadas *****************************/
/**********************************************************************/

/** Encuentra a) el total de ingresos que hubo **/
SELECT SUM(sales) FROM sales AS "total de ingresos";

/** b)Cuantos clientes en la zona centro tienen edad entre 20 y 30 años, inclusive? **/
SELECT COUNT(customer_id) FROM customer WHERE age>19 AND age<31 AND region='Central';

/** c)Cual es la edad promedio de los clientes de la zona este **/
SELECT AVG(age) FROM customer WHERE region='East';

/** Cuales son la edad minima y maxima de los clientes de la ciudad de philadelphia **/
SELECT MIN(age) FROM customer WHERE city='Philadelphia';
SELECT MAX(age) FROM customer WHERE city='Philadelphia';