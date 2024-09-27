SELECT
    id
FROM
    menu AS menu_id
WHERE 
    id NOT IN (
        SELECT
            menu_id
        FROM
            person_order
    )
ORDER BY menu_id;