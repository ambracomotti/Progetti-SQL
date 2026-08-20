#rispondo a domande di business
#10 ristoranti con maggior numero di ordini
SELECT restaurant_id, COUNT(*) as nr_ordini
FROM orders_clean
GROUP BY restaurant_id 
ORDER BY nr_ordini DESC 
LIMIT 10

#10 ristoranti con maggior fatturato
SELECT restaurant_id, sum(price * quantity) as tot_revenue
FROM orders_clean JOIN order_items oi ON oi.order_id = orders_clean.order_id
GROUP BY restaurant_id
ORDER BY tot_revenue DESC 
LIMIT 10

#valore di ogni ordine
SELECT order_id, SUM(price*quantity) as tot_order
FROM order_items
GROUP BY order_id

#valore medio ordini per ristorante
SELECT restaurant_id, AVG(tot_order) as avg_order FROM (
SELECT order_id, SUM(price*quantity) as tot_order FROM order_items GROUP BY order_id) as order_totals JOIN orders_clean ON order_totals.order_id = orders_clean.order_id
GROUP BY restaurant_id
ORDER BY avg_order DESC;


SELECT DISTINCT status
FROM orders_clean;

#percentuale ordini deliverati
SELECT 100* (SELECT count(*)
FROM orders_clean
WHERE orders_clean.status = "Delivered")/(SELECT count(*) FROM orders_clean) AS delivered_orders

#percentuale ordini in ritardo
SELECT 100* (SELECT count(*)
FROM orders_clean
WHERE orders_clean.status = "Late")/(SELECT count(*) FROM orders_clean) AS late_orders

#percentuale ordini cancellati
SELECT 100* (SELECT count(*)
FROM orders_clean
WHERE orders_clean.status = "Cancelled")/(SELECT count(*) FROM orders_clean) AS cancelled_orders

#check di correttezza
SELECT 100 * (
(SELECT count(*)
FROM orders_clean WHERE orders_clean.status = "Cancelled")
/ (SELECT count(*) FROM orders_clean)
+ 
(SELECT count(*)
FROM orders_clean WHERE orders_clean.status = "Late")
/ (SELECT count(*) FROM orders_clean) + 
(SELECT count(*) FROM orders_clean WHERE orders_clean.status = "Delivered")
/ (SELECT count(*) FROM orders_clean)
) as check_percentage;

