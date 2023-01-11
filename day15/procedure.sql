CREATE OR REPLACE PROCEDURE hello
    AS
BEGIN
   dbms_output.put_line('Hello World!');
END;
/


Declare
begin
hello;
END;
/

execute hello;

--procedure with select statement
CREATE OR REPLACE PROCEDURE hello
    AS
BEGIN

    for i in (select * from emp) loop
        dbms_output.put_line(i.ename);
    end loop;
    END;

--procedure with parameter
CREATE OR REPLACE PROCEDURE hello
    (p_empno emp.empno%type) AS
BEGIN
    for i in (select * from emp where empno=p_empno) loop
        dbms_output.put_line(i.ename);
    end loop;
    END;
--execute hello
execute hello(7369);


--create emp table with city
drop table emp;
CREATE TABLE emp
(
    empno NUMBER(4) NOT NULL,
    ename VARCHAR2(10) NOT NULL,
    job VARCHAR2(9) NOT NULL,
    mgr NUMBER(4),
    hiredate DATE NOT NULL,
    sal NUMBER(7,2) NOT NULL,
    comm NUMBER(7,2),
    deptno NUMBER(2) NOT NULL,
    city VARCHAR2(20)
);

--insert data into emp table
INSERT INTO emp VALUES (7369,'SMITH','CLERK',7902,TO_DATE('17-DEC-80','DD-MON-RR'),800,NULL,20,'chandigarh');
--insert data into emp table
INSERT INTO emp VALUES (7499,'ALLEN','SALESMAN',7698,TO_DATE('20-FEB-81','DD-MON-RR'),1600,300,30,'meerut');
--insert data into emp table
INSERT INTO emp VALUES (7521,'WARD','SALESMAN',7698,TO_DATE('22-FEB-81','DD-MON-RR'),1250,500,30,'delhi');




--name of employees who are living in chandigarh
CREATE OR REPLACE PROCEDURE emp_in_chandigarh
    AS
BEGIN
    for i in (select * from emp where ename in (select ename from emp where city='chandigarh')) loop
        dbms_output.put_line(i.ename);
    end loop;
    END;

execute emp_in_chandigarh;

--name of employees who are living in chandigarh
