
--create employee table
drop table employee;
CREATE TABLE employee (
   id NUMBER(5) PRIMARY KEY,
   name VARCHAR2(20),
   address VARCHAR2(20)
);

--insert some data
INSERT INTO employee VALUES (1, 'prashant', 'Meerut');
INSERT INTO employee VALUES (2, 'Manav', 'Bangalore');
INSERT INTO employee VALUES (3, 'prashant', 'Bangalore');

DECLARE
   e_id employee.id%type;
   e_name employee.name%type;
   e_addr employee.address%type;
   CURSOR e_employee is
      SELECT id, name, address FROM employee;
BEGIN
   OPEN e_employee;
   LOOP
      FETCH e_employee into e_id, e_name, e_addr;
      EXIT WHEN e_employee%notfound;
      dbms_output.put_line(e_id || ' ' || e_name || ' ' || e_addr);
   END LOOP;
   cLOSE e_employee;
END;
/
