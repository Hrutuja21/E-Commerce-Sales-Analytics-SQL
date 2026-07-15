-- Total Customers

SELECT COUNT(*) AS total_customers
FROM customers;

-- Unique States

SELECT COUNT(DISTINCT customer_state)
FROM customers;

-- Customers By State

SELECT
    customer_state,
    COUNT(*) AS total_customers
FROM customers
GROUP BY customer_state
ORDER BY total_customers DESC;

-- Top 10 Customer Cities

SELECT
    customer_city,
    COUNT(*) AS customers
FROM customers
GROUP BY customer_city
ORDER BY customers DESC
LIMIT 10;