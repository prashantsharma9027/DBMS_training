CREATE TABLE employee(
   ID   INT NOT NULL,
   NAME VARCHAR (20) NOT NULL,
   AGE INT NOT NULL,
   ADDRESS CHAR (25),
   SALARY   DECIMAL (18, 2),
   PRIMARY KEY (ID)
);

INSERT INTO employee (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (9403, 'prashant', 21, 'meerut', 200000.00 );

INSERT INTO employee (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (2, 'manav', 26, 'bangalore', 15000.00 );

INSERT INTO employee (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (3, 'prashant2', 23, 'mohali', 20000.00 );

INSERT INTO employee (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (4, 'prashant3', 25, 'Mumbai', 6500.00 );

INSERT INTO employee (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (5, 'prashant4', 27, 'Bhopal', 8500.00 );

INSERT INTO employee (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (6, 'prashant5', 22, 'MP', 4500.00 );


CREATE OR REPLACE TRIGGER display_salary_changes
BEFORE DELETE OR INSERT OR UPDATE ON employee
FOR EACH ROW
WHEN (NEW.ID > 0)
DECLARE
   sal_diff number;
BEGIN
   sal_diff := :NEW.salary  - :OLD.salary;
   dbms_output.put_line('Old salary: ' || :OLD.salary);
   dbms_output.put_line('New salary: ' || :NEW.salary);
   dbms_output.put_line('Salary difference: ' || sal_diff);
END;
/
