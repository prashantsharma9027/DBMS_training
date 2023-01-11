--procedure to find square of a number and return it using in out
-- CREATE OR REPLACE PROCEDURE square
--     (p_num IN NUMBER,p_sq OUT NUMBER) AS
--

DECLARE
   a number;
PROCEDURE squareNum(x IN OUT number) IS
BEGIN
  x := x * x;
END;
BEGIN
   a:= 15;
   squareNum(a);
   dbms_output.put_line(' Square of (15): ' || a);
END;
/


