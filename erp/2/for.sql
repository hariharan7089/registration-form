SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE PrintNumbersUsingForLoop(
    start_num IN NUMBER,
    end_num IN NUMBER
)
IS
BEGIN
    FOR i IN start_num..end_num LOOP
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;
/

-- Example usage: Print numbers from 1 to 10 using a FOR loop
BEGIN
    PrintNumbersUsingForLoop(1, 10);
END;
/
