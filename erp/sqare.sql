CREATE OR REPLACE PROCEDURE square (
  -- Number to be squared
  p_number IN NUMBER
)
IS
  v_square NUMBER;
BEGIN
  v_square := p_number * p_number;
  
END;
/

DECLARE
  v_num NUMBER := 5;
BEGIN
  square(v_num);
  
END;
/
