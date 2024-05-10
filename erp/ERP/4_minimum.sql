DECLARE
    min_value NUMBER;
BEGIN
    SELECT MIN(value) INTO min_value FROM my_array_table;
    DBMS_OUTPUT.PUT_LINE('Minimum Value: ' || min_value);
END;
/