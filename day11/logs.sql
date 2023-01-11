/* Table: Logs

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| num         | varchar |
+-------------+---------+
id is the primary key for this table.
id is an autoincrement column.


Write an SQL query to find all numbers that appear at least three times consecutively.

Return the result table in any order.

The query result format is in the following example.

 */

create table Logs (id number primary key, num number)

insert into Logs (id, num) values (1, 1)
insert into Logs (id, num) values (2, 1)
insert into Logs (id, num) values (3, 2)
insert into Logs (id, num) values (4, 2)
insert into Logs (id, num) values (5, 2)
select num from Logs group by num having count(num) >= 3


/*

 1  | 1   |
| 2  | 1   |
| 3  | 1   |
| 4  | 2   |
| 5  | 1   |
| 6  | 2   |
| 7  | 2    */
