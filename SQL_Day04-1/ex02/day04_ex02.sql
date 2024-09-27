CREATE VIEW v_generated_dates AS
SELECT
    days::DATE AS generated_date
FROM
    generate_series(date '2022-01-01', date '2022-01-31', interval '1 day') AS days
ORDER BY
    generated_date
