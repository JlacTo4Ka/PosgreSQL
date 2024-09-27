-- 1
SELECT 
    * 
FROM    
    pizzeria
WHERE
    name = 'Pizza Hut';

-- 2
BEGIN;

-- 3
UPDATE  pizzeria
SET rating = 5
WHERE name = 'Pizza Hut';

-- 4 
SELECT * 
FROM pizzeria
WHERE name = 'Pizza Hut';

-- 5
COMMIT;


