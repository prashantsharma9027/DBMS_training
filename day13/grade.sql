/* Write a PL/SQL program to display the description against a grade. */


DECLARE
  grade CHAR(1);
  v_grade NUMBER;
BEGIN
    grade := 'A';
    v_grade := to_number(grade);
    IF v_grade = 1 THEN
        dbms_output.put_line('Excellent');
    ELSIF v_grade = 2 THEN
        dbms_output.put_line('Very Good');
    ELSIF v_grade = 3 THEN
        dbms_output.put_line('Good');
    ELSIF v_grade = 4 THEN
        dbms_output.put_line('Average');
    ELSIF v_grade = 5 THEN
        dbms_output.put_line('Poor');
    ELSE
        dbms_output.put_line('Invalid grade');
    END IF;
    END;
