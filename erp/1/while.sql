SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE PrintNumbersUsingWhileLoop(
    start_num IN NUMBER,
    end_num IN NUMBER
)
IS
    current_num NUMBER := start_num;
BEGIN
    WHILE current_num <= end_num LOOP
        DBMS_OUTPUT.PUT_LINE(current_num);
        current_num := current_num + 1;
    END LOOP;
END;
/
