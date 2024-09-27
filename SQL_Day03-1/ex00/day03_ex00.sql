SELECT 
    m.pizza_name AS pizza_name,
    m.price AS price,
    pi.name AS pizzeria_name,
    pv.visit_date AS visit_date
FROM 
    menu AS m
JOIN
    person_visits AS pv
    ON pv.pizzeria_id = m.pizzeria_id
JOIN 
    pizzeria AS pi 
    ON pi.id = m.pizzeria_id
JOIN    
    person AS p
    ON pv.person_id = p.id AND p.name = 'Kate'
WHERE 
    price BETWEEN 800 AND 1000
ORDER BY 
    pizza_name, price, pizzeria_name;