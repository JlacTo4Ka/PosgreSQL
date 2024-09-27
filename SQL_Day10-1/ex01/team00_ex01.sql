WITH RECURSIVE paths AS (
    -- Базовый случай: начало из 'a'
    SELECT point1 AS start_point,
           point2 AS end_point,
           cost AS total_cost,
           1 AS depth,
           ARRAY[point1, point2] AS visited
    FROM city_paths AS n
    WHERE point1 = 'a'

    UNION ALL

    -- Рекурсивный случай: расширение пути
    SELECT p.start_point,
           n.point2 AS end_point,
           p.total_cost + n.cost AS total_cost,
           p.depth + 1 AS depth,
           p.visited || n.point2 AS visited
    FROM paths p
    JOIN city_paths n ON p.end_point = n.point1
    WHERE (n.point2 != ALL(p.visited) AND p.depth < (SELECT COUNT(DISTINCT point1) FROM city_paths)) 
        OR (n.point2 = 'a' AND p.depth = 3)
)

SELECT 
    total_cost, 
    visited AS tour 
FROM 
    paths
WHERE 
    (total_cost = (
        SELECT min(total_cost) 
        FROM paths 
        WHERE depth = 4) 
    AND depth = 4)
    OR
    (total_cost = (
        SELECT max(total_cost) 
        FROM paths 
        WHERE depth = 4) 
    AND depth = 4)
ORDER BY 
    total_cost, 
    tour;
