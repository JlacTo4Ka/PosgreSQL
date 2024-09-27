-- 1 вариант ->

WITH Dmitry_order AS (
    SELECT  
        pi.id AS pizzeria_id,
        pi.name AS pizzeria_name,
        pv.visit_date AS visit_date
    FROM    
        person_visits AS pv
    JOIN    
        pizzeria AS pi 
        ON pi.id = pv.pizzeria_id
    JOIN    
        person AS p 
        ON pv.person_id = p.id
    WHERE 
        p.name = 'Dmitriy' AND pv.visit_date = '2022-01-08'
)

SELECT 
    Dmitry_order.pizzeria_name
FROM    
    Dmitry_order
JOIN
    menu AS m
    ON m.pizzeria_id = Dmitry_order.pizzeria_id
WHERE   
    m.price < 800;

-- 2 вариант ->

SELECT
    pi.name AS pizzeria_name
FROM 
    person p
INNER JOIN 
    person_visits pv 
    ON pv.person_id = p.id
INNER JOIN 
    pizzeria pi
    ON pv.pizzeria_id = pi.id 
INNER JOIN 
    menu AS m
    ON m.pizzeria_id = pi.id
WHERE 
    p.name = 'Dmitriy' 
    AND pv.visit_date = '2022-01-08'
    AND m.price < 800;
