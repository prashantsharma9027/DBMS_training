-- update salary of all employees by 10% using plsql without using procedure.

update employees set salary=salary+(salary*10/100);



create or replace procedure increment_salary
(p_empid employees.empid%type) as
begin
update employees set salary=salary+(salary*10/100) where empid=p_empid;
end;



-- update salary set salary=salary+(salary*10/100) where empid=1;






-- Path: day13/incrementsalary.sql
