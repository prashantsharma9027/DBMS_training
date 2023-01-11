--create procedure giving minimum of two numbers
CREATE OR REPLACE PROCEDURE min
    (p_num1 NUMBER,p_num2 NUMBER,p_min OUT NUMBER) AS

BEGIN
    if p_num1<p_num2 then
        p_min:=p_num1;
    else

        p_min:=p_num2;
    end if;
    dbms_output.put_line(p_min);
    END;
--execute min

