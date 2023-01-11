drop table student;
create table student(
s_name    varchar(10),
roll      int,
city      varchar(10),
section    varchar(10),
bal_due    float(5)
);

insert all
into student VALUES('joe',1, 'Delhi','20B', 10000)
into student VALUES('Rock',2, 'Mumbai','20B', 12000)
into student VALUES('chandler',3, 'Mumbai','20B', 100)
select 1 from dual;



insert into student VALUES('chandler',4, 'Mumbai','20B', 100);

insert into student VALUES('aman',4, 'Mumbai','20B', 100);
insert into student VALUES('ala',4, 'Mumbai','20B', 100);

insert into student VALUES('ila',4, 'Mumbai','20B', 100);

-----aggeregate function
SELECT AVG(BAL_DUE) "AVERAGE" FROM STUDENT;

SELECT MAX(BAL_DUE) "MAXIMUM" FROM STUDENT;


SELECT MIN(BAL_DUE) FROM STUDENT;

SELECT SUM(BAL_DUE) "TOTAL" FROM STUDENT;
 --count number of rows in table
SELECT COUNT(*) FROM STUDENT;
 --count number of names in table
SELECT COUNT(S_NAME) FROM STUDENT;

select Distinct(S_NAME) From STUDENT;

--select distinct students not beginning and ending with vowel

select Distinct(S_NAME) From STUDENT
where NOT REGEXP_like (S_NAME ,'(^[aeiou])','i')
and NOT REGEXP_like (S_NAME,'([aeiou]$)','i');

--not working
select Distinct(S_NAME) From STUDENT
where substr(S_NAME,1,1) NOT IN ('a','e','i','o','u') ;
and substr(S_NAME,-1) NOT IN  ('a','e','i','o','u') ;

-- code using substr
select distinct(name) from EMP
where substr(name,-1, 1) not IN ('a', 'e', 'i', 'o', 'u');

--worked after taking varchar
SELECT DISTINCT(s_name) FROM student WHERE NOT REGExp_like(s_name,'(^[aeiou])','i')
AND NOT REGExp_like(s_name,'([aeiou]$)','i');

SELECT ROUND (6.54,1) from dual;



-- -- i used for case insensitivity
-- Select s_name from student
--  where s_name like '[aeiou]%' and s_name like '%[aeiou]';
