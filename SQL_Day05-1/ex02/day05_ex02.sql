CREATE INDEX idx_person_name
ON person(name);

-- Отключаем последовательное сканирование
SET enable_seqscan = off;

EXPLAIN ANALYZE

SELECT
    name AS person_name
FROM
    person
WHERE
    name = 'John Doe';

