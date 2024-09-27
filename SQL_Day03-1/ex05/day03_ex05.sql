SELECT 
    pi.name AS pizzeria_name,
    pv.pizzeria_id AS pizzeria_id
FROM
    person_visits AS pv
JOIN 
    person AS p
    ON pv.person_id = p.id AND p.name = 'Andrey'
JOIN 
    pizzeria AS pi
    ON pi.id = pv.pizzeria_id
EXCEPT
SELECT 
    pi.name AS pizzeria_name,
    m.pizzeria_id AS pizzeria_id
FROM
    person_order AS po
JOIN
    menu AS m
    ON po.menu_id = m.id
JOIN
    pizzeria AS pi
    ON pi.id = m.pizzeria_id
JOIN 
    person AS p
    ON po.person_id = p.id AND p.name = 'Andrey'

ORDER BY pizzeria_name;