-- Top 10 Sellers By Revenue

SELECT
    seller_id,
    ROUND(SUM(price::NUMERIC),2) AS revenue
FROM order_items
GROUP BY seller_id
ORDER BY revenue DESC
LIMIT 10;

-- Monthly Revenue Trend

SELECT
    LEFT(o.order_purchase_timestamp,7) AS month,
    ROUND(SUM(oi.price::NUMERIC),2) AS revenue
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month;

-- Average Order Value

SELECT
ROUND(AVG(payment_value::NUMERIC),2)
AS average_order_value
FROM payments;

-- Top Revenue Generating States

SELECT
    c.customer_state,
    ROUND(SUM(p.payment_value::NUMERIC),2) AS revenue
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN payments p
ON o.order_id = p.order_id
GROUP BY c.customer_state
ORDER BY revenue DESC
LIMIT 10;

-- Top Selling Products

SELECT
    product_id,
    COUNT(*) AS total_sales
FROM order_items
GROUP BY product_id
ORDER BY total_sales DESC
LIMIT 10;