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



-- use of exists
-- The EXISTS operator is used to test for the existence of any record in a subquery.

-- The EXISTS operator returns TRUE if the subquery returns one or more records.


select * from student
where exists (select * from details where student.id=details.id);

--not exists
-- The NOT EXISTS operator is used to test for the non-existence of any record in a subquery.

-- The NOT EXISTS operator returns TRUE if the subquery returns no records.


select * from student
where not exists (select * from details where student.id=details.id);

--all operator
-- The ALL operator is used to compare the value of an expression with all the values returned by a subquery.

-- The ALL operator returns TRUE if the condition is TRUE for all the records returned by the subquery.


select * from student
where id = ALL (select * from details where student.id=details.id);

--all keyword

select * from student
where id = ALL (select id from details where section =1 or section =802);

select * from students
where section = all(select section from details where section =802 );




select * from student
where id  = ALL (select id from details where section =802);

--not working
select * from student
where id = all (select id from details where section >=1);
