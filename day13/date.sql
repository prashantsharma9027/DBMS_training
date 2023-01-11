-- get if a date is a weekend or not
-- 1 = weekend, 0 = weekday
--

--without user input
declare
v_day number;
-- dt1 date;
begin
-- dt1 date:= to_date(:dt1,'DD-MM-YYYY');

    v_day := to_char(DATE'2023-01-01', 'd');
    if v_day in (1, 7) then
        dbms_output.put_line('yes');
    else
        dbms_output.put_line('no');
    end if;
    end;
/

--with user input




    select to_char(date'2023-01-02', 'd') day_number
from   dual


--with user input not working
declare
v_day number;
dt1 Date;
begin
dt1 Date:= to_date(':dt1','DD-MM-YYYY');

    -- v_day := to_char(DATE'2023-01-01', 'd');
    v_day := to_char(dt1, 'd');
    if v_day in (1, 7) then
        dbms_output.put_line('yes');
    else
        dbms_output.put_line('no');
    end if;
    end;
/


