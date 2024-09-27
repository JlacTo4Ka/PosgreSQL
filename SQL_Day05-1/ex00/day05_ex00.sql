-- Узнаем информацию о внешних ключах

SELECT 
    conname AS constraint_name,
    (SELECT relname FROM pg_class WHERE oid = conrelid) AS table_name,
    (SELECT attname FROM pg_attribute WHERE attrelid = conrelid AND attnum = ANY(conkey)) AS column_name,
    (SELECT relname FROM pg_class WHERE oid = confrelid) AS referenced_table,
    (SELECT attname FROM pg_attribute WHERE attrelid = confrelid AND attnum = ANY(confkey)) AS referenced_column
FROM 
    pg_constraint
WHERE 
    contype = 'f';

-- Сохдание индексов

CREATE INDEX idx_person_visits_person_id
    ON person_visits(person_id);

CREATE INDEX idx_person_visits_pizzeria_id
    ON person_visits(pizzeria_id);

CREATE INDEX idx_menu_pizzeria_id
    ON menu(pizzeria_id);

CREATE INDEX idx_person_order_person_id
    ON person_order(person_id);

CREATE INDEX idx_person_order_menu_id
    ON person_order(menu_id);