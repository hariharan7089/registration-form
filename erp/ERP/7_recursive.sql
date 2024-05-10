CREATE OR REPLACE FUNCTION factorial (
    n NUMBER
) RETURN NUMBER IS
BEGIN
    IF n <= 1 THEN
        RETURN 1;
    ELSE
        RETURN n * factorial(n - 1);
    END IF;
END;
/