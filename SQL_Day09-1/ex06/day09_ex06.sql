CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date
(
    pperson VARCHAR DEFAULT 'Dmitriy', 
    pprice NUMERIC DEFAULT 500, 
    pdate DATE DEFAULT '2022-01-08'
    )
RETURNS TABLE (name VARCHAR)
AS
$$
BEGIN
    RETURN QUERY
    SELECT pa.name AS name
    FROM menu m
    JOIN pizzeria pa ON m.pizzeria_id = pa.id
    JOIN person_visits pv ON pa.id = pv.pizzeria_id
    JOIN person pn ON pn.id = pv.person_id
    WHERE pn.name = pperson AND m.price < pprice AND pv.visit_date = pdate;
END
$$ LANGUAGE plpgsql;

SELECT *
FROM fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT *
FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
