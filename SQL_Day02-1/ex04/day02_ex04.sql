SELECT 
    m.pizza_name AS pizza_name,
    pi.name AS pizzeria_name, 
    m.price AS price
FROM menu m
FULL JOIN pizzeria AS pi ON m.pizzeria_id = pi.id
WHERE pizza_name IN ('mushroom pizza', 'pepperoni pizza')
ORDER BY pizza_name, pizzeria_name;