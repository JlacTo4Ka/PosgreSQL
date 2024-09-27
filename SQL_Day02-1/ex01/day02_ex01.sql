SELECT 
    gen_day::DATE AS missing_date
FROM 
    generate_series('2022-01-1', '2022-01-10', interval '1 day') AS gs(gen_day)
LEFT JOIN (
    SELECT DISTINCT visit_date
    FROM person_visits
    WHERE person_id = 1 OR person_id = 2 
) AS visits ON visits.visit_date = gs.gen_day
WHERE visits.visit_date IS NULL
ORDER BY missing_date ASC;