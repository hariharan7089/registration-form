DECLARE
    i NUMBER := 1;
BEGIN
    WHILE i <= 10 LOOP
        DBMS_OUTPUT.PUT_LINE('Value: ' || i);
        i := i + 1;
    END LOOP;
END;
/