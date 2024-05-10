CREATE OR REPLACE FUNCTION factorial(n NUMBER) RETURN NUMBER IS
BEGIN
    -- Base case: factorial of 0 is 1
    IF n = 0 THEN
        RETURN 1;
    ELSE
        -- Recursive case: factorial(n) = n * factorial(n - 1)
        RETURN n * factorial(n - 1);
    END IF;
END;
/
-- Calculate factorial of 5
DECLARE
    result NUMBER;
BEGIN
    result := factorial(5);
    DBMS_OUTPUT.PUT_LINE('Factorial of 5: ' || result);
END;
/
