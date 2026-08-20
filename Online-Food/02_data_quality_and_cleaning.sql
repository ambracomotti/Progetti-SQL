#CONTROLLO CHIAVI PRIMARIE (DOPPIO CHECK SE SONO NULLE + DUPLICATI)

SELECT restaurant_id, COUNT(*) as nr_restaurant
FROM restaurants
GROUP BY restaurant_id
#HAVING COUNT(*) > 1

SELECT order_id, COUNT(*) as nr_order
FROM orders_medium
GROUP BY order_id
#HAVING COUNT(*) > 1

SELECT item_id, COUNT(*) as nr_item
FROM menu_items
GROUP BY item_id
#HAVING COUNT(*) > 1

SELECT customer_id, COUNT(*) as nr_customer
FROM customers_medium
GROUP BY customer_id
#HAVING COUNT(*) > 1

SELECT order_id, item_id, COUNT(*) as nr_items
FROM order_items
GROUP BY order_id, item_id 
HAVING COUNT(*) > 1

#per ogni chiave c'è una sola riga

#AGGIUNGO CHIAVI PRIMARIE
SELECT restaurant_id
FROM restaurants r
WHERE restaurant_id IS NULL

SELECT item_id
FROM menu_items
WHERE item_id IS NULL

SELECT customer_id
FROM customers_medium
WHERE customer_id IS NULL

SELECT order_id
FROM orders_medium
WHERE order_id IS NULL

SELECT order_id, item_id
FROM order_items
WHERE order_id IS NULL
   OR item_id IS NULL;

#INSERIMENTO CHIAVI PRIMARIE
ALTER TABLE customers_medium
ADD PRIMARY KEY (customer_id);

ALTER TABLE order_items
ADD PRIMARY KEY (order_id, item_id);

ALTER TABLE orders_medium
ADD PRIMARY KEY (order_id);

ALTER TABLE menu_items
ADD PRIMARY KEY (item_id);

ALTER TABLE restaurants
ADD PRIMARY KEY (restaurant_id);

#AGGIUNGO CHIAVI ESTERNE
ALTER TABLE orders_medium
ADD CONSTRAINT fk_order_customer
FOREIGN KEY (customer_id)
REFERENCES customers_medium(customer_id);

ALTER TABLE menu_items
ADD CONSTRAINT fk_menu_restaurant
FOREIGN KEY (restaurant_id)
REFERENCES restaurants(restaurant_id);

ALTER TABLE orders_medium
ADD CONSTRAINT fk_orders_restaurant
FOREIGN KEY (restaurant_id)
REFERENCES restaurants(restaurant_id);

ALTER TABLE order_items
ADD CONSTRAINT fk_item_order
FOREIGN KEY (order_id)
REFERENCES orders_medium(order_id);

ALTER TABLE order_items
ADD CONSTRAINT fk_orderitem_item
FOREIGN KEY (item_id)
REFERENCES menu_items(item_id);

#controllo se esistono eventuali valori nulli - non ci sono
SELECT *
FROM customers_medium
WHERE customer_id IS NULL
   OR city IS NULL
   OR signup_date IS NULL;

SELECT *
FROM restaurants
WHERE restaurant_id IS NULL
   OR cuisine IS NULL
   OR city IS NULL
   OR rating IS NULL;

SELECT *
FROM menu_items
WHERE item_id IS NULL
   OR restaurant_id IS NULL
   OR price IS NULL;

SELECT *
FROM order_items
WHERE order_id IS NULL
   OR item_id IS NULL
   OR quantity IS NULL
   OR price IS NULL;

SELECT *
FROM orders_medium
WHERE order_id IS NULL
   OR customer_id IS NULL
   OR restaurant_id IS NULL
   OR order_time IS NULL
   OR delivery_time IS NULL
   OR status IS NULL;

# controllo valori numerici - non ci sono prezzi nè quantità negative
SELECT *
FROM menu_items
WHERE price <= 0;

SELECT *
FROM order_items
WHERE price <= 0
   OR quantity <= 0;

SELECT *
FROM restaurants
WHERE rating < 0
   OR rating > 5;

#controllo formato - vanno convertiti in date e datetime
SELECT signup_date
FROM customers_medium
LIMIT 10;

SELECT order_time, delivery_time
FROM orders_medium
LIMIT 10;

CREATE TABLE customers_clean (
    customer_id VARCHAR(20),
    city VARCHAR(180),
    signup_date DATE
);

INSERT INTO customers_clean (
    customer_id,
    city,
    signup_date
)
SELECT
    customer_id,
    city,
    STR_TO_DATE(signup_date, '%d/%m/%Y')
FROM customers_medium;

CREATE TABLE orders_clean (
    order_id VARCHAR(20),
    customer_id VARCHAR(20),
    restaurant_id VARCHAR(20),
    order_time DATETIME,
    delivery_time DATETIME,
    status VARCHAR(20)
);

INSERT INTO orders_clean (
    order_id,
    customer_id,
    restaurant_id,
    delivery_time,
    status
)
SELECT
    order_id,
    customer_id,
    restaurant_id,
    STR_TO_DATE(delivery_time, '%d/%m/%Y %H:%i'),
    status
FROM orders_medium;

