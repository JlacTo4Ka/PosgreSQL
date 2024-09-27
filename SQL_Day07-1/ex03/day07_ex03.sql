SELECT
    name,
    SUM(count) AS total_count
FROM
((
    SELECT
        pa.name AS name,
        COUNT(*) AS count,
        'order' AS action_type
    FROM pizzeria pa
    JOIN menu m ON pa.id = m.pizzeria_id
    JOIN person_order po ON m.id = po.menu_id
    GROUP BY pa.name
    ORDER BY count DESC
)
UNION 
(
    SELECT
        pa.name AS name,
        COUNT(*) AS count,
        'visit' AS action_type
    FROM pizzeria pa
    JOIN person_visits pv ON pa.id = pv.pizzeria_id 
    GROUP BY pa.name
    ORDER BY count DESC
))
GROUP BY name
ORDER BY total_count DESC,
         name ASC;

         