WITH count_orders AS (
    SELECT
        m.pizzeria_id,
        po.person_id,
        COUNT(*) AS count
    FROM
        person_order AS po
    JOIN
        menu AS m
        ON po.menu_id = m.id
    GROUP BY po.person_id, m.pizzeria_id
)

INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
SELECT 
    ROW_NUMBER() OVER() AS id,
    person_id,
    pizzeria_id,
    CASE    
        WHEN count = 1 THEN 10.5
        WHEN count = 2 THEN 22
        ELSE 30
    END AS discount
    FROM
        count_orders;

select count(*) > 0 as check
from person_discounts