--num to word

/* Write a program to enter a number and print it in words */
declare
    num number := 123345;
begin
    dbms_output.put_line(length(num));
end;


declare
    num number := 12345;
    str varchar2(1000);
begin
    str := to_char(to_date(num, 'J'), 'Jsp');
    dbms_output.put_line(str);
end;
