SELECT
    m1.pizza_name AS pizza_name,
    pi1.name AS pizzeria_name_1,
    pi2.name AS pizzeria_name_2,
    m1.price AS price
FROM
    menu AS m1
JOIN
    menu AS m2
    ON m1.pizzeria_id != m2.pizzeria_id
    AND m1.pizza_name = m2.pizza_name
    AND m1.price = m2.price
JOIN
    pizzeria AS pi1
    ON pi1.id = m1.pizzeria_id
JOIN
    pizzeria AS pi2
    ON pi2.id = m2.pizzeria_id
WHERE
    m1.id < m2.id
ORDER BY pizza_name;