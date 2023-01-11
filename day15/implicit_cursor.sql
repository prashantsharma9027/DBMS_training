create table emp(sno number(10), fname varchar(20), eid number(10),salary number(20));
insert into emp values(001,'JAMES',101,20000);
select * from emp;



DECLARE
    total_rows number(2);
BEGIN
    UPDATE  emp
    SET salary = salary + 5000;
    IF sql%notfound THEN
        dbms_output.put_line('no customers updated');
    ELSIF sql%found THEN
      total_rows := sql%rowcount;
      dbms_output.put_line( total_rows || ' customers updated ');
   END IF;
END;
/
