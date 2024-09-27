WITH women AS (
    SELECT 
        gender,
        name,
        age
    FROM person
    WHERE gender = 'female' AND age > 25
)

SELECT 
    women.name AS name
FROM 
    women
ORDER BY name;