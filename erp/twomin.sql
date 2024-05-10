DECLARE
  -- Define your array type
  TYPE array_num IS TABLE OF NUMBER;
  
  -- Sample array variable
  v_numbers array_num := array_num(10, 20, 5, 35);  -- Example with some values
  
  -- Minimum and second minimum variables
  v_min1 NUMBER;
  v_min2 NUMBER;
BEGIN
  -- Assuming the array already has values
  
  -- Initialize minimums with first two elements (assuming they are not equal)
  v_min1 := v_numbers(1);
  v_min2 := v_numbers(2);
  
  IF v_min1 > v_min2 THEN
    -- Swap if the first element is larger
    v_min1 := v_numbers(2);
    v_min2 := v_numbers(1);
  END IF;
  
  FOR i IN 3 .. v_numbers.COUNT LOOP
    IF v_numbers(i) < v_min1 THEN
      -- Update minimum 1 and potentially minimum 2
      v_min2 := v_min1;
      v_min1 := v_numbers(i);
    ELSIF v_numbers(i) < v_min2 AND v_numbers(i) <> v_min1 THEN
      -- Update minimum 2 if it's larger than the current element and different from minimum 1
      v_min2 := v_numbers(i);
    END IF;
  END LOOP;
  
  DBMS_OUTPUT.PUT_LINE('First minimum value: ' || v_min1);
  DBMS_OUTPUT.PUT_LINE('Second minimum value: ' || v_min2);
END;
/
