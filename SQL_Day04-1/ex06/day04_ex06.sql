CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT
    pizzeria_name
FROM 
    menu
JOIN
    (
        SELECT
            pa.id AS pizzeria_id,
            pn.name AS person_name,
            pa.name AS pizzeria_name,
            pv.visit_date AS visit_date
        FROM
            person_visits pv
        JOIN
            pizzeria pa ON pa.id = pv.pizzeria_id
        JOIN
            person pn ON pn.id = pv.person_id
        WHERE
            pn.name = 'Dmitriy' AND pv.visit_date = '2022-01-08'
    ) AS Dmitriy_ate ON menu.pizzeria_id = Dmitriy_ate.pizzeria_id
WHERE
    price < 800 