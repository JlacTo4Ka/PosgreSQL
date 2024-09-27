-- правильный вариант:

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
    m.pizza_name IN ('pepperoni pizza', 'cheese pizza') AND
    p.gender = 'female'
GROUP BY
    p.id, p.name
HAVING 
    COUNT(DISTINCT m.pizza_name) = 2
ORDER BY    
    p.name;

-- проверка :)

WITH woman_pizza AS (
    SELECT
        p.name AS name,
        m.pizza_name AS pizza_name
    FROM    
        person AS p
    JOIN    
        person_order AS po
        ON po.person_id = p.id
    JOIN
        menu AS m
        ON po.menu_id = m.id
    WHERE gender = 'female'
)

SELECT * FROM woman_pizza

