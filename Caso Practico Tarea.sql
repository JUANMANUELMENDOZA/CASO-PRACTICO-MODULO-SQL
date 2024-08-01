--Pasos a seguir--

/*a)Crear la base de datos con el archivo create_restaurant_db.sql*/

 create_restaurant_db.sql

/*b)Explorar la tabla “menu_items” para conocer los productos del menú*/

SELECT*FROM menu_items;	

--1.- Realizar consultas para contestar las siguientes preguntas:

/*Encontrar el número de artículos en el menú*/

SELECT COUNT (item_name)
FROM menu_items;

/*¿Cuál es el artículo menos caro y el más caro en el menú?*/

SELECT MIN (price),item_name
FROM menu_items
GROUP BY item_name
ORDER BY 1 ASC
LIMIT 1;


SELECT MAX (price),item_name
FROM menu_items
GROUP BY item_name
ORDER BY 1 DESC
LIMIT 1;


/*¿Cuántos platos americanos hay en el menú?*/

SELECT category
FROM menu_items
WHERE category = 'American';


/*¿Cuál es el precio promedio de los platos?*/

SELECT ROUND (AVG (price),2)
FROM menu_items;

/*c) Explorar la tabla “order_details” para conocer los datos que han sido recolectados*/ 

SELECT*FROM order_details;

--1.- Realizar consultas para contestar las siguientes preguntas:

/*¿Cuántos pedidos únicos se realizaron en total?*/

SELECT COUNT(DISTINCT order_id)
FROM order_details;

/*¿Cuáles son los 5 pedidos que tuvieron el mayor número de artículos?*/

SELECT COUNT (order_details_id), order_id
FROM order_details
GROUP BY order_id
ORDER BY 1 DESC
LIMIT 5;

/*¿Cuándo se realizó el primer pedido y el último pedido?*/

SELECT MIN (order_date), MAX (order_date)
FROM order_details;

/*¿Cuántos pedidos se hicieron entre el '2023-01-01' y el '2023-01-05'?*/

SELECT COUNT (order_details_id), order_date
FROM order_details
WHERE order_date <= '2023-01-05'
GROUP BY 2;

/*d) Usar ambas tablas para conocer la reacción de los clientes respecto al menú*/

/*1.- Realizar un left join entre order_details y menu_items con el identificador item_id(tabla order_details)
y menu_item_id(tabla menu_items)*/

SELECT order_details.item_id, menu_items.menu_item_id
FROM order_details
LEFT JOIN menu_items
ON order_details.item_id=menu_items.menu_item_id;

/*e) Una vez que hayas explorado los datos en las tablas correspondientes y respondido las preguntas planteadas, 
realiza un análisis adicional utilizando este join entre las tablas*/ 

/*El objetivo es identificar 5 puntos clave que puedan ser de utilidad para los dueños del restaurante en el 
lanzamiento de su nuevo menú. Para ello, crea tus propias consultas y utiliza los resultados obtenidos para llegar
a estas conclusiones*/

/*Realizar un left join entre order_details y menu_items con el identificador item_id(tabla order_details)
y menu_item_id(tabla menu_items), seleccionando más columnas para su análisis*/

SELECT order_details.item_id,
order_details.order_details_id,
order_details.order_id,
order_details.order_date,
menu_items.menu_item_id,
menu_items.item_name,
menu_items.category,
menu_items.price
FROM order_details
LEFT JOIN menu_items
ON order_details.item_id=menu_items.menu_item_id;

/* 1.-) Consultar total de pedidos de comida 'American'*/	

SELECT*FROM order_details JOIN menu_items ON order_details.item_id=menu_items.menu_item_id
WHERE category='American';

/* 2.-) Consultar total de pedidos de comida 'Asian'*/	

SELECT*FROM order_details JOIN menu_items ON order_details.item_id=menu_items.menu_item_id
WHERE category='Asian';

/* 3.-) Consultar total de pedidos de comida 'Mexican'*/	

SELECT*FROM order_details JOIN menu_items ON order_details.item_id=menu_items.menu_item_id
WHERE category='Mexican';

/* 4.-) Consultar total de pedidos de comida 'Italian'*/	
	
SELECT*FROM order_details JOIN menu_items ON order_details.item_id=menu_items.menu_item_id
WHERE category='Italian';

/* 5.-) Consultar total de productos vendidos de comida 'American'*/	

SELECT COUNT (order_details.order_id), menu_items.item_name
FROM order_details JOIN menu_items ON order_details.item_id=menu_items.menu_item_id
WHERE category='American' 
GROUP BY  menu_items.item_name
ORDER BY 1 DESC;

/* 6.-) Consultar total de productos vendidos de comida 'Asian'*/
	
SELECT COUNT (order_details.order_id), menu_items.item_name
FROM order_details JOIN menu_items ON order_details.item_id=menu_items.menu_item_id
WHERE category='Asian' 
GROUP BY  menu_items.item_name
ORDER BY 1 DESC;

/* 7.-) Consultar total de productos vendidos de comida 'Mexican'*/

SELECT COUNT (order_details.order_id), menu_items.item_name
FROM order_details JOIN menu_items ON order_details.item_id=menu_items.menu_item_id
WHERE category='Mexican' 
GROUP BY  menu_items.item_name
ORDER BY 1 DESC;

/* 8.-) Consultar total de productos vendidos de comida 'Italian'*/

SELECT COUNT (order_details.order_id), menu_items.item_name
FROM order_details JOIN menu_items ON order_details.item_id=menu_items.menu_item_id
WHERE category='Italian' 
GROUP BY  menu_items.item_name
ORDER BY 1 DESC;

/* 9.-) Consultar total de pedidos por fecha de comida 'American'*/

SELECT COUNT (order_details.order_id), order_details.order_date
FROM order_details JOIN menu_items ON order_details.item_id=menu_items.menu_item_id
WHERE category='American' 
GROUP BY  order_details.order_date
ORDER BY 2 ASC;

/* 10.-) Consultar total de pedidos por fecha de comida 'Asian'*/
	
SELECT COUNT (order_details.order_id), order_details.order_date
FROM order_details JOIN menu_items ON order_details.item_id=menu_items.menu_item_id
WHERE category='Asian' 
GROUP BY  order_details.order_date
ORDER BY 2 ASC;

/* 11.-) Consultar total de pedidos por fecha de comida 'Mexican'*/	
	
SELECT COUNT (order_details.order_id), order_details.order_date
FROM order_details JOIN menu_items ON order_details.item_id=menu_items.menu_item_id
WHERE category='Mexican' 
GROUP BY  order_details.order_date
ORDER BY 2 ASC;

/* 12.-) Consultar total de pedidos por fecha de comida 'Italian'*/
	
SELECT COUNT (order_details.order_id), order_details.order_date
FROM order_details JOIN menu_items ON order_details.item_id=menu_items.menu_item_id
WHERE category='Italian' 
GROUP BY  order_details.order_date
ORDER BY 2 ASC;

/* 13.-) Consultar total de ingresos obtenidos por productos de comida 'American'*/

SELECT SUM (menu_items.price), menu_items.item_name
FROM order_details JOIN menu_items ON order_details.item_id=menu_items.menu_item_id
WHERE category='American' 
GROUP BY  2
ORDER BY 1 DESC;

/* 14.-) Consultar total de ingresos obtenidos por productos de comida 'Asian'*/

SELECT SUM (menu_items.price), menu_items.item_name
FROM order_details JOIN menu_items ON order_details.item_id=menu_items.menu_item_id
WHERE category='Asian' 
GROUP BY  2
ORDER BY 1 DESC;

/* 15.-) Consultar total de ingresos obtenidos por productos de comida 'Mexican'*/

SELECT SUM (menu_items.price), menu_items.item_name
FROM order_details JOIN menu_items ON order_details.item_id=menu_items.menu_item_id
WHERE category='Mexican' 
GROUP BY  2
ORDER BY 1 DESC;

/* 16.-) Consultar total de ingresos obtenidos por productos de comida 'Italian'*/

SELECT SUM (menu_items.price), menu_items.item_name
FROM order_details JOIN menu_items ON order_details.item_id=menu_items.menu_item_id
WHERE category='Italian' 
GROUP BY  2
ORDER BY 1 DESC;

/* 17.-) Consultar total de ingresos obtenidos por productos de todas las categorias*/

SELECT SUM (menu_items.price), menu_items.item_name
FROM order_details JOIN menu_items ON order_details.item_id=menu_items.menu_item_id
GROUP BY  2
ORDER BY 1 DESC;

/* 18.-) Consultar total de ingresos obtenidos por categoria de comida 'American'*/

SELECT SUM (menu_items.price), category
FROM order_details JOIN menu_items ON order_details.item_id=menu_items.menu_item_id
WHERE category='American' 
GROUP BY 2
ORDER BY 1 DESC;

/* 19.-) Consultar total de ingresos obtenidos por categoria de comida 'Asian'*/

SELECT SUM (menu_items.price), category
FROM order_details JOIN menu_items ON order_details.item_id=menu_items.menu_item_id
WHERE category='Asian' 
GROUP BY 2
ORDER BY 1 DESC;

/* 20.-) Consultar total de ingresos obtenidos por categoria de comida 'Mexican'*/

SELECT SUM (menu_items.price), category
FROM order_details JOIN menu_items ON order_details.item_id=menu_items.menu_item_id
WHERE category='Mexican' 
GROUP BY 2
ORDER BY 1 DESC;

/* 21.-) Consultar total de ingresos obtenidos por categoria de comida 'Italian'*/

SELECT SUM (menu_items.price), category
FROM order_details JOIN menu_items ON order_details.item_id=menu_items.menu_item_id
WHERE category='Italian' 
GROUP BY 2
ORDER BY 1 DESC;










