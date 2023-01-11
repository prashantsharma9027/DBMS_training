/*
*
**
***
****
*****
*/

-- Path: day13/patternprint.sql

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


/*
   *
  **
 ***
****

 */

-- Path: day13/patternprint.sql

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
