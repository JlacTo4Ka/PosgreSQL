CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
RETURNS TABLE(fibonacci INTEGER)
AS $$
DECLARE
    prev INTEGER := 0;
    curr INTEGER := 1;
    next_num INTEGER;
BEGIN
    IF pstop >= 1 THEN
        fibonacci := 0;
        RETURN NEXT;
    END IF;

    IF pstop >= 2 THEN
        fibonacci := 1;
        RETURN NEXT;
    END IF;

    WHILE curr < pstop LOOP
        next_num := prev + curr;
        prev := curr;
        curr := next_num;
        
        IF next_num < pstop THEN
            fibonacci := next_num;
            RETURN NEXT;
        END IF;
    END LOOP;
    
END;
$$ LANGUAGE plpgsql;


SELECT * 
FROM fnc_fibonacci(100);

SELECT * 
FROM fnc_fibonacci();
