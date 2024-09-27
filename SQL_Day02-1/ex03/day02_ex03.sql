WITH visit_dates AS (
    SELECT DISTINCT visit_date
    FROM person_visits 
    WHERE person_id = 1 OR person_id = 2 
),
all_days AS (
    SELECT generate_series('2022-01-1'::DATE, '2022-01-10'::DATE, interval '1 day') 
    AS day   
)

SELECT day::DATE AS missing_date
FROM all_days
LEFT JOIN visit_dates ON all_days.day = visit_dates.visit_date
WHERE visit_dates.visit_date IS NULL
ORDER BY missing_date ASC;