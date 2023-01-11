-- Write a program to find sum of all even numbers between 1 to n

DECLARE
    n NUMBER(10);
    sum NUMBER(10);
BEGIN
    n := 100;
    FOR i IN 1..n LOOP
        IF MOD(i, 2) = 0 THEN
            sum := sum + i;
            -- DBMS_OUTPUT.PUT_LINE(i);
        END IF;
    END LOOP;
END;




