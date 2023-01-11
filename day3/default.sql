DROP TABLE Student;
CREATE TABLE Student(
SID INT,
SNAME VARCHAR(20) NOT NULL,
joindate DATE DEFAULT to_date('01-01-2021','dd-mm-yyyy'),
CONSTRAINT PK PRIMARY KEY(PID)
);

--insert collumnwise values
insert into Student2(STU_ID,STUNAME) values(9999,'abcd');



-- select 10+ NULL from dual; doesnt work
select avg(nvl(salary,0)) from employee;

--virtual using derived to create a collumn

