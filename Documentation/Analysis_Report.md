E-COMMERCE SALES ANALYTICS PROJECT

Project Information

Project Name: E-Commerce Sales Analytics using SQL
Database: PostgreSQL
Dataset: Olist Brazilian E-Commerce Dataset
Project Duration: July 2026
Tools Used: PostgreSQL, pgAdmin 4, GitHub

Objective:
Analyze customer behavior, sales trends, payment patterns, product performance, and business insights using SQL.

==================================================================

DATASET OVERVIEW

Tables Used:
1. customers
2. orders
3. products
4. sellers
5. order_items
6. payments
7. reviews
8. categories

==================================================================

CUSTOMER ANALYSIS

1. Total Customers

Query:

SELECT COUNT(*) AS total_customers
FROM customers;

Output:

99441

Insight:

The dataset contains 99,441 customer records, providing a large customer base for analyzing purchasing behavior and market trends.

------------------------------------------------------------------

2. Unique States

Query:

SELECT COUNT(DISTINCT customer_state)
FROM customers;

Output:

27

Insight:

Customers are distributed across 27 different states, indicating that the e-commerce platform has a broad geographical presence across Brazil.
------------------------------------------------------------------

3. Customers by State

Query:

SELECT
    customer_state,
    COUNT(*) AS total_customers
FROM customers
GROUP BY customer_state
ORDER BY total_customers DESC;

Output:

SP  - 41,746
RJ  - 12,852
MG  - 11,635
RS  - 5,466
PR  - 5,045
SC  - 3,637
BA  - 3,380
DF  - 2,140
ES  - 2,033
GO  - 2,020
PE  - 1,652
CE  - 1,336
PA  - 975
MT  - 907
MA  - 747
MS  - 715
PB  - 536
PI  - 495
RN  - 485
AL  - 413
SE  - 350
TO  - 280
RO  - 253
AM  - 148
AC  - 81
AP  - 68
RR  - 46

Insight:

São Paulo (SP) has the highest customer concentration with 41,746 customers, accounting for a significant share of the customer base. Rio de Janeiro (RJ) and Minas Gerais (MG) are the next largest markets. The business has nationwide reach, but customer distribution is heavily concentrated in southeastern Brazil.
------------------------------------------------------------------

4. Top 10 Customer Cities

Query:

SELECT
    customer_city,
    COUNT(*) AS customers
FROM customers
GROUP BY customer_city
ORDER BY customers DESC
LIMIT 10;

Output:

sao paulo               - 15,540
rio de janeiro          - 6,882
belo horizonte          - 2,773
brasilia                - 2,131
curitiba                - 1,521
campinas                - 1,444
porto alegre            - 1,379
salvador                - 1,245
guarulhos               - 1,189
sao bernardo do campo   - 938

Insight:

São Paulo is the largest customer city with 15,540 customers, significantly outperforming all other cities. Rio de Janeiro ranks second with 6,882 customers. The top cities are mostly major metropolitan areas, indicating that urban regions drive the majority of e-commerce activity.

Customer Analysis Summary

• Total Customers: 99,441
• States Covered: 27
• Largest State: São Paulo (41,746 customers)
• Largest City: São Paulo (15,540 customers)

Key Insight:
The customer base is heavily concentrated in southeastern Brazil, particularly in São Paulo, Rio de Janeiro, and Minas Gerais. These regions represent the most valuable markets for customer acquisition and sales growth.
==================================================================

==================================================================

ORDER ANALYSIS

5. Order Status Distribution

Query:

SELECT
    order_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;

Output:

delivered    - 96,478
shipped      - 1,107
canceled     - 625
unavailable  - 609
invoiced     - 314
processing   - 301
created      - 5
approved     - 2

Insight:

The vast majority of orders (96,478) were successfully delivered, indicating a strong order fulfillment process. Only 625 orders were canceled, representing a very small percentage of total orders. This suggests high operational efficiency and customer satisfaction.
------------------------------------------------------------------

6. Delivered Orders

Output:

96,478

Insight:

Most orders were successfully delivered, demonstrating effective logistics and order management.
------------------------------------------------------------------

7. Cancelled Orders

Output:

625

Insight:

Only 625 orders were canceled, indicating a low cancellation rate and strong customer retention.
------------------------------------------------------------------


8. Monthly Order Trends

Query:

SELECT
    LEFT(order_purchase_timestamp,7) AS month,
    COUNT(*) AS total_orders
FROM orders
GROUP BY month
ORDER BY month;

Output:

2016-09  - 4
2016-10  - 324
2016-12  - 1
2017-01  - 800
2017-02  - 1,780
2017-03  - 2,682
2017-04  - 2,404
2017-05  - 3,700
2017-06  - 3,245
2017-07  - 4,026
2017-08  - 4,331
2017-09  - 4,285
2017-10  - 4,631
2017-11  - 7,544
2017-12  - 5,673
2018-01  - 7,269
2018-02  - 6,728
2018-03  - 7,211
2018-04  - 6,939
2018-05  - 6,873
2018-06  - 6,167
2018-07  - 6,292
2018-08  - 6,512
2018-09  - 16
2018-10  - 4

Insight:

Order volume grew steadily throughout 2017 and peaked in November 2017 with 7,544 orders. This spike likely reflects seasonal shopping events and promotional campaigns. Throughout 2018, monthly orders remained consistently above 6,000, indicating strong business growth and customer demand.

==================================================================

==================================================================

PAYMENT ANALYSIS

9. Payment Methods

Query:

SELECT DISTINCT payment_type
FROM payments;

Output:

not_defined
boleto
debit_card
voucher
credit_card

Insight:

The e-commerce platform supports multiple payment methods, including credit cards, debit cards, vouchers, and boleto. Offering diverse payment options improves customer convenience and accessibility.
------------------------------------------------------------------

10. Payment Method Usage

Query:

SELECT
    payment_type,
    COUNT(*) AS total_transactions
FROM payments
GROUP BY payment_type
ORDER BY total_transactions DESC;

Output:

credit_card    - 76,795
boleto         - 19,784
voucher        - 5,775
debit_card     - 1,529
not_defined    - 3

Insight:

Credit cards are the dominant payment method with 76,795 transactions, accounting for the majority of purchases. Boleto is the second most popular payment option with 19,784 transactions. Debit cards and vouchers are used less frequently. This indicates a strong customer preference for credit-based payments.

------------------------------------------------------------------

11. Revenue by Payment Method

Query:

SELECT
    payment_type,
    ROUND(SUM(payment_value::NUMERIC),2) AS revenue
FROM payments
GROUP BY payment_type
ORDER BY revenue DESC;

Output:

credit_card    - 12,542,084.19
boleto         - 2,869,361.27
voucher        - 379,436.87
debit_card     - 217,989.79
not_defined    - 0.00

Insight:

Credit cards generated the highest revenue of 12.54 million, significantly outperforming all other payment methods. Boleto contributed 2.87 million in revenue and ranked second. The dominance of credit cards in both transaction volume and revenue indicates strong customer preference for credit-based purchases.
==================================================================

==================================================================

PRODUCT ANALYSIS

12. Top Product Categories

Query:

SELECT
    product_category_name,
    COUNT(*) AS total_products
FROM products
GROUP BY product_category_name
ORDER BY total_products DESC
LIMIT 10;

Output:

cama_mesa_banho          - 3,029
esporte_lazer            - 2,867
moveis_decoracao         - 2,657
beleza_saude             - 2,444
utilidades_domesticas    - 2,335
automotivo               - 1,900
informatica_acessorios   - 1,639
brinquedos               - 1,411
relogios_presentes       - 1,329
telefonia                - 1,134

Insight:

The largest product category is "cama_mesa_banho" (bed, bath, and table products) with 3,029 products, followed by sports & leisure and furniture & decoration. Home-related categories dominate the catalog, indicating strong customer demand in household and lifestyle products.
------------------------------------------------------------------

13. Categories with Fewest Products

Query:

SELECT
    product_category_name,
    COUNT(*) AS total_products
FROM products
GROUP BY product_category_name
ORDER BY total_products ASC
LIMIT 10;

Output:

cds_dvds_musicais                                - 1
seguros_e_servicos                              - 2
pc_gamer                                        - 3
fashion_roupa_infanto_juvenil                   - 5
casa_conforto_2                                 - 5
tablets_impressao_imagem                        - 9
moveis_colchao_e_estofado                       - 10
la_cuisine                                      - 10
portateis_cozinha_e_preparadores_de_alimentos   - 10
fraldas_higiene                                 - 12

Insight:

Several categories have very limited product offerings. "cds_dvds_musicais" contains only one product, while categories such as PC Gamer and Fashion Infantil have fewer than five products. These categories may represent niche markets or underdeveloped product segments.
==================================================================
==================================================================

REVIEW ANALYSIS

14. Average Review Score

Query:

SELECT
    ROUND(AVG(review_score::NUMERIC),2)
FROM reviews;

Output:

4.09

Insight:

The average review score is 4.09 out of 5, indicating generally positive customer satisfaction. Most customers appear satisfied with their purchasing experience, product quality, and delivery service.
------------------------------------------------------------------

15. Rating Distribution

Query:

SELECT
    review_score,
    COUNT(*) AS total_reviews
FROM reviews
GROUP BY review_score
ORDER BY review_score;

Output:

1 Star  - 11,424
2 Stars - 3,151
3 Stars - 8,179
4 Stars - 19,142
5 Stars - 57,328

Insight:

5-star reviews dominate the dataset with 57,328 reviews, followed by 4-star reviews with 19,142 reviews. Together, 4-star and 5-star ratings account for the majority of customer feedback, indicating high customer satisfaction and a positive shopping experience.
==================================================================
==================================================================

JOIN ANALYSIS

16. Orders by State

Query:

SELECT
    c.customer_state,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_state
ORDER BY total_orders DESC;

Output:

SP - 41,746
RJ - 12,852
MG - 11,635
RS - 5,466
PR - 5,045
SC - 3,637
BA - 3,380
DF - 2,140
ES - 2,033
GO - 2,020

Insight:

São Paulo generated the highest number of orders (41,746), followed by Rio de Janeiro and Minas Gerais. These states represent the most important markets for the business and should be prioritized for marketing, logistics, and inventory planning.
==================================================================
==================================================================

ADVANCED SQL ANALYSIS

17. Top 10 Sellers by Revenue

Query:

SELECT
    seller_id,
    ROUND(SUM(price::NUMERIC),2) AS revenue
FROM order_items
GROUP BY seller_id
ORDER BY revenue DESC
LIMIT 10;

Output:

4869f7a5dfa277a7dca6462dcf3b52b2 - 229,472.63
53243585a1d6dc2643021fd1853d8905 - 222,776.05
4a3ca9315b744ce9f8e9374361493884 - 200,472.92
fa1c13f2614d7b5c4749cbc52fecda94 - 194,042.03
7c67e1448b00f6e969d365cea6b010ab - 187,923.89
7e93a43ef30c4f03f38b393420bc753a - 176,431.87
da8622b14eb17ae2831f4ac5b9dab84a - 160,236.57
7a67c85e85bb2ce8582c35f2203ad736 - 141,745.53
1025f0e2d44d7041d6cf58b6550e0bfa - 138,968.55
955fee9216a65b617aa5c0531780ce60 - 135,171.70

Insight:

The top-performing seller generated revenue of 229,472.63, while the top 10 sellers collectively contributed a significant share of platform sales. This analysis helps identify high-performing sellers and can be used for vendor performance evaluation and strategic partnerships.
------------------------------------------------------------------
18. Monthly Revenue Trend

Query:

SELECT
    LEFT(o.order_purchase_timestamp,7) AS month,
    ROUND(SUM(oi.price::NUMERIC),2) AS revenue
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month;

Output:

2016-09 - 267.36
2016-10 - 49,507.66
2016-12 - 10.90
2017-01 - 120,312.87
2017-02 - 247,303.02
2017-03 - 374,344.30
2017-04 - 359,927.23
2017-05 - 506,071.14
2017-06 - 433,038.60
2017-07 - 498,031.48
2017-08 - 573,971.68
2017-09 - 624,401.69
2017-10 - 664,219.43
2017-11 - 1,010,271.37
2017-12 - 743,914.17
2018-01 - 950,030.36
2018-02 - 844,178.71
2018-03 - 983,213.44
2018-04 - 996,647.75
2018-05 - 996,517.68
2018-06 - 865,124.31
2018-07 - 895,507.22
2018-08 - 854,686.33
2018-09 - 145.00

Insight:

Revenue increased consistently throughout 2017 and crossed the 1 million mark in November 2017, making it the highest revenue month. Revenue remained strong throughout 2018, averaging around 850K–1M per month, indicating sustained business growth and strong customer demand.

------------------------------------------------------------------

19. Average Order Value (AOV)

Query:

SELECT
ROUND(AVG(payment_value::NUMERIC),2)
AS average_order_value
FROM payments;

Output:

154.10

Insight:

The Average Order Value (AOV) is 154.10. This indicates that customers spend approximately 154 currency units per transaction on average. AOV is an important business metric used to evaluate customer purchasing behavior and revenue performance.

------------------------------------------------------------------
20. Top Revenue Generating States

Query:

SELECT
    c.customer_state,
    ROUND(SUM(p.payment_value::NUMERIC),2) AS revenue
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
JOIN payments p
ON o.order_id=p.order_id
GROUP BY c.customer_state
ORDER BY revenue DESC
LIMIT 10;

Output:

SP - 5,998,226.96
RJ - 2,144,379.69
MG - 1,872,257.26
RS - 890,898.54
PR - 811,156.38
SC - 623,086.43
BA - 616,645.82
DF - 355,141.08
GO - 350,092.31
ES - 325,967.55

Insight:

São Paulo generated the highest revenue at nearly 6 million, significantly outperforming all other states. Rio de Janeiro and Minas Gerais ranked second and third respectively. These states represent the most valuable markets and should be prioritized for marketing campaigns, inventory management, and customer retention strategies.

------------------------------------------------------------------

21. Top Selling Products

Query:

SELECT
    product_id,
    COUNT(*) AS total_sales
FROM order_items
GROUP BY product_id
ORDER BY total_sales DESC
LIMIT 10;

Output:

aca2eb7d00ea1a7b8ebd4e68314663af - 527
99a4788cb24856965c36a24e339b6058 - 488
422879e10f46682990de24d770e7f83d - 484
389d119b48cf3043d311335e499d9c6b - 392
368c6c730842d78016ad823897a372db - 388
53759a2ecddad2bb87a079a1f1519f73 - 373
d1c427060a0f73f6b889a5c7c61f2ac4 - 343
53b36df67ebb7c41585e8d54d6772e08 - 323
154e7e31ebfa092203795c972e5804a6 - 281
3dd2a17168ec895c781a9191c1e95ad7 - 274

Insight:

The best-selling product was sold 527 times. Identifying top-selling products helps businesses optimize inventory management, demand forecasting, and promotional strategies. These products contribute significantly to overall sales volume and customer demand.
------------------------------------------------------------------
==================================================================

SQL Concepts Used

• SELECT
• WHERE
• DISTINCT
• ORDER BY
• GROUP BY
• Aggregate Functions
• INNER JOIN
• Data Aggregation
• Revenue Analysis
• Business Intelligence Queries

------------------------------------------------------------------

PROJECT SUMMARY

Dataset Statistics

• Customers: 99,441
• Orders: 99,441
• Products: 32,951
• Sellers: 3,095
• Payments: 103,886
• Reviews: 99,224
• States Covered: 27

Key Business Findings

• São Paulo was the largest customer market with 41,746 customers.
• São Paulo generated the highest revenue of 5.99 million.
• Credit Card was the most preferred payment method with 76,795 transactions.
• Credit Card generated the highest revenue of 12.54 million.
• The highest revenue month was November 2017 with revenue exceeding 1 million.
• The most popular product category was Bed, Bath & Table (3,029 products).
• Average Order Value (AOV) was 154.10.
• Average Customer Rating was 4.09/5.
• 57,328 customers provided 5-star reviews, indicating high customer satisfaction.
• Delivery success rate was approximately 97%.


Conclusion

This project analyzed a large-scale e-commerce dataset using PostgreSQL. SQL was used to perform customer analysis, order analysis, payment analysis, product analysis, review analysis, revenue analysis, and multi-table JOIN operations. The analysis identified customer behavior patterns, top-performing markets, revenue trends, payment preferences, and product performance, providing actionable business insights for decision-making.

This project demonstrates SQL skills including:
- Data Import
- Data Exploration
- Filtering
- Aggregations
- GROUP BY
- ORDER BY
- DISTINCT
- JOINs
- Business Insight Generation