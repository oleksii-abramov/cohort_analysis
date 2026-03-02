SELECT
    *
FROM sales s
LEFT JOIN customer c ON s.customerkey = c. customerkey
LEFT JOIN product p ON s.productkey = p.productkey
WHERE c.continent = 'Europe' 