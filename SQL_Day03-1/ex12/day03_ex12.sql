WITH greek_order AS (
    SELECT
        pids + (
            SELECT
                max(id)
            FROM
                person_order
        ) AS id,
        pids AS person_id,
        (
            SELECT 
                id
            FROM 
                menu
            WHERE
                pizza_name = 'greek pizza'
        ) AS menu_id,
        CAST('2022-02-25' AS date) AS order_date
    FROM
        generate_series(1,(
            SELECT
                max(id)
            FROM
                person
        )) AS pids
    )

INSERT INTO
    person_order(id, person_id, menu_id, order_date)
SELECT
    *
FROM
    greek_order
