
DECLARE
i NUMBER(2);
BEGIN
FOR i IN 1..5
LOOP
For j in 1..i
LOOP
DBMS_OUTPUT.PUT_LINE('THE CURRENT VALUE of j =' || j);

DBMS_OUTPUT.PUT_LINE('THE CURRENT VALUE of i =' || i);
End loop;
END LOOP;

END;


declare
  i number(2);
  j number(2);
begin
    for i in 1..5 loop
        for j in 1..i loop
        dbms_output.put('*');
        end loop;
        dbms_output.put_line(' ');
    end loop;
    end;


declare
  i number(2);
  j number(2);
begin
    for i in 1..5 loop
        for j in 1..5-i loop
        dbms_output.put(' ');
        end loop;
        for j in 1..i loop
        dbms_output.put('*');
        end loop;
        dbms_output.put_line(' ');
    end loop;
    end;

