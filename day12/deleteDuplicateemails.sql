/* Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |
+-------------+---------+
id is the primary key column for this table.
Each row of this table contains an email. The emails will not contain uppercase letters.

Write an SQL query to delete all the duplicate emails, keeping only one unique email with the smallest id. Note that you are supposed to write a DELETE statement and not a SELECT one.
After running your script, the answer shown is the Person table. The driver will first compile and run your piece of code and then show the Person table. The final order of the Person table does not matter.
The query result format is in the following example. */

create table Person (id int primary key, email varchar(255))

/* Person table:
+----+------------------+
| id | email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
| 3  | john@example.com |
+----+------------------+
Output:
+----+------------------+
| id | email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  | */

insert into Person (id, email) values (1, 'john@example.com')
insert into Person (id, email) values (2, 'bob@example.com')
insert into Person (id, email) values (3, 'john@example.com')


delete from Person where id not in (select id from (select id, min(id) over (partition by email) as min_id from Person) as t where t.id = t.min_id)


/* Output:
+----+------------------+
| id | email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com
 */

delete from Person where id not in (select id from (select id, min(id) over (partition by email) as min_id from Person) as t where t.id = t.min_id)
--alternate solution
delete from Person where id not in (select min(id) from Person group by email)

