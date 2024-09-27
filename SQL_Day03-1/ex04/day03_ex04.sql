WITH girls AS (
    SELECT 
        pi.name AS pizzeria_name
    FROM 
        pizzeria AS pi
    JOIN
        menu AS m
        ON m.pizzeria_id = pi.id
    JOIN
        person_order AS po
        ON po.menu_id = m.id
    JOIN    
        person AS p
        ON po.person_id = p.id AND p.gender = 'female'
), boys AS (
    SELECT 
        pi.name AS pizzeria_name
    FROM 
        pizzeria AS pi
    JOIN
        menu AS m
        ON m.pizzeria_id = pi.id
    JOIN
        person_order AS po
        ON po.menu_id = m.id
    JOIN    
        person AS p
        ON po.person_id = p.id AND p.gender = 'male'
)

-- только либо мужчины, либо только женщины

(SELECT
    pizzeria_name
FROM
    boys
EXCEPT
SELECT
    pizzeria_name
FROM
    girls)
UNION
(SELECT
    pizzeria_name
FROM
    girls
EXCEPT
SELECT
    pizzeria_name
FROM
    boys);