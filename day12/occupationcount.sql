/* Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:
There are a total of [occupation_count] [occupation]s.
where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.
Note: There will be at least two entries in the table for each type of occupation. */


/*
Sample Output
Ashely(P)
Christeen(P)
Jane(A)
Jenny(D)
Julia(A)
Ketty(P)
Maria(A)
Meera(S)
Priya(S)
Samantha(D)
There are a total of 2 doctors.
There are a total of 2 singers.
There are a total of 3 actors.
There are a total of 3 professors. */


create table occupations (name varchar(255), occupation varchar(255));
--samantha doctor
--julia actor
--maria actor

insert into occupations (name, occupation) values ('samantha', 'doctor');
insert into occupations (name, occupation) values ('julia', 'actor');
insert into occupations (name, occupation) values ('maria', 'actor');
--meera singer
--priya singer

insert into occupations (name, occupation) values ('meera', 'singer');

--ashley professor
--ketty professor
--christian professor

insert into occupations (name, occupation) values ('ashley', 'professor');
insert into occupations (name, occupation) values ('ketty', 'professor');
insert into occupations (name, occupation) values ('christian', 'professor');

--jenny doctor
--jane actor

insert into occupations (name, occupation) values ('jane', 'actor');
insert into occupations (name, occupation) values ('jenny', 'doctor');
insert into occupations (name, occupation) values ('priya', 'singer');


/* Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S). */

--not working because concat only joins two in oracle
select concat(name, '(', substr(occupation, 1, 1), ')') from occupations order by name;

--for oracle using || instead of concat

select name || '(' || substr(occupation, 1, 1) || ')' from occupations order by name;
--as names

select name || '(' || substr(occupation, 1, 1) || ')' as names from occupations order by name;

select name || '(' || upper(substr(occupation, 1, 1)) || ')' as names from occupations order by name;

--select concat(name, '(', substr(occupation, 1, 1), ')') from occupations order by name;

--not working because concat only joins two in oracle
select concat('There are a total of ', count(occupation), ' ', lower(occupation), 's.') from occupations group by occupation order by count(occupation), occupation;

--use || instead of concat for oracle

select 'There are a total of ' || count(occupation) || ' ' || lower(occupation) || 's.' from occupations group by occupation order by count(occupation), occupation;
--as total_occupations

select 'There are a total of ' || count(occupation) || ' ' || lower(occupation) || 's.' as total_occupations from occupations group by occupation order by count(occupation), occupation;

