    DECLARE 
    a number; 
    b number; 
    c number;
    PROCEDURE Minimumm(p IN number, q IN number, r OUT number) IS 
    BEGIN 
        dbms_output.put_line('--- Prashant Sharma ----');
    IF p < q THEN 
        r:= p; 
    ELSE 
        r:= q; 
    END IF;   
    END;   
    BEGIN 
    a:= 9390; 
    b:= 9407; 
    Minimumm(a, b, c); 
    dbms_output.put_line(' Minimum of (9390, 9407) : ' || c); 
    END; 
