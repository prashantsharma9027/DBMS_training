DECLARE 
   num number; 
   factorial number;  
   
FUNCTION calculateFact(x number) 
RETURN number  
IS 
   f number; 
BEGIN 
   IF x = 0 THEN 
      f := 1; 
   ELSE 
      f := x * calculateFact(x-1); 
   END IF; 
RETURN f; 
END;  

BEGIN 
   num:= 6; 
   factorial := calculateFact(num); 
   DBMS_OUTPUT.PUT_LINE(' Factorial '|| num || ' is ' || factorial); 
END;       