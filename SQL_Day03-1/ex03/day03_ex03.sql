WITH count_visits AS (
    SELECT     
        COUNT (*) AS visits_count,
        p.gender AS gender,
        pi.name AS pizzeria_name
    FROM
        person_visits AS pv
    JOIN
        person AS p
        ON p.id = pv.person_id
    JOIN
        pizzeria AS pi
        ON pv.pizzeria_id = pi.id
    GROUP BY gender, pizzeria_name
), result AS (
    SELECT
        pizzeria_name,
        SUM(CASE WHEN gender = 'male' THEN visits_count ELSE 0 END) AS men,
        SUM(CASE WHEN gender = 'female' THEN visits_count ELSE 0 END) AS women
    FROM count_visits
    GROUP BY pizzeria_name
)

SELECT  
    pizzeria_name
FROM
    result
WHERE 
    men > women OR women > men
ORDER BY pizzeria_name;