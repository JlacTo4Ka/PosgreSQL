SELECT
    pa.name AS name,
    COUNT(po.*) AS count_of_orders,
    AVG(m.price) AS avg_price,
    MAX(m.price) AS max_price,
    MIN(m.price) AS min_price
FROM person_order po
JOIN menu m ON m.id = po.menu_id
JOIN pizzeria pa ON pa.id = m.pizzeria_id
GROUP BY pa.name
ORDER BY pa.name;

