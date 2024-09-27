SELECT 
    COALESCE(p.name, '-') AS person_name,
    visits.visit_date,
    COALESCE(pi.name, '-') AS pizzeria_name
FROM person AS p
FULL JOIN (
    SELECT 
        person_id,
        pizzeria_id,
        visit_date
    FROM person_visits AS pv
    WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03'
) AS visits ON visits.person_id = p.id 
FULL JOIN 
    pizzeria pi ON visits.pizzeria_id = pi.id
ORDER BY 
    person_name, visit_date, pizzeria_name;