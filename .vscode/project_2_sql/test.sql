SELECT
    cohort_year,
    ROUND(SUM(net_revenue)::numeric,2) AS total_revenue,
    COUNT(DISTINCT customerkey) AS total_customers,
    ROUND(SUM(net_revenue)::numeric,2) / COUNT(DISTINCT customerkey) AS customer_revenue
FROM cohort_analysis
GROUP BY 
    cohort_year