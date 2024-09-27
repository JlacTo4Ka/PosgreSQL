SELECT
    dates.generated_date AS missing_date
FROM
    v_generated_dates dates
EXCEPT 
SELECT
    visit_date
FROM
    person_visits
ORDER BY
    missing_date
