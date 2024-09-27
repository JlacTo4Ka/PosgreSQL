SELECT
    p.name AS name,
    COUNT(*) AS count_of_visits
FROM
    person_visits AS pv 
JOIN
    person AS p 
    ON p.id = pv.person_id
GROUP BY p.name
ORDER BY count_of_visits DESC, name
LIMIT 4;

