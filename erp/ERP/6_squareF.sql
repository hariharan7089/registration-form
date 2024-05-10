CREATE OR REPLACE FUNCTION calc_square (
    p_value IN NUMBER
) RETURN NUMBER IS
BEGIN
    RETURN p_value * p_value;
END;
/