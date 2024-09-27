SELECT
    address,
    formula,
    average,
    formula > average AS comparison
FROM
(SELECT
    address,
    ROUND(MAX(age) - (MIN(age)::NUMERIC / MAX(age)), 2) AS formula,
    ROUND(AVG(age), 2) AS average
FROM person
GROUP BY address)
ORDER BY address;
