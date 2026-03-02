CREATE VIEW cohort_analysis AS 
WITH customer_sales AS(
    SELECT
        s.customerkey,
        s.orderdate,
        SUM(s.quantity * s.netprice * s.exchangerate) AS net_revenue,
        COUNT(s.customerkey) AS number_orders,
        c.countryfull,
        c.age,
        c.givenname,
        c.surname
    FROM sales s 
    LEFT JOIN customer c ON c.customerkey = s.customerkey
    GROUP BY 
        s.customerkey,
        s.orderdate,
        c.countryfull,
        c.age,
        c.givenname,
        c.surname
)
SELECT
    *,
    MIN(orderdate) OVER (PARTITION BY customerkey) AS first_purchase_date,
    EXTRACT(YEAR FROM MIN(orderdate) OVER (PARTITION BY customerkey)) AS cohort_year
FROM customer_sales cs
GROUP BY 
    customerkey,
    orderdate,
    countryfull,
    net_revenue,
    number_orders,
    age,
    givenname,
    surname 