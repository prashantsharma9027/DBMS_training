
/* Write a program to count number of digits in a number. */
DECLARE
num NUMBER(10);
count NUMBER(10);
BEGIN
num := 123456789;
count := 0;
WHILE num > 0
LOOP
num:=floor(num/10);
-- num := num / 10;
count := count + 1;
END LOOP;
DBMS_OUTPUT.PUT_LINE('Number of digits in the number is ' || count);
END;
/
