CREATE TABLE Student(student_id number(10), student_name varchar(20));

INSERT INTO Student VALUES(1,'Shivam');
INSERT INTO Student VALUES(2,'Prashant');
INSERT INTO Student VALUES(3,'Shubhankar');
INSERT INTO Student VALUES(4,'Kunal');
INSERT INTO Student VALUES(5,'Rohit');

CREATE TABLE Exam(exam_id number(10), student_id number(10), score number(10));

INSERT INTO Exam VALUES(10,1,70);
INSERT INTO Exam VALUES(10,2,80);
INSERT INTO Exam VALUES(10,3,90);
INSERT INTO Exam VALUES(20,1,80);
INSERT INTO Exam VALUES(30,1,70);
INSERT INTO Exam VALUES(30,3,80);
INSERT INTO Exam VALUES(30,4,90);
INSERT INTO Exam VALUES(40,1,60);
INSERT INTO Exam VALUES(40,2,70);
INSERT INTO Exam VALUES(40,4,80);

select distinct Student.*
from Student inner join Exam
on Student.student_id = Exam.student_id
where student.student_id not in 
    (select e1.student_id
    from Exam as e1 inner join
        (select exam_id, min(score) as min_score, max(score) as max_score
        from Exam
        group by exam_id) as e2
    on e1.exam_id = e2.exam_id
    where e1.score = e2.min_score or e1.score = e2.max_score)
order by student_id