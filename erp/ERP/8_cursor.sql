DECLARE
    CURSOR emp_cursor IS
        SELECT * FROM employees;
    v_emp_rec employees%ROWTYPE;
BEGIN
    OPEN emp_cursor;
    LOOP
        FETCH emp_cursor INTO v_emp_rec;
        EXIT WHEN emp_cursor%NOTFOUND;
        -- Process each employee record here
    END LOOP;
    CLOSE emp_cursor;
EXCEPTION
    WHEN others THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
        -- Handle the error appropriately
END;
/