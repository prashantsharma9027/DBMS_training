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

--function with table to return total count of employees

CREATE OR REPLACE FUNCTION emp_count
    RETURN NUMBER
    AS
    v_count NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_count FROM emp;
        RETURN v_count;
END;
/

Declare
v_count number;
BEGIN
    v_count:=emp_count();
       dbms_output.put_line( v_count);

END;
/
