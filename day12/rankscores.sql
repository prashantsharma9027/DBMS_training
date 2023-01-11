/*  Column Name | Type    |
+-------------+---------+
| id          | int     |
| score       | decimal |
+-------------+---------+
id is the primary key for this table.
Each row of this table contains the score of a game. Score is a floating point value with two decimal places.
  */



/* Scores table:
+----+-------+
| id | score |
+----+-------+
| 1  | 3.50  |
| 2  | 3.65  |
| 3  | 4.00  |
| 4  | 3.85  |
| 5  | 4.00  |
| 6  | 3.65  | */
create table Scores (id int primary key, score decimal(5,2));


insert into Scores (id, score) values (1, 3.50);
insert into Scores (id, score) values (2, 3.65);
insert into Scores (id, score) values (3, 4.00);
insert into Scores (id, score) values (4, 3.85);
insert into Scores (id, score) values (5, 4.00);
insert into Scores (id, score) values (6, 3.65);

select id, score, dense_rank() over (order by score desc) as rank from Scores;
--alternate solution
select id, score, rank() over (order by score desc) as rank from Scores;
