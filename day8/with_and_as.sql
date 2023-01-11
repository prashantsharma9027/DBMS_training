drop table student;
create table student(
id number(5),
full_name varchar2(30),
phone_number number(10)
);


insert into student values(9403, 'prashant', 8630539308);
insert into student values(8285, 'Manav', 7462849156);
insert into student values(9108, 'Arti Rani', 6382916754);
insert into student values(9118, 'Khushi Verma', 9826743218);
insert into student values(9123, 'Kiara', 5678321567);
insert into student values(1000, 'abc', 5678321567);
insert into student values(2000, 'def', 5678321567);
drop table details;
create table details(
id number(4),
department varchar(20),
section number(3));



insert into details values(9403, 'Computer Science', 1);
insert into details values(8285, 'Computer Science', 801);
insert into details values(9108, 'Biotechnology', 802);
insert into details values(9118, 'Biotechnology', 802);
insert into details values(9123, 'Mechatronics', 803);
insert into details values(1111, 'Biotechnology', 802);
insert into details values(2222, 'Mechatronics', 803);


-- with student_details as(id,full_name,section) AS(

-- select id,full_name,section from student
-- where exists (select * from details where student.id=details.id)
-- )


--use with and as with join statement
with student_details as(id,full_name,section) AS(

select id,full_name,section from student
inner join details on student.id=details.id
)


