drop table Logs;
create table Logs (id number primary key, num number);

insert into Logs (id, num) values (1, 1);
insert into Logs (id, num) values (2, 1);
insert into Logs (id, num) values (3, 1);
insert into Logs (id, num) values (4, 2);
insert into Logs (id, num) values (5, 1);
insert into Logs (id, num) values (6, 2);
insert into Logs (id, num) values (7, 2);

select * from Logs;
select num from Logs group by num having count(num) >= 3;



SELECT DISTINCT
    l1.Num AS ConsecutiveNums
FROM
    Logs l1,
    Logs l2,
    Logs l3
WHERE
    l1.Id = l2.Id - 1
    AND l2.Id = l3.Id - 1
    AND l1.Num = l2.Num
    AND l2.Num = l3.Num;


SELECT DISTINCT num
FROM
(
SELECT num,LEAD(num) OVER(ORDER BY id) AS lead, LAG(num) OVER (ORDER BY id) AS lag
FROM logs
)t
WHERE num=lead and num=lag;
