CREATE TABLE student(
    student_id INT NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    specialization VARCHAR(50) NOT NULL,
    course VARCHAR(50) NOT NULL,
    PRIMARY KEY(student_id)
);
CREATE TABLE student_cgpa(
    student_id INT NOT NULL,
    cgpa FLOAT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES student(student_id)
);
CREATE TABLE student_details(
    student_id INT NOT NULL,
    blood_group VARCHAR(3) NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(255) NOT NULL,
    FOREIGN KEY (student_id) REFERENCES student(student_id)
);
desc student;

insert into student values(1, 'prashant', 'Guglani', 'DSA', 'Cse');
insert into student values(2, 'Ashutosh', 'Pagrotra', 'iot', 'Cse');
insert into student values(3, 'Piyush', 'Sharma', 'iot', 'Cse');
update student set course='M.Tech' where student_id= 3;
update student set course='B.Tech' where student_id= 1;
update student set course='B.Tech' where student_id= 2;
insert into student values(4, 'Madhav', 'Sharma', 'iot', 'M.Tech');

select *from student;

insert into student_cgpa values(1, 8.9);
insert into student_cgpa values(2, 7);
insert into student_cgpa values(3, 9.4);
insert into student_cgpa values(4, 9);


with cte1(student_id, student_fullname, cgpa)
as
(
    select student.student_id, concat(concat(student.first_name,' '), student.last_name) as student_fullname, student_cgpa.cgpa
    from student
    join student_cgpa
    on student.student_id= student_cgpa.student_id
    where student_cgpa.cgpa>= 7.5
)

select student_id, student_fullname, cgpa from cte1;

select * from student;
select * from student_cgpa;

insert into student_details values(1, 'B+', 'Amritsar', '7814328339', 'prashant22@gmail.com');
insert into student_details values(2, 'B+', 'Rajasthan', '9876543210', 'ashutosh12@gmail.com');
insert into student_details values(3, '0+', 'Shimla', '1880188000', 'piyush12@gmail.com');
update student_details set blood_group= 'B-' where student_id= 2;

with cte2(student_id, student_fullname, blood_group, phone, address)
as
(
    select student.student_id, concat(student.first_name, student.last_name) as student_fullname, student_details.blood_group, student_details.phone, student_details.address
    from student
    join student_details
    on
    student.student_id= student_details.student_id
    where student_details.blood_group in ('B+', 'B-', '0+')
)
select student_id, student_fullname, blood_group, phone, address from cte2;
select * from student_details;

with cte3(course1, numberof_students1, avg_cgpa1)
as
(
    select 'B.Tech' as course1, count(student.student_id) as numberof_students1, avg(student_cgpa.cgpa) as avg_cgpa1
    from student
    join student_cgpa
    on
    student.student_id= student_cgpa.student_id
    where student.course= 'B.Tech'
)
select course1, numberof_students1, avg_cgpa1 from cte3;

with cte4(course1, numberof_students1, avg_cgpa1)
as
(
    select 'M.Tech' as course1, count(student.student_id) as numberof_students1 , avg(student_cgpa.cgpa) as avg_cgpa1
    from student
    join student_cgpa
    on
    student.student_id= student_cgpa.student_id
    where student.course in('M.Tech')
)
select course1, numberof_students1, avg_cgpa1 from cte4;

select count(student_id) from student;
