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

CREATE PACKAGE emp_sal AS
   PROCEDURE find_sal(e_id employee.id%type);
END emp_sal;
/

CREATE OR REPLACE PACKAGE BODY emp_sal AS

   PROCEDURE find_sal(e_id employee.id%TYPE) IS
   e_sal employee.salary%TYPE;
   BEGIN
      SELECT salary INTO e_sal
      FROM employee
      WHERE id = e_id;
      dbms_output.put_line('Salary: '|| e_sal);
   END find_sal;
END emp_sal;
/
