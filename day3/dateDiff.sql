drop table employee;
create table employee
(
emp_id    number ,
hiredate DATE,
leavedate DATE,
CONSTRAINT PK PRIMARY KEY(emp_id)
);


insert into employee values(1,DATE'2001-08-22',DATE '2002-08-22');
insert into employee values(2,DATE'2000-07-22',DATE '2021-09-22');
insert into employee values(3,DATE'2001-08-11',DATE '2022-03-25');
insert into employee values(4,DATE'2001-08-14',DATE '2022-03-05');

SELECT emp_id,hiredate, leavedate,
DATEDIFF(month, hiredate, leavedate) AS DateDiff;


-- SELECT
--   id,
--   departure,
--   arrival,
--   DATEDIFF(day, departure, arrival) AS date_difference,
--   DATEDIFF(day, departure, arrival) + 1 AS days_inclusive
-- FROM travel;

--get date difference in months
-- SELECT
--   id,
--   departure,
--   arrival,
--   DATEDIFF(month, departure, arrival) AS date_difference,
