/* Write a PL/SQL program to check whether a given character is letter or digit. */

DECLARE
  ch CHAR(1);
    v_isdigit NUMBER;
    v_isalpha NUMBER;
BEGIN
    ch := 'a';
    v_isdigit := isdigit(ch);
    v_isalpha := isalpha(ch);
    IF v_isdigit = 1 THEN
        dbms_output.put_line('The character is a digit');
    ELSE
        dbms_output.put_line('The character is not a digit');
    END IF;
    IF v_isalpha = 1 THEN
        dbms_output.put_line('The character is a letter');
    ELSE
        dbms_output.put_line('The character is not a letter');
    END IF;
    END;
/
