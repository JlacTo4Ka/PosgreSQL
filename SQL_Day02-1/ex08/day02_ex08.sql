SELECT 
    p.name
FROM    
    person AS p
JOIN    
    person_order AS po
    ON po.person_id = p.id
JOIN 
    menu AS m
    ON m.id = po.menu_id
WHERE
    m.pizza_name IN ('pepperoni pizza', 'mushroom pizza') AND
    p.gender = 'male' AND
    address IN ('Moscow', 'Samara')
ORDER BY    
    name DESC;