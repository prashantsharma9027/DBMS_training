/* Write a program to print Pascal triangle upto 5 rows */



DECLARE
  row_num_ NUMBER := 5;
BEGIN
    FOR i IN 0..row_num_ LOOP
      DBMS_OUTPUT.PUT_LINE(' ' || LPAD(' ', row_num_ - i, ' ') || RPAD('*', 2 * i - 1, '*'));

    END LOOP;
END;
/

