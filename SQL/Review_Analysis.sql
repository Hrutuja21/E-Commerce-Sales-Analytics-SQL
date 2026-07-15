-- Average Review Score

SELECT
ROUND(AVG(review_score::NUMERIC),2)
AS average_review_score
FROM reviews;

-- Rating Distribution

SELECT
    review_score,
    COUNT(*) AS total_reviews
FROM reviews
GROUP BY review_score
ORDER BY review_score;