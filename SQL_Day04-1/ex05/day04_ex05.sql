DROP VIEW IF EXISTS v_price_with_discount;

CREATE VIEW v_price_with_discount AS
SELECT
    p.name AS name,
    m.pizza_name AS pizza_name,
    m.price AS price,
    ROUND(m.price - m.price * 0.1) AS discount_price
FROM
    person_order po 
JOIN person p ON p.id = po.person_id
JOIN menu m ON m.id = po.menu_id
ORDER BY
    p.name,
    m.pizza_name