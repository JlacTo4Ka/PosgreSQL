SELECT 
    m.pizza_name AS pizza_name,
    m.price AS price,
    pi.name AS pizzeria_name
FROM
    menu AS m
JOIN 
    pizzeria AS pi 
    ON pi.id = m.pizzeria_id
WHERE 
    m.id NOT IN (
        SELECT
            menu_id
        FROM
            person_order
    )
ORDER BY 
    pizza_name, price;