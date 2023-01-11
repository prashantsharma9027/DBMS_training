/* You are given a table, Projects, containing three columns: Task_ID, Start_Date and End_Date. It is guaranteed that the difference between the End_Date and the Start_Date is equal to 1 day for each row in the table.

If the End_Date of the tasks are consecutive, then they are part of the same project. Samantha is interested in finding the total number of different projects completed.
Write a query to output the start and end dates of projects listed by the number of days it took to complete the project in ascending order. If there is more than one project that have the same number of completion days, then order by the start date of the project.
Sample Input

Sample Output
2015-10-28 2015-10-29
2015-10-30 2015-10-31
2015-10-13 2015-10-15
2015-10-01 2015-10-04

Explanation
The example describes following four projects:
Project 1: Tasks 1, 2 and 3 are completed on consecutive days, so these are part of the project. Thus start date of project is 2015-10-01 and end date is 2015-10-04, so it took 3 days to complete the project.
Project 2: Tasks 4 and 5 are completed on consecutive days, so these are part of the project. Thus, the start date of project is 2015-10-13 and end date is 2015-10-15, so it took 2 days to complete the project.
Project 3: Only task 6 is part of the project. Thus, the start date of project is 2015-10-28 and end date is 2015-10-29, so it took 1 day to complete the project.
Project 4: Only task 7 is part of the project. Thus, the start date of project is 2015-10-30 and end date is 2015-10-31, so it took 1 day to complete the project.






Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
The STATION table is described as follows:

where LAT_N is the northern latitude and LONG_W is the western longitude.
Sample Input
For example, CITY has four entries: DEF, ABC, PQRS and WXY.
Sample Output
ABC 3
PQRS 4
Explanation
When ordered alphabetically, the CITY names are listed as ABC, DEF, PQRS, and WXY, with lengths  and . The longest name is PQRS, but there are  options for shortest named city. Choose ABC, because it comes first alphabetically.

 */

-- Path: day10/project.sql
/* You are given a table, Projects, containing three columns: Task_ID, Start_Date and End_Date. It is guaranteed that the difference between the End_Date and the Start_Date is equal to 1 day for each row in the table.

*/
create table Projects (Task_ID int, Start_Date date, End_Date date);
insert into Projects values (1, DATE'2015-10-01', DATE'2015-10-02');
insert into Projects values (2, DATE'2015-10-02', DATE'2015-10-03');
insert into Projects values (3, DATE'2015-10-03', DATE'2015-10-04');
insert into Projects values (4, DATE'2015-10-13', DATE'2015-10-14');
insert into Projects values (5, DATE'2015-10-14', DATE'2015-10-15');
insert into Projects values (6, DATE'2015-10-28', DATE'2015-10-29');
insert into Projects values (7, DATE'2015-10-30', DATE'2015-10-31');

/* select Start_Date, End_Date from Projects where End_Date = (select min(End_Date) from Projects);
select Start_Date, End_Date from Projects where End_Date = (select max(End_Date) from Projects);

select Start_Date, End_Date from Projects where End_Date = (select min(End_Date) from Projects) and Start_Date = (select min(Start_Date) from Projects);

select Start_Date, End_Date from Projects where End_Date = (select max(End_Date) from Projects) and Start_Date = (select max(Start_Date) from Projects);

select Start_Date, End_Date from Projects where End_Date = (select min(End_Date) from Projects) and Start_Date = (select min(Start_Date) from Projects) or End_Date = (select max(End_Date) from Projects) and Start_Date = (select max(Start_Date) from Projects);
 */

--  Write a query to output the start and end dates of projects listed by the number of days it took to complete the project in ascending order. If there is more than one project that have the same number of completion days, then order by the start date of the project.

--sample output
-- 2015-10-28 2015-10-29
-- 2015-10-30 2015-10-31
-- 2015-10-13 2015-10-15
-- 2015-10-01 2015-10-04

--  select Start_Date, End_Date from Projects where End_Date = (select min(End_Date) from Projects) and Start_Date = (select min(Start_Date) from Projects) or End_Date = (select max(End_Date) from Projects) and Start_Date = (select max(Start_Date) from Projects) order by Start_Date asc;
create table Projects (Task_ID int, Start_Date date, End_Date date);

insert into Projects values (1, DATE'2015-10-01', DATE'2015-10-02');
insert into Projects values (2, DATE'2015-10-02', DATE'2015-10-03');
insert into Projects values (3, DATE'2015-10-03', DATE'2015-10-04');
insert into Projects values (4, DATE'2015-10-13', DATE'2015-10-14');
insert into Projects values (5, DATE'2015-10-14', DATE'2015-10-15');
insert into Projects values (6, DATE'2015-10-28', DATE'2015-10-29');
insert into Projects values (7, DATE'2015-10-30', DATE'2015-10-31');



select * from projects;



    SELECT Start_Date, min(End_Date) AS Date_Difference,

    (MIN(end_DAte)-Start_date) as days_
    FROM
    (SELECT Start_Date FROM Projects WHERE Start_Date NOT IN (SELECT End_Date FROM Projects)) a ,
    (SELECT End_Date FROM Projects WHERE End_Date NOT IN (SELECT Start_Date FROM Projects)) b
    WHERE Start_Date < End_Date
    GROUP BY Start_Date
    ORDER BY (MIN(end_Date)-Start_date)  asc;



-- Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
-- The STATION table is described as follows:


-- where LAT_N is the northern latitude and LONG_W is the western longitude.
-- Sample Input
-- For example, CITY has four entries: DEF, ABC, PQRS and WXY.
-- Sample Output
-- Sample Output
-- ABC 3
-- PQRS 4

create table STATION (ID int, CITY varchar(21), STATE varchar(2), LAT_N decimal(4,2), LONG_W decimal(4,2));
insert into STATION values (1, 'DEF', 'CA', 33.8, 1.4);
insert into STATION values (2, 'ABC', 'CA', 33.8, 1.4);
insert into STATION values (3, 'PQRS', 'CA', 33.8, 1.4);
insert into STATION values (4, 'WXY', 'CA', 33.8, 1.4);


select CITY, length(CITY) from STATION order by length(CITY) asc limit 1;
--not properly ended

