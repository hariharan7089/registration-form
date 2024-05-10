CREATE OR REPLACE PROCEDURE calc_square (
    p_value IN NUMBER,
    p_square OUT NUMBER
) AS
BEGIN
    p_square := p_value * p_value;
    DBMS_OUTPUT.PUT_LINE(p_square);
END;
BEGIN
    calc_square(3);
END;
/