#creazione tabella
CREATE TABLE customers_medium (
customer_id VARCHAR(20),
city VARCHAR(20),
signup_date VARCHAR(20)
);

#creazione tabella
CREATE TABLE menu_items(
item_id VARCHAR(20),
restaurant_id VARCHAR(20),
price DECIMAL(10, 2)
);

#creazione tabella
CREATE TABLE oder_items (
order_id VARCHAR(20),
item_id VARCHAR(20),
quantity INT,
price DECIMAL(10,2)
);

#creazione tabella
CREATE TABLE orders_medium (
order_id VARCHAR(20),
customer_id VARCHAR(20),
restaurant_id VARCHAR(20),
order_time VARCHAR(30),
delivery_time VARCHAR(30),
status VARCHAR(20)
);

#creazione tabella
CREATE TABLE restaurants (
restaurant_id VARCHAR(20),
cuisine VARCHAR(20),
city VARCHAR(100),
rating DECIMAL(10, 1)
);

#VERIFICA INTEGRITA' REFERENZIALE - non ci sono problematiche

#cerco i customer_id della tabella order_medium che non sono presenti in customer_medium
SELECT DISTINCT o.customer_id
FROM orders_medium o
LEFT JOIN customers_medium c ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;


#cerco i restaurant_id della tabella restaurant che non sono presenti in orders_medium
SELECT DISTINCT r.restaurant_id
FROM restaurants r 
LEFT JOIN orders_medium ON orders_medium.restaurant_id = r.restaurant_id 
WHERE orders_medium.restaurant_id IS NULL;

#cerco i restaurant_id della tabella menu_items che non sono presenti in restaurants
SELECT DISTINCT m.restaurant_id
FROM menu_items m
LEFT JOIN restaurants r
    ON m.restaurant_id = r.restaurant_id
WHERE r.restaurant_id IS NULL;

#cerco gli order_id della tabella order_items che non sono presenti in orders_medium
SELECT DISTINCT oi.order_id
FROM order_items oi
LEFT JOIN orders_medium o
    ON oi.order_id = o.order_id
WHERE o.order_id IS NULL;

#cerco gli item_id della tabella order_items che non sono presenti in menu_items
SELECT DISTINCT oi.item_id
FROM order_items oi
LEFT JOIN menu_items m
    ON oi.item_id = m.item_id
WHERE m.item_id IS NULL;
