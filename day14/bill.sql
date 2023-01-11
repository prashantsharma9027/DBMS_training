/* Write a  program to input electricity unit charges and calculate total electricity bill according to the given condition:
For first 50 units Rs. 0.50/unit
For next 100 units Rs. 0.75/unit
For next 100 units Rs. 1.20/unit
For unit above 250 Rs. 1.50/unit
An additional surcharge of 20% is added to the bill */

DECLARE
    unit NUMBER(10);
    bill NUMBER(10);
BEGIN

    unit := 100;
    bill := 0;

    IF unit <= 50 THEN
        bill := unit * 0.50;
    ELSIF unit <= 150 THEN
        bill := 50 * 0.50 + (unit - 50) * 0.75;
    ELSIF unit <= 250 THEN
        bill := 50 * 0.50 + 100 * 0.75 + (unit - 150) * 1.20;
    ELSE
        bill := 50 * 0.50 + 100 * 0.75 + 100 * 1.20 + (unit - 250) * 1.50;
    END IF;

    bill := bill + bill * 0.20;

    DBMS_OUTPUT.PUT_LINE('Total electricity bill is ' || bill);

END;

