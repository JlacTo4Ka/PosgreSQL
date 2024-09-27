SELECT 
    p.name AS name,
    m.pizza_name AS pizza_name,
    m.price AS price,
    m.price - (m.price / 100 * pd.discount) AS discount_price,
    pi.name AS pizzeria_name
FROM 
    person_order AS po
JOIN 
    person AS p
    ON po.person_id = p.id
JOIN
    menu AS m 
    ON po.menu_id = m.id
JOIN
    pizzeria AS pi
    ON pi.id = m.pizzeria_id
JOIN
    person_discounts AS pd
    ON p.id = pd.person_id AND pi.id = pd.pizzeria_id
ORDER BY name, pizza_name;
