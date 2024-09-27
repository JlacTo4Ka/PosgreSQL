SELECT 
    name AS pizzaria_name
FROM pizzeria AS p
WHERE p.id NOT IN (SELECT pizzeria_id FROM person_visits);

SELECT 
    name AS pizzaria_name
FROM pizzeria AS p
WHERE NOT EXISTS (SELECT 
                    pizzeria_id 
                FROM person_visits AS pv
                WHERE p.id = pv.pizzeria_id); 