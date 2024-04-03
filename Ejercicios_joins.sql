/**1 Se busca asignar presupuesto de marketing a diferentes regiones. Mostrar las ventas totales
    por region **/
	
--visualicemos donde están ventas y region--
SELECT * FROM sales; --ventas
SELECT * FROM customer; --region--
SELECT * FROM product;
--Como tenemos mas datos en ventas, puede suceder que no esten registrados en region, es decir 
-- no tendran region para mostrar, por lo que podemos hacer es usar right join en ventas e insertar
--customer
SELECT DISTINCT a.region,
SUM(b.sales) AS "Ventas por region"
FROM customer AS a
LEFT JOIN sales AS b
ON a.customer_id=b.customer_id
GROUP BY a.region;



/**2 Muestra una tabla que contenga cada identificador de producto, nombre del producto, categoria 
    ventas totales de ese producto y total de articulos vendiso de ese producto  **/
--product_id,product_name, category de product
--sales y quantity de sales
SELECT DISTINCT p.product_id,
p.product_name,
p.category,
SUM(s.sales) AS "ventas totales",
COUNT(s.quantity) AS "total articulos vendidos"
FROM product AS p
LEFT JOIN sales AS s
ON p.product_id=s.product_id
GROUP BY p.product_id;

/**3 Cuando quieres obtener unicamente aquellas filas que estan en las dos tablas¿que clase 
   de Join debes usar?
   a) Left
   b) Right
   c) Full Outer
   d) Inner  se utiliza inner debido a que queremos que las filas esten en las dos tablas,
   es decir la interseccion de las dos tablas **/