DECLARE
   num number;
   factorial number;

FUNCTION find_factorial(x number)
RETURN number
IS
   factorial_num number;
BEGIN
   IF x=0 THEN
      factorial_num := 1;
   ELSE
      factorial_num := x * find_factorial(x-1);
   END IF;
RETURN factorial_num;
END;

BEGIN
   num:= 7;
   factorial := find_factorial(num);
   dbms_output.put_line(' Factorial of '|| num || ' is ' || factorial);
END;
/
