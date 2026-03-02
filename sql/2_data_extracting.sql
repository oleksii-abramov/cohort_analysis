WITH customers AS (
    SELECT
    customerkey,
    cohort_year,
    SUM(CASE WHEN orderdate >= first_order_date AND orderdate < first_order_date + INTERVAL '12 month' THEN total_revenue ELSE 0 END) AS total
FROM cohort_analysis
GROUP BY customerkey,
        cohort_year
),
q1_q3 AS (
    SELECT
        cohort_year,
        PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY total) AS pct_25,
        PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY total) AS pct_75
    FROM customers
    GROUP BY cohort_year
    ORDER BY cohort_year
),
groups AS (  
    SELECT
    c.*,
    CASE 
        WHEN c.total <= q.pct_25 THEN 'Low Value'
        WHEN c.total >= q.pct_75 THEN 'High Value'
        ELSE 'Medium Value'
    END AS customer_group
    FROM customers c
    INNER JOIN q1_q3 q ON c.cohort_year = q.cohort_year
)
SELECT
    ca.customerkey,
    g.total,
    ca.cohort_year,
    g.customer_group,
    COUNT(DISTINCT CASE 
        WHEN orderdate > first_order_date AND orderdate < first_order_date + INTERVAL '1 month' THEN ca.customerkey
    END) AS m_1,
    COUNT(DISTINCT CASE 
        WHEN orderdate >= first_order_date + INTERVAL '1 month' AND orderdate < first_order_date + INTERVAL '3 month' THEN ca.customerkey
    END) AS m_3,
    COUNT(DISTINCT CASE 
        WHEN orderdate >= first_order_date + INTERVAL '3 month' AND orderdate < first_order_date + INTERVAL '6 month' THEN ca.customerkey
    END) AS m_6,
    COUNT(DISTINCT CASE 
        WHEN orderdate >= first_order_date + INTERVAL '6 month' AND orderdate < first_order_date + INTERVAL '12 month' THEN ca.customerkey
    END) AS m_12
FROM cohort_analysis ca
LEFT JOIN groups g ON g.customerkey = ca.customerkey
GROUP BY 
    ca.customerkey,
    g.total,
    ca.cohort_year,
    g.customer_group