# Contexto

El restaurante "Sabores del Mundo", es conocido por su auténtica cocina y su ambiente acogedor.
Este restaurante lanzó un nuevo menú a principios de año y ha estado recopilando información detallada sobre las transacciones de los clientes para identificar áreas de oportunidad y aprovechar al máximo sus datos para optimizar las ventas.

## Objetivo

Identificar cuáles son los productos del menú que han tenido más éxito y cuales son los que menos han gustado a los clientes.

## Pasos a seguir

a) Crear la base de datos con el archivo create_restaurant_db.sql

create_restaurant_db.sql
 
b) Explorar la tabla “menu_items” para conocer los productos del menú.

SELECT*FROM menu_items;	

1.- Realizar consultas para contestar las siguientes preguntas:

● Encontrar el número de artículos en el menú.

SELECT COUNT (item_name)
FROM menu_items;

● ¿Cuál es el artículo menos caro y el más caro en el menú?

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

● ¿Cuántos platos americanos hay en el menú?

SELECT category
FROM menu_items
WHERE category = 'American';

● ¿Cuál es el precio promedio de los platos?

SELECT ROUND (AVG (price),2)
FROM menu_items;

c) Explorar la tabla “order_details” para conocer los datos que han sido recolectados. 

SELECT*FROM order_details;

1.- Realizar consultas para contestar las siguientes preguntas:

● ¿Cuántos pedidos únicos se realizaron en total?

SELECT COUNT(DISTINCT order_id)
FROM order_details;

● ¿Cuáles son los 5 pedidos que tuvieron el mayor número de artículos?

SELECT COUNT (order_details_id), order_id
FROM order_details
GROUP BY order_id
ORDER BY 1 DESC
LIMIT 5;

● ¿Cuándo se realizó el primer pedido y el último pedido?

SELECT MIN (order_date), MAX (order_date)
FROM order_details;

● ¿Cuántos pedidos se hicieron entre el '2023-01-01' y el '2023-01-05'?

SELECT COUNT (order_details_id), order_date
FROM order_details
WHERE order_date <= '2023-01-05'
GROUP BY 2;

d) Usar ambas tablas para conocer la reacción de los clientes respecto al menú.

1.- Realizar un left join entre entre order_details y menu_items con el identificador
item_id(tabla order_details) y menu_item_id(tabla menu_items).


SELECT order_details.item_id, menu_items.menu_item_id
FROM order_details
LEFT JOIN menu_items
ON order_details.item_id=menu_items.menu_item_id;


e) Una vez que hayas explorado los datos en las tablas correspondientes y respondido las preguntas planteadas, realiza un análisis adicional utilizando este join entre las tablas. El objetivo es identificar 5 puntos clave que puedan ser de utilidad para los dueños del restaurante en el lanzamiento de su nuevo menú. Para ello, crea tus propias consultas y utiliza los resultados obtenidos para llegar a estas conclusiones.

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

## Resultados



1.- Como resultado del análisis realizado a las variables PEDIDOS por CATEGORíA de comida, podemos observar lo siguiente: El comportamiento de los 12234 pedidos registrados en el periodo por cada una de las 4 categorías de comida se mantiene muy equilibrado en 3 de ellas y la comida Asian presenta valores más competitivos, rgistrando los siguientes valores.

a).- American  2734 pedidos con un 22.3%
b).- Asian 3470 pedidos con un 28.3%
c).- Mexican 2945 pedidos con un 24.0%
d).- Italian 2948 pedidos con un 24.1%

Ahora bien, si los PEDIDOS por CATEGORÍA los evaluamos por MES durante el periodo de análisis ENERO-MARZO, los resultados son los siguientes.
a).- American  enero 894, febrero 859 y marzo 981 pedidos.  Observamos una tendencia el último mes a la mejora.
b).- Asian enero 1186, febrero 1117 y marzo 1167 pedidos. Es la categoría estrella en pedidos, registra una ligera tendencia a la mejora el último mes.
c).- Mexican enero 1026, febrero 948 y marzo 971 pedidos. Se observa una tendencia a la baja en pedidos.
d).- Italian enero 998, febrero 927 y marzo 1023 pedidos. Es la categoría estrella en ventas y muestra una tendecia a la mejora del 10%  el mes de marzo  respecto a febrero.


2.- El resultado del análisis al contrastar PEDIDOS por PRODUCTO de comida, se observa lo siguiente. El comportamiento de los 12234 registrados en el periodo pedidos por cada uno de los        32 productos incluidos en el menu, registra datos interesantes.

a).- American:  Hamburger 622, Cheeseburger 583, French fries 571, Mac&Cheese 463, HotDog 257 y VeggieBurger 238.  
b).- Asian: Edamame 620, Korean Beef Bowl 588, Tofu Pad Tai 562 Orange Chicken 456, Pork Ramen 360, California Roll 355, Salmon Roll 324 y Poststickers 205.
c).- Mexican: Steak torta 489, Chip&salsa 461, Chicken Burrito 455, Chicken torta 379, Steak Burrito 354, Chips & Guacamole 237, Cheese quezadillas 233, Steak tacos 214 y Chicken tacos 123.
d).- Italian: Spaghetti & meatballs 470, Eggplant parmesan 420, Spaghetti 367, Chicken parmesan 364, Mushroom Ravioli 359, Meat Lasagna 273, Fetuccine Alfredo 249, Shrimp Scampi 239 y Cheese Lasagna 207.

Los 10 productos estrella en lo que respecta a pedidos, dicho de otra forma, los más solicitados son: Hamburger 622,  Edamame 620, Korean Beef Bowl 588, Cheeseburger 583, French fries 571, Tofu Pad Tai 562, Steak torta 489, Spaghetti & meatballs 470, Mac&Cheese 463 y Chip&salsa 461. Cabe mencionar que 10 de los 32 productos un 30%, representan el 45% del total de los pedidos. 


3.- Como resultado del análisis realizado a las variables VENTAS por CATEGORíA de comida, podemos observar lo siguiente: Se tiene registrado un ingreso total por concepto de ventas de      $159, 217.90, al estratificar por categoría de comida se obtuvieron los siguientes resultados.
a).- American  $28,237.75 con un 17.73% del total de ventas.
b).- Asian $46,720.65 con un 29.34% del total de ventas.
c).- Mexican $34,796. 80 con un 21.85% del total de ventas.
d).- Italian $49,462.70 con un 31.01% del total de ventas. 

Ahora bien, si las VENTAS por CATEGORÍA las evaluamos por MES durante el periodo de análisis ENERO-MARZO, los resultados son los siguientes.
a).- American  enero $9,284.85, febrero 8,947.15 y marzo 10,005.75 .  Observamos una tendencia el último mes a la mejora en un 11.8%.
b).- Asian enero $15,588.5, febrero $15,075.7 y marzo $16,056.45. Es la categoría estrella en pedidos, registra una ligera tendencia a la mejora el último mes.
c).- Mexican enero $12,215.88, febrero $11,222.45 y marzo $11,358.50. Se observa una tendencia a la mejora el último mes respecto a febrero..
d).- Italian enero $16,727.75, febrero $15,545.05 y marzo $17,189.90. Es la categoría estrella en ventas y muestra una tendecia a la mejora del 10.57%  el mes de marzo  respecto a febrero.


4.- El resultado del análisis al contrastar VENTAS por PRODUCTO de comida, se observa lo siguiente. El registro de los ingresos obtenidos por venta de los 32 productos de comida es por un total de $159,217.90. Ahora bien, distribuido por productos se tiene lo siguiente.

a).- American:  Hamburger $8,055, Cheeseburger $8,133, French fries $3,997, Mac&Cheese $3,241, HotDog $2,313 y VeggieBurger $2,499.  
b).- Asian: Edamame $3,100, Korean Beef Bowl $10,555, Tofu Pad Tai $8,149, Orange Chicken $7,524, Pork Ramen $6,462, California Roll $4,242, Salmon Roll $4,844 y Poststickers $1,845.
c).- Mexican: Steak torta $6,822, Chip&salsa $3,227, Chicken Burrito $5,892, Chicken torta $4,529, Steak Burrito $5,292, Chips & Guacamole $2,133, Cheese Quezadillas $2,447, Steak tacos $2,985 y Chicken tacos $1,470.
d).- Italian: Spaghetti & meatballs $8,436, Eggplant parmesan $7,119, Spaghetti $5,322, Chicken parmesan $6,534, Mushroom Ravioli $5,565, Meat Lasagna $4,900, Fetuccine Alfredo $3,611, Shrimp Scampi $4,768 y Cheese Lasagna $3,209.

Los 10 productos estrella en lo que respecta a ventas, dicho de otra forma, los más solicitados son: Korean Beef Bowl $10,555, Spaghetti & meatballs $8,436,  Tofu Pad Tai $8,149 ,  Cheeseburger $8,133,  Hamburger $8,055, Orange Chicken $7,524,   Eggplant parmesan $7,119,  Steak torta $6,822,  Chicken parmesan $6,534 y  Pork Ramen $6,462. Cabe mencionar que 10 de los 32 productos un 30%, representan el 50% del total de las ventas. 


5.- El resultado del análisis al contrastar VENTAS por PRODUCTO de comida, se observa lo siguiente. El registro de los ingresos obtenidos por venta de los 32 productos de comida es por un total de $159,217.90. Ahora bien, distribuido por productos durante el periodo enero-marzo, se tiene lo siguiente.
Si evaluamos el comportamiento durante el periodo mencionado, de los 10 mejores y los 10 inferiores productos, obtenemos los siguientes resultados:

a).- No se observan incrementos o decrementos en las ventas que sean cuánticos, hasta cierto punto hay estabilidad. Ahora bien, si debemos destacar a los platillos Asian, Korean Beef Bowl que presenta un incremento del 9% en ventas comparando marzo a febrero, de igual forma en la categoria de Asian, el Orange Chicken registra un incremento en las ventas del 15% comparando marzo a febrero y por último en la misma categoría el Tofu Pad Thai presenta un incremento en las ventas del 15% comparando marzo a febrero.

b).- Destaca que hay 4 productos con bajo nivel de ingresos por ventas, que son incluidos en los 10 mejores pedidos, esto se explica que se consideran complementos de platillos principales.

c).- Esta puede ser una estratégia que se puede fortalecer, integrar combos con platillos que son demandados y representan un ingreso importante en las ventas,  y anexar productos que no representan actualmente ingresos fuertes en ventas, pero se tienen identificados en el buen gusto de los clientes.

d).- Existe un portafolio bien diversificado de clientes, un segmento enfocado en platillos más gourmet (Italian y Asian) que representan un ingreso importante en ventas. Asimismo, segmentos de clientes enfocados en platillos populares de bajo y medio costo que se encuentran en las categorías de comidas (american y Mexican).





