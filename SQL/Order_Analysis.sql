-- Total Orders

SELECT COUNT(*) AS total_orders
FROM orders;

-- Order Status Distribution

SELECT
    order_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;

-- Delivered Orders

SELECT COUNT(*)
FROM orders
WHERE order_status='delivered';

-- Cancelled Orders

SELECT COUNT(*)
FROM orders
WHERE order_status='canceled';

-- Delivery Success Rate

SELECT
ROUND(
(COUNT(*)*100.0)/
(SELECT COUNT(*) FROM orders),
2)
AS delivery_success_rate
FROM orders
WHERE order_status='delivered';

-- Monthly Orders

SELECT
    LEFT(order_purchase_timestamp,7) AS month,
    COUNT(*) AS total_orders
FROM orders
GROUP BY month
ORDER BY month;