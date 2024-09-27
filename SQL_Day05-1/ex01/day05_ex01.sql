SET enable_seqscan = off;
EXPLAIN ANALYZE
SELECT
    m.pizza_name AS pizza_name,
    pi.name AS pizzeria_name
FROM
    menu AS m
JOIN
    pizzeria AS pi
    ON pi.id = m.pizzeria_id;
