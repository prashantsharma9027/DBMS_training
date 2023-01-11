drop table employee;
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

insert into employee values(1,'Paras','Meerut',40000,DATE'2001-08-22');

insert into employee values(2,'Paras2','delhi1',80000,DATE'2020-08-22');
insert into employee values(3,'Paras3','delhi2',90000,DATE'2021-08-22');
insert into employee values(4,'Paras4','delhi3',10003,DATE'2022-08-22');
insert into employee values(5,'Paras5','delhi4',100001,DATE'2023-08-22');
insert into employee values(6,'Paras6','delhi5',100002,DATE'2024-08-22');

select * from employee;

alter table employee
add phone NUMBER UNIQUE;

desc employee;

update employee set phone=8630539308
where emp_id=1;
delete from employee
where emp_id=5;

--adding a constraint
-- ALTER TABLE employee
-- ADD Primary key(emp_id);

-- truncate table employee;

select * from employee;

CREATE TABLE department(
    d_id NUMBER(5) ,
    CONSTRAINT PKa PRIMARY KEY(d_id),
    emp_id Number,
    d_name VARCHAR(25),
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
);
desc department;

desc employee;

Select name from employee
 where name like 'aeiou%' and name like '%aeiou';

select sysdate from dual;
