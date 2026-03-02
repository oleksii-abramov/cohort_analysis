WITH second_order AS (
    SELECT
        customerkey,
        first_order_date,
        cohort_year,
        MIN(CASE WHEN orderdate > first_order_date THEN orderdate ELSE NULL END) AS second_order_date
    FROM cohort_analysis
    WHERE orderdate <= '31-12-2023'
    GROUP BY 
        customerkey,
        first_order_date,
        cohort_year
)
SELECT
    *,
    second_order_date - first_order_date AS second_order_lag
FROM second_order
WHERE second_order_date IS NOT NULL