create table employee
(
emp_id    number ,
Fname  varchar2(10) NOT NULL,
Eaddress  varchar2(10),
salary    number,
hiredate DATE,
CONSTRAINT PK PRIMARY KEY(emp_id)
);

desc employee;

insert into employee values(1,'prashant','Meerut',40000,DATE'2001-08-22');

insert into employee values(2,'prashant2','delhi1',80000,DATE'2020-08-22');
insert into employee values(3,'prashant3','delhi2',90000,DATE'2021-08-22');
insert into employee values(4,'prashant4','delhi3',10003,DATE'2022-08-22');
insert into employee values(5,'prashant5','delhi4',100001,DATE'2023-08-22');
insert into employee values(6,'prashant6','delhi5',100002,DATE'2024-08-22');

select * from employee;

--working
update employee set salary =
Case
 when salary > 40000 then 100000
 else 20000
end;







--working
select emp_id, Fname, Eaddress, salary, hiredate,
case
when salary between 40000 and 90000 then 'low'
when salary between 90000 and 100000 then 'medium'
else 'high'
end as salary_range
from employee;

