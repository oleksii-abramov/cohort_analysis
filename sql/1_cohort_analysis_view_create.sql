CREATE VIEW cohort_analysis AS
WITH customer_revenue AS (
    SELECT
        s.customerkey,
        s.orderdate,
        SUM(s.quantity::double precision * s.netprice * s.exchangerate) AS total_revenue,
        COUNT(s.orderkey) AS num_orders,
        c.countryfull,
        c.age,
        CONCAT(TRIM(c.givenname), ' ', TRIM(c.surname)) AS name
    FROM sales s
    LEFT JOIN customer c ON s.customerkey = c.customerkey
    GROUP BY 
        s.customerkey,
        s.orderdate,
        c.countryfull,
        c.age,
        CONCAT(TRIM(c.givenname), ' ', TRIM(c.surname))
),
cohorts AS(
SELECT
    *,
    MIN(orderdate) OVER (PARTITION BY customerkey) AS first_order_date,
    EXTRACT(YEAR FROM MIN(orderdate) OVER(PARTITION BY customerkey)) AS cohort_year
FROM customer_revenue
)
SELECT
    *
FROM cohorts
WHERE cohort_year >= 2020