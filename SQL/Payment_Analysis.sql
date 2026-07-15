-- Payment Methods

SELECT DISTINCT payment_type
FROM payments;

-- Payment Method Usage

SELECT
    payment_type,
    COUNT(*) AS total_transactions
FROM payments
GROUP BY payment_type
ORDER BY total_transactions DESC;

-- Revenue By Payment Method

SELECT
    payment_type,
    ROUND(SUM(payment_value::NUMERIC),2) AS revenue
FROM payments
GROUP BY payment_type
ORDER BY revenue DESC;