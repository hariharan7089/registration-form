DECLARE
    duplicate_count NUMBER := 0;
BEGIN
    FOR rec IN (SELECT value, COUNT(*) cnt FROM my_table GROUP BY value HAVING COUNT(*) > 1) LOOP
        DBMS_OUTPUT.PUT_LINE('Duplicate Value: ' || rec.value || ', Count: ' || rec.cnt);
        duplicate_count := duplicate_count + 1;
    END LOOP;

    IF duplicate_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No duplicate values found.');
    END IF;
END;
/