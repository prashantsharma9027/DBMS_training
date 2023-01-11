
CREATE OR REPLACE FUNCTION max1
    (p_num1 NUMBER,p_num2 NUMBER) RETURN NUMBER
    AS
    v_max NUMBER;
    BEGIN
        if p_num1>p_num2 then
            v_max:=p_num1;
        else
            v_max:=p_num2;
        end if;

        RETURN v_max;
END;
/

Declare
v_max number;

BEGIN
    v_max:=max1(10,20);
       dbms_output.put_line('hello' || v_max);

END;
/
