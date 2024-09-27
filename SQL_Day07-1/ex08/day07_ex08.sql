SELECT
    p.address AS address,
    pa.name AS name,
    COUNT(po.*) AS count
FROM person p
JOIN person_order po ON p.id = po.person_id
JOIN menu m ON m.id = po.menu_id
JOIN pizzeria pa ON pa.id = m.pizzeria_id
GROUP BY p.address, pa.name
ORDER BY p.address, pa.name;
