SELECT 
    m.pizza_name AS pizza_name,
    pi.name AS pizzeria_name
FROM menu AS m
FULL JOIN person_order AS orders
    ON orders.menu_id = m.id 
FULL JOIN pizzeria AS pi 
    ON m.pizzeria_id = pi.id
FULL JOIN person 
    ON orders.person_id = person.id 
WHERE person.name IN ('Denis', 'Anna')
ORDER BY pizza_name, pizzeria_name;